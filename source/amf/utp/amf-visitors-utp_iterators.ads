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
with AMF.Utp.Coding_Rules;
with AMF.Utp.Data_Partitions;
with AMF.Utp.Data_Pools;
with AMF.Utp.Data_Selectors;
with AMF.Utp.Default_Applications;
with AMF.Utp.Defaults;
with AMF.Utp.Determ_Alts;
with AMF.Utp.Finish_Actions;
with AMF.Utp.Get_Timezone_Actions;
with AMF.Utp.Literal_Anies;
with AMF.Utp.Literal_Any_Or_Nulls;
with AMF.Utp.Log_Actions;
with AMF.Utp.Managed_Elements;
with AMF.Utp.Read_Timer_Actions;
with AMF.Utp.SUTs;
with AMF.Utp.Set_Timezone_Actions;
with AMF.Utp.Start_Timer_Actions;
with AMF.Utp.Stop_Timer_Actions;
with AMF.Utp.Test_Cases;
with AMF.Utp.Test_Components;
with AMF.Utp.Test_Contexts;
with AMF.Utp.Test_Log_Applications;
with AMF.Utp.Test_Logs;
with AMF.Utp.Test_Objectives;
with AMF.Utp.Test_Suites;
with AMF.Utp.Time_Out_Actions;
with AMF.Utp.Time_Out_Messages;
with AMF.Utp.Time_Outs;
with AMF.Utp.Timer_Running_Actions;
with AMF.Utp.Validation_Actions;

package AMF.Visitors.Utp_Iterators is

   pragma Preelaborate;

   type Utp_Iterator is limited interface and AMF.Visitors.Abstract_Iterator;

   not overriding procedure Visit_Coding_Rule
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Coding_Rules.Utp_Coding_Rule_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Data_Partition
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Data_Partitions.Utp_Data_Partition_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Data_Pool
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Data_Pools.Utp_Data_Pool_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Data_Selector
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Data_Selectors.Utp_Data_Selector_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Default
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Defaults.Utp_Default_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Default_Application
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Default_Applications.Utp_Default_Application_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Determ_Alt
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Determ_Alts.Utp_Determ_Alt_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Finish_Action
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Finish_Actions.Utp_Finish_Action_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Get_Timezone_Action
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Get_Timezone_Actions.Utp_Get_Timezone_Action_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Literal_Any
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Literal_Anies.Utp_Literal_Any_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Literal_Any_Or_Null
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Literal_Any_Or_Nulls.Utp_Literal_Any_Or_Null_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Log_Action
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Log_Actions.Utp_Log_Action_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Managed_Element
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Managed_Elements.Utp_Managed_Element_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Read_Timer_Action
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Read_Timer_Actions.Utp_Read_Timer_Action_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_SUT
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.SUTs.Utp_SUT_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Set_Timezone_Action
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Set_Timezone_Actions.Utp_Set_Timezone_Action_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Start_Timer_Action
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Start_Timer_Actions.Utp_Start_Timer_Action_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Stop_Timer_Action
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Stop_Timer_Actions.Utp_Stop_Timer_Action_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Test_Case
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Test_Cases.Utp_Test_Case_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Test_Component
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Test_Components.Utp_Test_Component_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Test_Context
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Test_Contexts.Utp_Test_Context_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Test_Log
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Test_Logs.Utp_Test_Log_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Test_Log_Application
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Test_Log_Applications.Utp_Test_Log_Application_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Test_Objective
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Test_Objectives.Utp_Test_Objective_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Test_Suite
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Test_Suites.Utp_Test_Suite_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Time_Out
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Time_Outs.Utp_Time_Out_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Time_Out_Action
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Time_Out_Actions.Utp_Time_Out_Action_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Time_Out_Message
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Time_Out_Messages.Utp_Time_Out_Message_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Timer_Running_Action
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Timer_Running_Actions.Utp_Timer_Running_Action_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

   not overriding procedure Visit_Validation_Action
    (Self    : in out Utp_Iterator;
     Visitor : in out AMF.Visitors.Abstract_Visitor'Class;
     Element : not null AMF.Utp.Validation_Actions.Utp_Validation_Action_Access;
     Control : in out AMF.Visitors.Traverse_Control) is null;

end AMF.Visitors.Utp_Iterators;
