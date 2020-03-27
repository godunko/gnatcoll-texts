------------------------------------------------------------------------------
--                         Language Server Protocol                         --
--                                                                          --
--                       Copyright (C) 2020, AdaCore                        --
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

package body Magic.Strings.Iterators.Characters is

   -------------
   -- Element --
   -------------

   function Element
     (Self : Character_Iterator'Class) return Magic.Characters.Magic_Character
   is
   begin
      if Self.Owner /= null and then Self.Owner.Data /= null then
         return
           Magic.Characters.Magic_Character'Val
             (Self.Owner.Data.Element (Self.Position));

      else
         return Magic.Characters.Magic_Character'Val (16#00_0000#);
      end if;
   end Element;

   -------------
   -- Forward --
   -------------

   overriding function Forward
     (Self : in out Character_Iterator) return Boolean is
   begin
      if Self.Owner /= null and then Self.Owner.Data /= null then
         return Self.Owner.Data.Forward (Self.Position);

      else
         return False;
      end if;
   end Forward;

end Magic.Strings.Iterators.Characters;
