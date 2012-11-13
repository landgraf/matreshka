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
-- Copyright © 2011-2012, Vadim Godunko <vgodunko@gmail.com>                --
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
--  The most general class for UML diagrams.
------------------------------------------------------------------------------
with AMF.DI.Diagrams;
with AMF.UML.Packageable_Elements;
with AMF.UMLDI.UML_Diagram_Elements;
limited with AMF.UMLDI.UML_Labels;

package AMF.UMLDI.UML_Diagrams is

   pragma Preelaborate;

   type UMLDI_UML_Diagram is limited interface
     and AMF.UML.Packageable_Elements.UML_Packageable_Element
     and AMF.UMLDI.UML_Diagram_Elements.UMLDI_UML_Diagram_Element
     and AMF.DI.Diagrams.DI_Diagram;

   type UMLDI_UML_Diagram_Access is
     access all UMLDI_UML_Diagram'Class;
   for UMLDI_UML_Diagram_Access'Storage_Size use 0;

   not overriding function Get_Heading
    (Self : not null access constant UMLDI_UML_Diagram)
       return AMF.UMLDI.UML_Labels.UMLDI_UML_Label_Access is abstract;
   --  Getter of UMLDiagram::heading.
   --

   not overriding procedure Set_Heading
    (Self : not null access UMLDI_UML_Diagram;
     To   : AMF.UMLDI.UML_Labels.UMLDI_UML_Label_Access) is abstract;
   --  Setter of UMLDiagram::heading.
   --

   not overriding function Get_Is_Frame
    (Self : not null access constant UMLDI_UML_Diagram)
       return Boolean is abstract;
   --  Getter of UMLDiagram::isFrame.
   --
   --  Indicates when diagram frames shall be shown.

   not overriding procedure Set_Is_Frame
    (Self : not null access UMLDI_UML_Diagram;
     To   : Boolean) is abstract;
   --  Setter of UMLDiagram::isFrame.
   --
   --  Indicates when diagram frames shall be shown.

   not overriding function Get_Is_Iso
    (Self : not null access constant UMLDI_UML_Diagram)
       return Boolean is abstract;
   --  Getter of UMLDiagram::isIso.
   --
   --  Indicate when ISO notation rules shall be followed.

   not overriding procedure Set_Is_Iso
    (Self : not null access UMLDI_UML_Diagram;
     To   : Boolean) is abstract;
   --  Setter of UMLDiagram::isIso.
   --
   --  Indicate when ISO notation rules shall be followed.

end AMF.UMLDI.UML_Diagrams;
