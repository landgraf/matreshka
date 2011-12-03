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
with AMF.CMOF.Types;
with AMF.Internals.Element_Collections;
with AMF.Internals.Extents;
with AMF.Internals.Factories;
with AMF.Internals.Helpers;
with AMF.Internals.Links;
with AMF.Internals.Listener_Registry;
with AMF.Internals.Tables.CMOF_Attributes;

package body AMF.Internals.AMF_URI_Stores is

   function Factory
    (Meta_Type : not null access constant AMF.CMOF.Types.CMOF_Type'Class)
       return AMF.Internals.Factories.Factory_Access;
   --  Returns factory for the specified meta type.

   -----------------------
   -- Convert_To_String --
   -----------------------

   overriding function Convert_To_String
    (Self      : not null access AMF_URI_Store;
     Data_Type : not null access AMF.CMOF.Data_Types.CMOF_Data_Type'Class;
     Value     : League.Holders.Holder)
       return League.Strings.Universal_String
   is
      pragma Unreferenced (Self);

   begin
      return Factory (Data_Type).Convert_To_String (Data_Type, Value);
   end Convert_To_String;

   ------------
   -- Create --
   ------------

   overriding function Create
    (Self       : not null access AMF_URI_Store;
     Meta_Class : not null access AMF.CMOF.Classes.CMOF_Class'Class)
       return not null AMF.Elements.Element_Access
   is
      Element : constant AMF.Elements.Element_Access
        := Factory (Meta_Class).Create (Meta_Class);

   begin
      --  Add element to the store.

      AMF.Internals.Extents.Internal_Append
       (Self.Id, AMF.Internals.Helpers.To_Element (Element));

      --  Notify about creation of element.

      AMF.Internals.Listener_Registry.Notify_Instance_Create (Element);

      return Element;
   end Create;

   ------------
   -- Create --
   ------------

   overriding function Create
    (Self       : not null access AMF_URI_Store;
     Meta_Class : not null access AMF.CMOF.Classes.CMOF_Class'Class;
     Id         : League.Strings.Universal_String)
       return not null AMF.Elements.Element_Access
   is
      Element    : constant AMF.Elements.Element_Access
        := Factory (Meta_Class).Create (Meta_Class);
      Element_Id : constant AMF.Internals.AMF_Element
        := AMF.Internals.Helpers.To_Element (Element);

   begin
      --  Add element to the store.

      AMF.Internals.Extents.Internal_Append (Self.Id, Element_Id);
      AMF.Internals.Extents.Set_Id (Self.Id, Element_Id, Id);

      --  Notify about creation of element.

      AMF.Internals.Listener_Registry.Notify_Instance_Create (Element);

      return Element;
   end Create;

   ------------------------
   -- Create_From_String --
   ------------------------

   overriding function Create_From_String
    (Self      : not null access AMF_URI_Store;
     Data_Type : not null access AMF.CMOF.Data_Types.CMOF_Data_Type'Class;
     Image     : League.Strings.Universal_String)
       return League.Holders.Holder
   is
      pragma Unreferenced (Self);

   begin
      return Factory (Data_Type).Create_From_String (Data_Type, Image);
   end Create_From_String;

   -----------------
   -- Create_Link --
   -----------------

   overriding function Create_Link
    (Self           : not null access AMF_URI_Store;
     Association    :
       not null access AMF.CMOF.Associations.CMOF_Association'Class;
     First_Element  : not null AMF.Elements.Element_Access;
     Second_Element : not null AMF.Elements.Element_Access)
       return not null AMF.Links.Link_Access
   is
      pragma Unreferenced (Self);

      A          : constant CMOF_Element
        := AMF.Internals.Helpers.To_Element
            (AMF.Elements.Abstract_Element'Class (Association.all)'Access);
      Member_End : constant AMF_Collection_Of_Element
        := AMF.Internals.Tables.CMOF_Attributes.Internal_Get_Member_End (A);

   begin
      return
        AMF.Internals.Links.Proxy
         (AMF.Internals.Links.Internal_Create_Link
           (A,
            AMF.Internals.Helpers.To_Element (First_Element),
            AMF.Internals.Element_Collections.Element (Member_End, 1),
            AMF.Internals.Helpers.To_Element (Second_Element),
            AMF.Internals.Element_Collections.Element (Member_End, 2)));
   end Create_Link;

   -------------
   -- Factory --
   -------------

   function Factory
    (Meta_Type : not null access constant AMF.CMOF.Types.CMOF_Type'Class)
       return AMF.Internals.Factories.Factory_Access
   is
      Enclosing_Package : constant AMF.CMOF.Packages.CMOF_Package_Access
        := AMF.CMOF.Packages.CMOF_Package_Access
            (AMF.Elements.Element_Access (Meta_Type).Container);
      --  := Meta_Type.Get_Package;
      --
      --  XXX Type:getPackage is derived property, it is not implemented now.

   begin
      return
        AMF.Internals.Factories.Get_Factory (Enclosing_Package.Get_URI.Value);
   end Factory;

   -----------------
   -- Get_Package --
   -----------------

   overriding function Get_Package
    (Self : not null access constant AMF_URI_Store)
       return AMF.CMOF.Packages.Collections.Set_Of_CMOF_Package
   is
      pragma Unreferenced (Self);

   begin
      return AMF.Internals.Factories.Get_Packages;
   end Get_Package;

end AMF.Internals.AMF_URI_Stores;