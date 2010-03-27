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
-- Copyright © 2010 Vadim Godunko <vgodunko@gmail.com>                      --
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
with Matreshka.Internals.Strings;
with Matreshka.Internals.Utf16;

with Parser_Tokens;

package Matreshka.Internals.Regexps.Compiler is

--   pragma Preelaborate;

   --  Here is global state of the compiler. At the first stage of
   --  refactoring all global state variables must be moved to here.
   --  Later, they will be wrapped by record type to allow to have
   --  several compiler in the different threads at the same time.

   Data                : Matreshka.Internals.Strings.Shared_String_Access;
   YY_Start_State      : Integer := 1;
   YY_Current_Position : Matreshka.Internals.Utf16.Utf16_String_Index := 0;

   procedure YYError (Error : Parser_Tokens.YY_Errors; Index : Natural);
   --  Report error.

   --  Abstract Syntax Tree and Utilities

   type Node_Kinds is
     (N_None,
      N_Subexpression,
      N_Any_Code_Point,
      N_Code_Point,
      N_Code_Point_Range,
      N_Character_Class,
      N_Multiplicity,
      N_Alternation);

   type Node (Kind : Node_Kinds := N_None) is record
      case Kind is
         when N_None =>
            null;

         when others =>
            Next : Natural;
            --  Next node in the chain

            case Kind is
               when N_None =>
                  null;

               when N_Subexpression =>
                  Subexpression : Natural;
                  Index         : Natural;

               when N_Any_Code_Point =>
                  null;

               when N_Code_Point =>
                  Code : Wide_Wide_Character;
                  --  Code point to match

               when N_Code_Point_Range =>
                  Low  : Wide_Wide_Character;
                  High : Wide_Wide_Character;

               when N_Character_Class =>
                  Negated : Boolean;
                  Members : Natural;

               when N_Multiplicity =>
                  Item   : Natural;
                  --  Link to expression

                  Greedy : Boolean;
                  Lower  : Natural;
                  Upper  : Natural;

               when N_Alternation =>
                  First  : Natural;
                  Second : Natural;
            end case;
      end case;
   end record;

   AST       : array (Positive range 1 .. 100) of Node;
   AST_Start : Positive;
   AST_Last  : Natural := 0;

   procedure Attach (Head : Positive; Node : Positive);
   --  Attach Node to the list of nodes, started by Head.

   procedure Add (Class : Positive; Member : Positive);

   procedure Dump;

end Matreshka.Internals.Regexps.Compiler;
