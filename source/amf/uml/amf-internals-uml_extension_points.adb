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
with AMF.Elements;
with AMF.Internals.Element_Collections;
with AMF.Internals.Helpers;
with AMF.Internals.Tables.UML_Attributes;
with AMF.Visitors.UML_Iterators;
with AMF.Visitors.UML_Visitors;
with League.Strings.Internals;
with Matreshka.Internals.Strings;

package body AMF.Internals.UML_Extension_Points is

   -------------------
   -- Enter_Element --
   -------------------

   overriding procedure Enter_Element
    (Self    : not null access constant UML_Extension_Point_Proxy;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Control : in out AMF.Visitors.Traverse_Control) is
   begin
      if Visitor in AMF.Visitors.UML_Visitors.UML_Visitor'Class then
         AMF.Visitors.UML_Visitors.UML_Visitor'Class
          (Visitor).Enter_Extension_Point
            (AMF.UML.Extension_Points.UML_Extension_Point_Access (Self),
           Control);
      end if;
   end Enter_Element;

   -------------------
   -- Leave_Element --
   -------------------

   overriding procedure Leave_Element
    (Self    : not null access constant UML_Extension_Point_Proxy;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Control : in out AMF.Visitors.Traverse_Control) is
   begin
      if Visitor in AMF.Visitors.UML_Visitors.UML_Visitor'Class then
         AMF.Visitors.UML_Visitors.UML_Visitor'Class
          (Visitor).Leave_Extension_Point
            (AMF.UML.Extension_Points.UML_Extension_Point_Access (Self),
           Control);
      end if;
   end Leave_Element;

   -------------------
   -- Visit_Element --
   -------------------

   overriding procedure Visit_Element
    (Self     : not null access constant UML_Extension_Point_Proxy;
     Iterator : in out AMF.Visitors.Abstract_Iterator'Class;
     Visitor  : in out AMF.Visitors.Abstract_Visitor'Class;
     Control  : in out AMF.Visitors.Traverse_Control) is
   begin
      if Iterator in AMF.Visitors.UML_Iterators.UML_Iterator'Class then
         AMF.Visitors.UML_Iterators.UML_Iterator'Class
          (Iterator).Visit_Extension_Point
            (Visitor,
             AMF.UML.Extension_Points.UML_Extension_Point_Access (Self),
             Control);
      end if;
   end Visit_Element;

   ------------------
   -- Get_Use_Case --
   ------------------

   overriding function Get_Use_Case
    (Self : not null access constant UML_Extension_Point_Proxy)
       return AMF.UML.Use_Cases.UML_Use_Case_Access is
   begin
      return
        AMF.UML.Use_Cases.UML_Use_Case_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Use_Case
             (Self.Element)));
   end Get_Use_Case;

   ------------------
   -- Set_Use_Case --
   ------------------

   overriding procedure Set_Use_Case
    (Self : not null access UML_Extension_Point_Proxy;
     To   : AMF.UML.Use_Cases.UML_Use_Case_Access) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Use_Case
       (Self.Element,
        AMF.Internals.Helpers.To_Element
         (AMF.Elements.Element_Access (To)));
   end Set_Use_Case;

   -----------------
   -- Get_Is_Leaf --
   -----------------

   overriding function Get_Is_Leaf
    (Self : not null access constant UML_Extension_Point_Proxy)
       return Boolean is
   begin
      return
        AMF.Internals.Tables.UML_Attributes.Internal_Get_Is_Leaf
         (Self.Element);
   end Get_Is_Leaf;

   -----------------
   -- Set_Is_Leaf --
   -----------------

   overriding procedure Set_Is_Leaf
    (Self : not null access UML_Extension_Point_Proxy;
     To   : Boolean) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Is_Leaf
       (Self.Element, To);
   end Set_Is_Leaf;

   ---------------------------
   -- Get_Redefined_Element --
   ---------------------------

   overriding function Get_Redefined_Element
    (Self : not null access constant UML_Extension_Point_Proxy)
       return AMF.UML.Redefinable_Elements.Collections.Set_Of_UML_Redefinable_Element is
   begin
      return
        AMF.UML.Redefinable_Elements.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Redefined_Element
             (Self.Element)));
   end Get_Redefined_Element;

   ------------------------------
   -- Get_Redefinition_Context --
   ------------------------------

   overriding function Get_Redefinition_Context
    (Self : not null access constant UML_Extension_Point_Proxy)
       return AMF.UML.Classifiers.Collections.Set_Of_UML_Classifier is
   begin
      return
        AMF.UML.Classifiers.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Redefinition_Context
             (Self.Element)));
   end Get_Redefinition_Context;

   ---------------------------
   -- Get_Client_Dependency --
   ---------------------------

   overriding function Get_Client_Dependency
    (Self : not null access constant UML_Extension_Point_Proxy)
       return AMF.UML.Dependencies.Collections.Set_Of_UML_Dependency is
   begin
      return
        AMF.UML.Dependencies.Collections.Wrap
         (AMF.Internals.Element_Collections.Wrap
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Client_Dependency
             (Self.Element)));
   end Get_Client_Dependency;

   -------------------------
   -- Get_Name_Expression --
   -------------------------

   overriding function Get_Name_Expression
    (Self : not null access constant UML_Extension_Point_Proxy)
       return AMF.UML.String_Expressions.UML_String_Expression_Access is
   begin
      return
        AMF.UML.String_Expressions.UML_String_Expression_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Name_Expression
             (Self.Element)));
   end Get_Name_Expression;

   -------------------------
   -- Set_Name_Expression --
   -------------------------

   overriding procedure Set_Name_Expression
    (Self : not null access UML_Extension_Point_Proxy;
     To   : AMF.UML.String_Expressions.UML_String_Expression_Access) is
   begin
      AMF.Internals.Tables.UML_Attributes.Internal_Set_Name_Expression
       (Self.Element,
        AMF.Internals.Helpers.To_Element
         (AMF.Elements.Element_Access (To)));
   end Set_Name_Expression;

   -------------------
   -- Get_Namespace --
   -------------------

   overriding function Get_Namespace
    (Self : not null access constant UML_Extension_Point_Proxy)
       return AMF.UML.Namespaces.UML_Namespace_Access is
   begin
      return
        AMF.UML.Namespaces.UML_Namespace_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Attributes.Internal_Get_Namespace
             (Self.Element)));
   end Get_Namespace;

   ------------------------
   -- Get_Qualified_Name --
   ------------------------

   overriding function Get_Qualified_Name
    (Self : not null access constant UML_Extension_Point_Proxy)
       return AMF.Optional_String is
   begin
      declare
         use type Matreshka.Internals.Strings.Shared_String_Access;

         Aux : constant Matreshka.Internals.Strings.Shared_String_Access
           := AMF.Internals.Tables.UML_Attributes.Internal_Get_Qualified_Name (Self.Element);

      begin
         if Aux = null then
            return (Is_Empty => True);

         else
            return (False, League.Strings.Internals.Create (Aux));
         end if;
      end;
   end Get_Qualified_Name;

   ------------------------
   -- Is_Consistent_With --
   ------------------------

   overriding function Is_Consistent_With
    (Self : not null access constant UML_Extension_Point_Proxy;
     Redefinee : AMF.UML.Redefinable_Elements.UML_Redefinable_Element_Access)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Consistent_With unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Extension_Point_Proxy.Is_Consistent_With";
      return Is_Consistent_With (Self, Redefinee);
   end Is_Consistent_With;

   -----------------------------------
   -- Is_Redefinition_Context_Valid --
   -----------------------------------

   overriding function Is_Redefinition_Context_Valid
    (Self : not null access constant UML_Extension_Point_Proxy;
     Redefined : AMF.UML.Redefinable_Elements.UML_Redefinable_Element_Access)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Redefinition_Context_Valid unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Extension_Point_Proxy.Is_Redefinition_Context_Valid";
      return Is_Redefinition_Context_Valid (Self, Redefined);
   end Is_Redefinition_Context_Valid;

   --------------------
   -- All_Namespaces --
   --------------------

   overriding function All_Namespaces
    (Self : not null access constant UML_Extension_Point_Proxy)
       return AMF.UML.Namespaces.Collections.Ordered_Set_Of_UML_Namespace is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "All_Namespaces unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Extension_Point_Proxy.All_Namespaces";
      return All_Namespaces (Self);
   end All_Namespaces;

   -------------------------
   -- All_Owning_Packages --
   -------------------------

   overriding function All_Owning_Packages
    (Self : not null access constant UML_Extension_Point_Proxy)
       return AMF.UML.Packages.Collections.Set_Of_UML_Package is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "All_Owning_Packages unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Extension_Point_Proxy.All_Owning_Packages";
      return All_Owning_Packages (Self);
   end All_Owning_Packages;

   -----------------------------
   -- Is_Distinguishable_From --
   -----------------------------

   overriding function Is_Distinguishable_From
    (Self : not null access constant UML_Extension_Point_Proxy;
     N : AMF.UML.Named_Elements.UML_Named_Element_Access;
     Ns : AMF.UML.Namespaces.UML_Namespace_Access)
       return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_Distinguishable_From unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Extension_Point_Proxy.Is_Distinguishable_From";
      return Is_Distinguishable_From (Self, N, Ns);
   end Is_Distinguishable_From;

   ---------------
   -- Namespace --
   ---------------

   overriding function Namespace
    (Self : not null access constant UML_Extension_Point_Proxy)
       return AMF.UML.Namespaces.UML_Namespace_Access is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Namespace unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Extension_Point_Proxy.Namespace";
      return Namespace (Self);
   end Namespace;

   --------------------
   -- Qualified_Name --
   --------------------

   overriding function Qualified_Name
    (Self : not null access constant UML_Extension_Point_Proxy)
       return League.Strings.Universal_String is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Qualified_Name unimplemented");
      raise Program_Error with "Unimplemented procedure UML_Extension_Point_Proxy.Qualified_Name";
      return Qualified_Name (Self);
   end Qualified_Name;

end AMF.Internals.UML_Extension_Points;
