------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--         Localization, Internationalization, Globalization for Ada        --
--                                                                          --
--                        Runtime Library Component                         --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Copyright © 2009 Vadim Godunko <vgodunko@gmail.com>                      --
--                                                                          --
-- Matreshka is free software;  you can  redistribute it  and/or modify  it --
-- under terms of the  GNU General Public License as published  by the Free --
-- Software  Foundation;  either version 2,  or (at your option)  any later --
-- version.  Matreshka  is distributed in the hope that it will be  useful, --
-- but   WITHOUT  ANY  WARRANTY;  without  even  the  implied  warranty  of --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General --
-- Public License for more details.  You should have received a copy of the --
-- GNU General Public License distributed with Matreshka; see file COPYING. --
-- If not, write  to  the  Free Software Foundation,  51  Franklin  Street, --
-- Fifth Floor, Boston, MA 02110-1301, USA.                                 --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
--                                                                          --
------------------------------------------------------------------------------
--  $Revision$ $Date$
------------------------------------------------------------------------------
with Matreshka.Internals.Ucd.Core;
with Matreshka.Internals.Ucd.Norms;
with Matreshka.Internals.Utf16;

package body Matreshka.Internals.Unicode.Normalization is

   use Matreshka.Internals.Strings;
   use Matreshka.Internals.Ucd;
   use Matreshka.Internals.Utf16;

   generic
      Form          : Normalization_Form;
      Decomposition : Decomposition_Kinds;

   procedure Generic_Decomposition
    (Source      : not null Matreshka.Internals.Strings.Internal_String_Access;
     Destination : in out Matreshka.Internals.Strings.Internal_String_Access);

   generic
      Form          : Normalization_Form;
      Decomposition : Decomposition_Kinds;

   procedure Generic_Decomposition_Composition
    (Source      : not null Matreshka.Internals.Strings.Internal_String_Access;
     Destination : in out Matreshka.Internals.Strings.Internal_String_Access);

   procedure Reorder_Last_Character
    (Destination : Internal_String_Access;
     First       : Positive;
     Last        : Positive);
   --  Move last character in the string to follow Canonical Ordering.

   ----------------------------
   -- Reorder_Last_Character --
   ----------------------------

   procedure Reorder_Last_Character
    (Destination : Internal_String_Access;
     First       : Positive;
     Last        : Positive)
   is
      Previous_Class : Canonical_Combining_Class;
      Class          : Canonical_Combining_Class;
      Previous       : Positive;
      Aux            : Positive;
      Current        : Positive;
      Code_A         : Code_Point;
      Code_B         : Code_Point;
      Restart        : Boolean;

   begin
      --  XXX It is more efficient to use backward bulk sort: all characters
      --  in the substring always sorted, so we need just to move last
      --  character to appropriate position.

      loop
         Restart := False;

         Current := First;
         Previous := Current;
         Unchecked_Next (Destination.Value, Current, Code_A);
         Previous_Class :=
           Core.Property
            (First_Stage_Index (Code_A / 16#100#))
            (Second_Stage_Index (Code_A mod 16#100#)).CCC;

         loop
            Aux := Current;
            Unchecked_Next (Destination.Value, Current, Code_B);

            Class :=
              Core.Property
               (First_Stage_Index (Code_B / 16#100#))
               (Second_Stage_Index (Code_B mod 16#100#)).CCC;

            if Previous_Class > Class then
               Unchecked_Store (Destination.Value, Previous, Code_B);
               Current := Previous;
               Unchecked_Store (Destination.Value, Current, Code_A);
               Restart := True;

            else
               Previous_Class := Class;
               Previous := Aux;
               Code_A := Code_B;
            end if;

            exit when Current >= Last;
         end loop;

         exit when not Restart;
      end loop;
   end Reorder_Last_Character;

   ---------------------------
   -- Generic_Decomposition --
   ---------------------------

   procedure Generic_Decomposition
    (Source      : not null Matreshka.Internals.Strings.Internal_String_Access;
     Destination : in out Matreshka.Internals.Strings.Internal_String_Access)
   is
      type Starter_State is record
         D_Next : Positive := 1;
      end record;

      S_Index    : Positive := 1;
      Code       : Code_Point;
      Length     : Natural  := 0;
      Last_Class : Canonical_Combining_Class := 0;
      Class      : Canonical_Combining_Class;
      Starter    : Starter_State;

   begin
      if Source.Last = 0 then
         Destination := Shared_Empty'Access;
         Reference (Destination);

         return;
      end if;

      --  Try to do Normalization Form quick check.

      declare
         S_Previous : Positive;

      begin
         while S_Index <= Source.Last loop
            S_Previous := S_Index;

            Unchecked_Next (Source.Value, S_Index, Code);
            Class :=
              Core.Property
               (First_Stage_Index (Code / 16#100#))
               (Second_Stage_Index (Code mod 16#100#)).CCC;

            if Class /= 0 then
               if Last_Class > Class then
                  --  Canonical Ordering is violated.

                  S_Index := S_Previous;

                  exit;
               end if;

            else
               Starter := (D_Next => S_Index);
            end if;

            case Core.Property
               (First_Stage_Index (Code / 16#100#))
               (Second_Stage_Index (Code mod 16#100#)).NQC (Form)
            is
               when No | Maybe =>
                  S_Index := S_Previous;

                  exit;

               when Yes =>
                  null;
            end case;

            Last_Class := Class;
            Length := Length + 1;
         end loop;
      end;

      if S_Index > Source.Last then
         Destination := Source;
         Reference (Destination);

         return;
      end if;

      --  Source is not in Normalization Form probably, so start more complex
      --  algorithm.

      Destination := new Internal_String (Source.Size);

      Destination.Value (1 .. S_Index - 1) := Source.Value (1 .. S_Index - 1);
      Destination.Last   := S_Index - 1;
      Destination.Length := Length;

      while S_Index <= Source.Last loop
         Unchecked_Next (Source.Value, S_Index, Code);

         declare

            procedure Common_Append (Code : Code_Point);
            --  Common algorithm to append character exclude Hangul Syllable,
            --  decomposition and appending of which are done using special
            --  algorithm.

            -------------------
            -- Common_Append --
            -------------------

            procedure Common_Append (Code : Code_Point) is
            begin
               Class :=
                 Core.Property
                  (First_Stage_Index (Code / 16#100#))
                  (Second_Stage_Index (Code mod 16#100#)).CCC;

               Append (Destination, Code, Source.Last - S_Index + 1);

               if Class /= 0 then
                  if Last_Class > Class then
                     --  Canonical Ordering is violated, reorder result.

                     Reorder_Last_Character
                      (Destination, Starter.D_Next, Destination.Last + 1);

                  else
                     Last_Class := Class;
                  end if;

               else
                  Starter := (D_Next => Destination.Last + 1);
                  Last_Class := Class;
               end if;
            end Common_Append;

            M_First : constant Sequence_Count
              := Norms.Mapping
                  (First_Stage_Index (Code / 16#100#))
                  (Second_Stage_Index (Code mod 16#100#)).Decomposition
                    (Decomposition).First;
            M_Last  : constant Sequence_Count
              := Norms.Mapping
                  (First_Stage_Index (Code / 16#100#))
                  (Second_Stage_Index (Code mod 16#100#)).Decomposition
                    (Decomposition).Last;

         begin
            if M_First = 0 then
               if Code in Hangul_Syllable_First .. Hangul_Syllable_Last then
                  --  Special processing of precomposed Hangul Syllables

                  declare
                     C_Index : constant Code_Point := Code - S_Base;
                     L       : constant Code_Point
                       := L_Base + C_Index / N_Count;
                     V       : constant Code_Point
                       := V_Base + (C_Index mod N_Count) / T_Count;
                     T       : constant Code_Point
                       := T_Base + C_Index mod T_Count;

                  begin
                     Append (Destination, L, Source.Last - S_Index + 3);
                     Append (Destination, V, Source.Last - S_Index + 2);

                     if T /= T_Base then
                        Append (Destination, T, Source.Last - S_Index + 1);
                     end if;
                  end;

                  Starter := (D_Next => Destination.Last + 1);
                  Last_Class := 0;

               else
                  Common_Append (Code);
               end if;

            else
               for J in M_First .. M_Last loop
                  Common_Append (Norms.Decomposition_Data (J));
               end loop;
            end if;
         end;
      end loop;
   end Generic_Decomposition;

   ---------------------------------------
   -- Generic_Decomposition_Composition --
   ---------------------------------------

   procedure Generic_Decomposition_Composition
    (Source      : not null Matreshka.Internals.Strings.Internal_String_Access;
     Destination : in out Matreshka.Internals.Strings.Internal_String_Access)
   is

      type Starter_State is record
         D_Next : Positive := 1;
      end record;

      S_Index    : Positive := 1;
      Code       : Code_Point;
      Length     : Natural  := 0;
      Last_Class : Canonical_Combining_Class := 0;
      Class      : Canonical_Combining_Class;
      Starter    : Starter_State;

   begin
      if Source.Last = 0 then
         Destination := Shared_Empty'Access;
         Reference (Destination);

         return;
      end if;

      --  Try to do Normalization Form quick check.

      declare
         S_Previous : Positive;

      begin
         while S_Index <= Source.Last loop
            S_Previous := S_Index;

            Unchecked_Next (Source.Value, S_Index, Code);
            Class :=
              Core.Property
               (First_Stage_Index (Code / 16#100#))
               (Second_Stage_Index (Code mod 16#100#)).CCC;

            if Class /= 0 then
               if Last_Class > Class then
                  --  Canonical Ordering is violated.

                  S_Index := S_Previous;

                  exit;
               end if;

            else
               Starter := (D_Next => S_Index);
            end if;

            case Core.Property
               (First_Stage_Index (Code / 16#100#))
               (Second_Stage_Index (Code mod 16#100#)).NQC (Form)
            is
               when No | Maybe =>
                  S_Index := S_Previous;

                  exit;

               when Yes =>
                  null;
            end case;

            Last_Class := Class;
            Length := Length + 1;
         end loop;
      end;

      if S_Index > Source.Last then
         Destination := Source;
         Reference (Destination);

         return;
      end if;

      --  Source is not in Normalization Form probably, so start more complex
      --  algorithm.

      Destination := new Internal_String (Source.Size);

      Destination.Value (1 .. S_Index - 1) := Source.Value (1 .. S_Index - 1);
      Destination.Last   := S_Index - 1;
      Destination.Length := Length;

      while S_Index <= Source.Last loop
         Unchecked_Next (Source.Value, S_Index, Code);

         declare

            procedure Common_Append (Code : Code_Point);
            --  Common algorithm to append character exclude Hangul Syllable,
            --  decomposition and appending of which are done using special
            --  algorithm.

            -------------------
            -- Common_Append --
            -------------------

            procedure Common_Append (Code : Code_Point) is
            begin
               Class :=
                 Core.Property
                  (First_Stage_Index (Code / 16#100#))
                  (Second_Stage_Index (Code mod 16#100#)).CCC;

               Append (Destination, Code, Source.Last - S_Index + 1);

               if Class /= 0 then
                  if Last_Class > Class then
                     --  Canonical Ordering is violated, reorder result.

                     Reorder_Last_Character
                      (Destination, Starter.D_Next, Destination.Last + 1);

                  else
                     Last_Class := Class;
                  end if;

               else
                  Starter := (D_Next => Destination.Last + 1);
                  Last_Class := Class;
               end if;
            end Common_Append;

            M_First : constant Sequence_Count
              := Norms.Mapping
                  (First_Stage_Index (Code / 16#100#))
                  (Second_Stage_Index (Code mod 16#100#)).Decomposition
                    (Decomposition).First;
            M_Last  : constant Sequence_Count
              := Norms.Mapping
                  (First_Stage_Index (Code / 16#100#))
                  (Second_Stage_Index (Code mod 16#100#)).Decomposition
                    (Decomposition).Last;

         begin
            if M_First = 0 then
               if Code in Hangul_Syllable_First .. Hangul_Syllable_Last then
                  --  Special processing of precomposed Hangul Syllables

                  declare
                     C_Index : constant Code_Point := Code - S_Base;
                     L       : constant Code_Point
                       := L_Base + C_Index / N_Count;
                     V       : constant Code_Point
                       := V_Base + (C_Index mod N_Count) / T_Count;
                     T       : constant Code_Point
                       := T_Base + C_Index mod T_Count;

                  begin
                     Append (Destination, L, Source.Last - S_Index + 3);
                     Append (Destination, V, Source.Last - S_Index + 2);

                     if T /= T_Base then
                        Append (Destination, T, Source.Last - S_Index + 1);
                     end if;
                  end;

                  Starter := (D_Next => Destination.Last + 1);
                  Last_Class := 0;

               else
                  Common_Append (Code);
               end if;

            else
               for J in M_First .. M_Last loop
                  Common_Append (Norms.Decomposition_Data (J));
               end loop;
            end if;
         end;
      end loop;
   end Generic_Decomposition_Composition;

   ---------
   -- NFC --
   ---------

   procedure NFC
    (Source      : not null Matreshka.Internals.Strings.Internal_String_Access;
     Destination : in out Matreshka.Internals.Strings.Internal_String_Access)
   is
      procedure Convert is
        new Generic_Decomposition_Composition (NFC, Canonical);

   begin
      Convert (Source, Destination);
   end NFC;

   ---------
   -- NFD --
   ---------

   procedure NFD
    (Source      : not null Matreshka.Internals.Strings.Internal_String_Access;
     Destination : in out Matreshka.Internals.Strings.Internal_String_Access)
   is
      procedure Convert is new Generic_Decomposition (NFD, Canonical);

   begin
      Convert (Source, Destination);
   end NFD;

   ----------
   -- NFKC --
   ----------

   procedure NFKC
    (Source      : not null Matreshka.Internals.Strings.Internal_String_Access;
     Destination : in out Matreshka.Internals.Strings.Internal_String_Access)
   is
      procedure Convert is
        new Generic_Decomposition_Composition (NFKC, Compatibility);

   begin
      Convert (Source, Destination);
   end NFKC;

   ----------
   -- NFKD --
   ----------

   procedure NFKD
    (Source      : not null Matreshka.Internals.Strings.Internal_String_Access;
     Destination : in out Matreshka.Internals.Strings.Internal_String_Access)
   is
      procedure Convert is new Generic_Decomposition (NFKD, Compatibility);

   begin
      Convert (Source, Destination);
   end NFKD;

end Matreshka.Internals.Unicode.Normalization;
