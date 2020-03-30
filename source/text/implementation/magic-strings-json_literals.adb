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

package body Magic.Strings.JSON_Literals is

   ---------------
   -- Reference --
   ---------------

   overriding function Reference
     (Self : in out JSON_Literal_String) return String_Access
   is
   begin
      Self.JSON := UTF8_Shared_String_Access (Self.JSON.Reference);

      return Self'Unchecked_Access;
   end Reference;

   -----------------
   -- Unreference --
   -----------------

   overriding procedure Unreference (Self : in out JSON_Literal_String) is
   begin
      Self.JSON.Unreference;
   end Unreference;

end Magic.Strings.JSON_Literals;