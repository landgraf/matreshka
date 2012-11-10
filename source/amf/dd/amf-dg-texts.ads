------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--                          Ada Modeling Framework                          --
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
--  This file is generated, don't edit it.
------------------------------------------------------------------------------
--  Text is a graphical element that defines a shape that renders a character 
--  string within a bounding box.
------------------------------------------------------------------------------
limited with AMF.DC;
with AMF.DG.Graphical_Elements;

package AMF.DG.Texts is

   pragma Preelaborate;

   type DG_Text is limited interface
     and AMF.DG.Graphical_Elements.DG_Graphical_Element;

   type DG_Text_Access is
     access all DG_Text'Class;
   for DG_Text_Access'Storage_Size use 0;

   not overriding function Get_Data
    (Self : not null access constant DG_Text)
       return League.Strings.Universal_String is abstract;
   --  Getter of Text::data.
   --
   --  the text as a string of characters.

   not overriding procedure Set_Data
    (Self : not null access DG_Text;
     To   : League.Strings.Universal_String) is abstract;
   --  Setter of Text::data.
   --
   --  the text as a string of characters.

   not overriding function Get_Bounds
    (Self : not null access constant DG_Text)
       return AMF.DC.DC_Bounds is abstract;
   --  Getter of Text::bounds.
   --
   --  the bounds inside which the text is rendered (possibly wrapped into 
   --  multiple lines)

   not overriding procedure Set_Bounds
    (Self : not null access DG_Text;
     To   : AMF.DC.DC_Bounds) is abstract;
   --  Setter of Text::bounds.
   --
   --  the bounds inside which the text is rendered (possibly wrapped into 
   --  multiple lines)

   not overriding function Get_Alignment
    (Self : not null access constant DG_Text)
       return AMF.DC.DC_Alignment_Kind is abstract;
   --  Getter of Text::alignment.
   --
   --  the text alignment when wrapped into multiple lines.

   not overriding procedure Set_Alignment
    (Self : not null access DG_Text;
     To   : AMF.DC.DC_Alignment_Kind) is abstract;
   --  Setter of Text::alignment.
   --
   --  the text alignment when wrapped into multiple lines.

end AMF.DG.Texts;