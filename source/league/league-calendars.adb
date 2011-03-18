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
-- Copyright © 2011, Vadim Godunko <vgodunko@gmail.com>                     --
-- All rights reserved.                                                     --
--                                                                          --
-- Redistribution and use in source and binary forms, with or without       --
-- modification, are permitted provided that the following conditions       --
-- are met:                                                                 --
--                                                                          --
--  * Redistributions of source code must retain the above copyright        --
--    notice, this list of conditions and the following disclaimer.         --
--                                                                          --
--  * Redistributions in binary form must reproduce the above copyright     --
--    notice, this list of conditions and the following disclaimer in the   --
--    documentation and/or other materials provided with the distribution.  --
--                                                                          --
--  * Neither the name of the Vadim Godunko, IE nor the names of its        --
--    contributors may be used to endorse or promote products derived from  --
--    this software without specific prior written permission.              --
--                                                                          --
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS      --
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT        --
-- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    --
-- A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT     --
-- HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   --
-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED --
-- TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR   --
-- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF   --
-- LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING     --
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS       --
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.             --
--                                                                          --
------------------------------------------------------------------------------
--  $Revision$ $Date$
------------------------------------------------------------------------------

package body League.Calendars is

   use Matreshka.Internals.Calendars;

   ---------
   -- "+" --
   ---------

   function "+" (Right : Time) return Time is
   begin
      return Right;
   end "+";

   ---------
   -- "+" --
   ---------

   function "+" (Left : Time; Right : Time) return Time is
   begin
      return Time (X_Open_Time (Left) + X_Open_Time (Right));
   end "+";

   ---------
   -- "+" --
   ---------

   function "+" (Left : Date_Time; Right : Time) return Date_Time is
   begin
      return Date_Time (X_Open_Time (Left) + X_Open_Time (Right));
   end "+";

   ---------
   -- "-" --
   ---------

   function "-" (Right : Time) return Time is
   begin
      return Time (-X_Open_Time (Right));
   end "-";

   ---------
   -- "-" --
   ---------

   function "-" (Left : Time; Right : Time) return Time is
   begin
      return Time (X_Open_Time (Left) - X_Open_Time (Right));
   end "-";

   ---------
   -- "-" --
   ---------

   function "-" (Left : Date_Time; Right : Time) return Date_Time is
   begin
      return Date_Time (X_Open_Time (Left) - X_Open_Time (Right));
   end "-";

   ---------
   -- "<" --
   ---------

   function "<"  (Left : Time; Right : Time) return Boolean is
   begin
      return X_Open_Time (Left) < X_Open_Time (Right);
   end "<";

   ---------
   -- "<" --
   ---------

   function "<"  (Left : Date; Right : Date) return Boolean is
   begin
      return X_Open_Time (Left) < X_Open_Time (Right);
   end "<";

   ---------
   -- "<" --
   ---------

   function "<"  (Left : Date_Time; Right : Date_Time) return Boolean is
   begin
      return X_Open_Time (Left) < X_Open_Time (Right);
   end "<";

   ----------
   -- "<=" --
   ----------

   function "<="  (Left : Time; Right : Time) return Boolean is
   begin
      return X_Open_Time (Left) <= X_Open_Time (Right);
   end "<=";

   ----------
   -- "<=" --
   ----------

   function "<="  (Left : Date; Right : Date) return Boolean is
   begin
      return X_Open_Time (Left) <= X_Open_Time (Right);
   end "<=";

   ----------
   -- "<=" --
   ----------

   function "<="  (Left : Date_Time; Right : Date_Time) return Boolean is
   begin
      return X_Open_Time (Left) <= X_Open_Time (Right);
   end "<=";

   ---------
   -- "=" --
   ---------

   function "="  (Left : Time; Right : Time) return Boolean is
   begin
      return X_Open_Time (Left) = X_Open_Time (Right);
   end "=";

   ---------
   -- "=" --
   ---------

   function "="  (Left : Date; Right : Date) return Boolean is
   begin
      return X_Open_Time (Left) = X_Open_Time (Right);
   end "=";

   ---------
   -- "=" --
   ---------

   function "="  (Left : Date_Time; Right : Date_Time) return Boolean is
   begin
      return X_Open_Time (Left) = X_Open_Time (Right);
   end "=";

   ---------
   -- ">" --
   ---------

   function ">"  (Left : Time; Right : Time) return Boolean is
   begin
      return X_Open_Time (Left) > X_Open_Time (Right);
   end ">";

   ---------
   -- ">" --
   ---------

   function ">"  (Left : Date; Right : Date) return Boolean is
   begin
      return X_Open_Time (Left) > X_Open_Time (Right);
   end ">";

   ---------
   -- ">" --
   ---------

   function ">"  (Left : Date_Time; Right : Date_Time) return Boolean is
   begin
      return X_Open_Time (Left) > X_Open_Time (Right);
   end ">";

   ----------
   -- ">=" --
   ----------

   function ">="  (Left : Time; Right : Time) return Boolean is
   begin
      return X_Open_Time (Left) >= X_Open_Time (Right);
   end ">=";

   ----------
   -- ">=" --
   ----------

   function ">="  (Left : Date; Right : Date) return Boolean is
   begin
      return X_Open_Time (Left) >= X_Open_Time (Right);
   end ">=";

   ----------
   -- ">=" --
   ----------

   function ">="  (Left : Date_Time; Right : Date_Time) return Boolean is
   begin
      return X_Open_Time (Left) >= X_Open_Time (Right);
   end ">=";

end League.Calendars;