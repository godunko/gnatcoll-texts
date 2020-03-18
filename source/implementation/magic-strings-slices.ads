------------------------------------------------------------------------------
--                         Language Server Protocol                         --
--                                                                          --
--                     Copyright (C) 2019-2020, AdaCore                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.  You should have  received  a copy of the GNU --
-- General  Public  License  distributed  with  this  software;   see  file --
-- COPYING3.  If not, go to http://www.gnu.org/licenses for a complete copy --
-- of the license.                                                          --
------------------------------------------------------------------------------
--  Data type to use reference to "slice" of another string data.

with Magic.Strings.Reference_Counted;

private package Magic.Strings.Slices is

   type Slice_Shared_String is
     new Magic.Strings.Reference_Counted.Abstract_Shared_String with private;

private

   type Slice_Shared_String is
     new Magic.Strings.Reference_Counted.Abstract_Shared_String with record
      Data : String_Access;
      From : Character_Index;
      To   : Character_Count;
   end record;

   overriding procedure Finalize (Self : in out Slice_Shared_String);
   --  Finalization of the shared slice segment, base buffer should be
   --  unreferenced.

   overriding procedure First_Character
     (Self     : Slice_Shared_String;
      Position : in out Cursor);
   --  Initialize iterator to point to first character of the string

   overriding function Forward
     (Self     : Slice_Shared_String;
      Position : in out Cursor) return Boolean;
   --  Move cursor one character forward. Return True on success.

   overriding function Is_Empty (Self : Slice_Shared_String) return Boolean;
   --  Return True when string is empty.

   overriding function To_Text
     (Self : in out Slice_Shared_String) return String_Access;

   overriding function To_UTF_8_String
     (Self : Slice_Shared_String)
      return Ada.Strings.UTF_Encoding.UTF_8_String;

end Magic.Strings.Slices;
