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
-- Copyright © 2010, Vadim Godunko <vgodunko@gmail.com>                     --
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
--  This package provides implementation of text codecs for both UTF-16BE and
--  UTF-16LE encodings.
--
--  Note: this package is not private child of Text_Codecs because it is used
--  in League.Strings directly.
------------------------------------------------------------------------------
private with Matreshka.Internals.Unicode;

package Matreshka.Internals.Text_Codecs.UTF16 is

   pragma Preelaborate;

   --------------
   -- UTF-16BE --
   --------------

   type UTF16BE_Decoder is new Abstract_Decoder with private;

   overriding function Is_Error (Self : UTF16BE_Decoder) return Boolean;

   overriding function Is_Mailformed (Self : UTF16BE_Decoder) return Boolean;

   overriding procedure Decode_Append
    (Self   : in out UTF16BE_Decoder;
     Data   : Ada.Streams.Stream_Element_Array;
     String : in out Matreshka.Internals.Strings.Shared_String_Access);

   --------------
   -- UTF-16LE --
   --------------

   type UTF16LE_Decoder is new Abstract_Decoder with private;

   overriding function Is_Error (Self : UTF16LE_Decoder) return Boolean;

   overriding function Is_Mailformed (Self : UTF16LE_Decoder) return Boolean;

   overriding procedure Decode_Append
    (Self   : in out UTF16LE_Decoder;
     Data   : Ada.Streams.Stream_Element_Array;
     String : in out Matreshka.Internals.Strings.Shared_String_Access);

   function BE_Decoder (Mode : Decoder_Mode) return Abstract_Decoder'Class;

   function LE_Decoder (Mode : Decoder_Mode) return Abstract_Decoder'Class;

private

   type UTF16_Meta_Class is mod 2 ** 8;
   type UTF16_DFA_State is mod 2 ** 8;

   type UTF16BE_Decoder is new Abstract_Decoder with record
      State : UTF16_DFA_State                          := 0;
      Code  : Matreshka.Internals.Unicode.Code_Unit_32 := 0;
      Low   : Matreshka.Internals.Unicode.Code_Unit_16 := 0;
   end record;

   type UTF16LE_Decoder is new Abstract_Decoder with record
      State : UTF16_DFA_State                          := 0;
      Code  : Matreshka.Internals.Unicode.Code_Unit_32 := 0;
      Low   : Matreshka.Internals.Unicode.Code_Unit_16 := 0;
   end record;

end Matreshka.Internals.Text_Codecs.UTF16;
