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
--  This file is generated, don't edit it.
------------------------------------------------------------------------------
--  Property represents a declared state of one or more instances in terms of 
--  a named relationship to a value or values. When a property is an attribute 
--  of a classifier, the value or values are related to the instance of the 
--  classifier by being held in slots of the instance. When a property is an 
--  association end, the value or values are related to the instance or 
--  instances at the other end(s) of the association. The range of valid 
--  values represented by the property can be controlled by setting the 
--  property's type.
--  A property has the capability of being a deployment target in a deployment 
--  relationship. This enables modeling the deployment to hierarchical nodes 
--  that have properties functioning as internal parts.
--  Property specializes ParameterableElement to specify that a property can 
--  be exposed as a formal template parameter, and provided as an actual 
--  parameter in a binding of a template.
--  A property represents a set of instances that are owned by a containing 
--  classifier instance.
--  A property is a structural feature of a classifier that characterizes 
--  instances of the classifier. A property related by ownedAttribute to a 
--  classifier (other than an association) represents an attribute and might 
--  also represent an association end. It relates an instance of the class to 
--  a value or set of values of the type of the attribute. A property related 
--  by memberEnd or its specializations to an association represents an end of 
--  the association. The type of the property is the type of the end of the 
--  association.
------------------------------------------------------------------------------
limited with AMF.UML.Associations;
limited with AMF.UML.Classes;
with AMF.UML.Connectable_Elements;
limited with AMF.UML.Data_Types;
with AMF.UML.Deployment_Targets;
limited with AMF.UML.Interfaces;
limited with AMF.UML.Properties.Collections;
with AMF.UML.Structural_Features;
limited with AMF.UML.Value_Specifications;

package AMF.UML.Properties is

   pragma Preelaborate;

   type UML_Property_Interface is limited interface
     and AMF.UML.Connectable_Elements.UML_Connectable_Element_Interface
     and AMF.UML.Deployment_Targets.UML_Deployment_Target_Interface
     and AMF.UML.Structural_Features.UML_Structural_Feature_Interface;

   type UML_Property is
     access all UML_Property_Interface'Class;
   for UML_Property'Storage_Size use 0;

   not overriding function Get_Aggregation
    (Self : not null access constant UML_Property_Interface)
       return UML_Aggregation_Kind is abstract;
   --  Specifies the kind of aggregation that applies to the Property.

   not overriding procedure Set_Aggregation
    (Self : not null access UML_Property_Interface;
     To   : UML_Aggregation_Kind) is abstract;

   not overriding function Get_Association
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Associations.UML_Association is abstract;
   --  References the association of which this property is a member, if any.

   not overriding procedure Set_Association
    (Self : not null access UML_Property_Interface;
     To   : AMF.UML.Associations.UML_Association) is abstract;

   not overriding function Get_Association_End
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Properties.UML_Property is abstract;
   --  Designates the optional association end that owns a qualifier attribute.

   not overriding procedure Set_Association_End
    (Self : not null access UML_Property_Interface;
     To   : AMF.UML.Properties.UML_Property) is abstract;

   not overriding function Get_Class
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Classes.UML_Class is abstract;
   --  References the Class that owns the Property.
   --  References the Class that owns the Property.

   not overriding procedure Set_Class
    (Self : not null access UML_Property_Interface;
     To   : AMF.UML.Classes.UML_Class) is abstract;

   not overriding function Get_Datatype
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Data_Types.UML_Data_Type is abstract;
   --  The DataType that owns this Property.

   not overriding procedure Set_Datatype
    (Self : not null access UML_Property_Interface;
     To   : AMF.UML.Data_Types.UML_Data_Type) is abstract;

   not overriding function Get_Default
    (Self : not null access constant UML_Property_Interface)
       return Optional_String is abstract;
   --  A String that is evaluated to give a default value for the Property 
   --  when an object of the owning Classifier is instantiated.
   --  Specifies a String that represents a value to be used when no argument 
   --  is supplied for the Property.

   not overriding procedure Set_Default
    (Self : not null access UML_Property_Interface;
     To   : Optional_String) is abstract;

   not overriding function Get_Default_Value
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Value_Specifications.UML_Value_Specification is abstract;
   --  A ValueSpecification that is evaluated to give a default value for the 
   --  Property when an object of the owning Classifier is instantiated.

   not overriding procedure Set_Default_Value
    (Self : not null access UML_Property_Interface;
     To   : AMF.UML.Value_Specifications.UML_Value_Specification) is abstract;

   not overriding function Get_Interface
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Interfaces.UML_Interface is abstract;
   --  References the Interface that owns the Property

   not overriding procedure Set_Interface
    (Self : not null access UML_Property_Interface;
     To   : AMF.UML.Interfaces.UML_Interface) is abstract;

   not overriding function Get_Is_Composite
    (Self : not null access constant UML_Property_Interface)
       return Boolean is abstract;
   --  If isComposite is true, the object containing the attribute is a 
   --  container for the object or value contained in the attribute.
   --  This is a derived value, indicating whether the aggregation of the 
   --  Property is composite or not.

   not overriding procedure Set_Is_Composite
    (Self : not null access UML_Property_Interface;
     To   : Boolean) is abstract;

   not overriding function Get_Is_Derived
    (Self : not null access constant UML_Property_Interface)
       return Boolean is abstract;
   --  Specifies whether the Property is derived, i.e., whether its value or 
   --  values can be computed from other information.
   --  If isDerived is true, the value of the attribute is derived from 
   --  information elsewhere.

   not overriding procedure Set_Is_Derived
    (Self : not null access UML_Property_Interface;
     To   : Boolean) is abstract;

   not overriding function Get_Is_Derived_Union
    (Self : not null access constant UML_Property_Interface)
       return Boolean is abstract;
   --  Specifies whether the property is derived as the union of all of the 
   --  properties that are constrained to subset it.

   not overriding procedure Set_Is_Derived_Union
    (Self : not null access UML_Property_Interface;
     To   : Boolean) is abstract;

   not overriding function Get_Is_I_D
    (Self : not null access constant UML_Property_Interface)
       return Boolean is abstract;
   --  True indicates this property can be used to uniquely identify an 
   --  instance of the containing Class.

   not overriding procedure Set_Is_I_D
    (Self : not null access UML_Property_Interface;
     To   : Boolean) is abstract;

   overriding function Get_Is_Read_Only
    (Self : not null access constant UML_Property_Interface)
       return Boolean is abstract;
   --  If isReadOnly is true, the attribute may not be written to after 
   --  initialization.
   --  If true, the attribute may only be read, and not written.

   overriding procedure Set_Is_Read_Only
    (Self : not null access UML_Property_Interface;
     To   : Boolean) is abstract;

   not overriding function Get_Opposite
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Properties.UML_Property is abstract;
   --  In the case where the property is one navigable end of a binary 
   --  association with both ends navigable, this gives the other end.

   not overriding procedure Set_Opposite
    (Self : not null access UML_Property_Interface;
     To   : AMF.UML.Properties.UML_Property) is abstract;

   not overriding function Get_Owning_Association
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Associations.UML_Association is abstract;
   --  References the owning association of this property, if any.

   not overriding procedure Set_Owning_Association
    (Self : not null access UML_Property_Interface;
     To   : AMF.UML.Associations.UML_Association) is abstract;

   not overriding function Get_Qualifier
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Properties.Collections.Ordered_Set_Of_UML_Property is abstract;
   --  An optional list of ordered qualifier attributes for the end. If the 
   --  list is empty, then the Association is not qualified.

   not overriding function Get_Redefined_Property
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Properties.Collections.Set_Of_UML_Property is abstract;
   --  References the properties that are redefined by this property.

   not overriding function Get_Subsetted_Property
    (Self : not null access constant UML_Property_Interface)
       return AMF.UML.Properties.Collections.Set_Of_UML_Property is abstract;
   --  References the properties of which this property is constrained to be a 
   --  subset.

end AMF.UML.Properties;