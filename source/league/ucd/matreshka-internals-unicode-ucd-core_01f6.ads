------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--        Localization, Internationalization, Globalization for Ada         --
--                                                                          --
--                        Runtime Library Component                         --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Copyright © 2012, Vadim Godunko <vgodunko@gmail.com>                     --
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

pragma Restrictions (No_Elaboration_Code);
--  GNAT: enforce generation of preinitialized data section instead of
--  generation of elaboration code.

package Matreshka.Internals.Unicode.Ucd.Core_01F6 is

   pragma Preelaborate;

   Group_01F6 : aliased constant Core_Second_Stage
     := (16#00#           =>  --  01F600
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#11#           =>  --  01F611
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#15#           =>  --  01F615
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#17#           =>  --  01F617
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#19#           =>  --  01F619
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#1B#           =>  --  01F61B
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#1F#           =>  --  01F61F
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#26# .. 16#27# =>  --  01F626 .. 01F627
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#2C#           =>  --  01F62C
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#2E# .. 16#2F# =>  --  01F62E .. 01F62F
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#34#           =>  --  01F634
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#41# .. 16#44# =>  --  01F641 .. 01F644
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#50# .. 16#7F# =>  --  01F650 .. 01F67F
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         16#C6# .. 16#FF# =>  --  01F6C6 .. 01F6FF
          (Unassigned, 0,
           Other, Other, Other, Unknown,
           (Yes, Yes, Yes, Yes), None,
           (others => False)),
         others           =>
          (Other_Symbol, 0,
           Other, Other, Other, Alphabetic,
           (Yes, Yes, Yes, Yes), None,
           (Grapheme_Base => True,
            others => False)));

end Matreshka.Internals.Unicode.Ucd.Core_01F6;