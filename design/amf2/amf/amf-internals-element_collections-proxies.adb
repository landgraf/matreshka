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
-- Copyright © 2010-2011, Vadim Godunko <vgodunko@gmail.com>                --
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
--with AMF.Internals.CMOF_Elements;
--with AMF.Internals.Element_Collections;
with AMF.Internals.Elements;
with AMF.Internals.Helpers;
--with AMF.Internals.Links;
--with AMF.Internals.Tables.AMF_Tables;
--with CMOF.Internals.Attributes;
--with CMOF.Internals.Tables;

package body AMF.Internals.Element_Collections.Proxies is

--   use AMF.Internals.Tables;
--   use type AMF.Internals.AMF_Element;

   ---------
   -- Add --
   ---------

   overriding procedure Add
    (Self : not null access Element_Collection_Proxy;
     Item : AMF.Elements.Element_Access) is
   begin
      Add (Self.Collection, AMF.Internals.Helpers.To_Element (Item));
   end Add;

   -------------
   -- Element --
   -------------

   function Element
    (Self  : not null access constant Element_Collection_Proxy;
     Index : Positive) return not null AMF.Elements.Element_Access is
   begin
      return
        AMF.Internals.Helpers.To_Element (Element (Self.Collection, Index));
   end Element;

   ------------
   -- Length --
   ------------

   function Length
    (Self : not null access constant Element_Collection_Proxy)
       return Natural is
   begin
      return Length (Self.Collection);
   end Length;

end AMF.Internals.Element_Collections.Proxies;