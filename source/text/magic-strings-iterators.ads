------------------------------------------------------------------------------
--                        M A G I C   R U N T I M E                         --
--                                                                          --
--                       Copyright (C) 2020, AdaCore                        --
--                                                                          --
-- This library is free software;  you can redistribute it and/or modify it --
-- under terms of the  GNU General Public License  as published by the Free --
-- Software  Foundation;  either version 3,  or (at your  option) any later --
-- version. This library is distributed in the hope that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE.                            --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------

with Magic.Unicode;

package Magic.Strings.Iterators is

   pragma Preelaborate;

   type Abstract_Iterator is abstract tagged limited private;

   function Character_Index
     (Self : Abstract_Iterator'Class) return Magic.Strings.Character_Index;

   function UTF8_Offset
     (Self : Abstract_Iterator'Class)
      return Magic.Unicode.UTF8_Code_Unit_Index;

   function UTF16_Offset
     (Self : Abstract_Iterator'Class)
      return Magic.Unicode.UTF16_Code_Unit_Index;

   function Forward
     (Self : in out Abstract_Iterator) return Boolean is abstract;

private

   type Abstract_Iterator is abstract new Referal_Limited_Base with record
      Position : Cursor;
   end record;

   overriding procedure Invalidate (Self : in out Abstract_Iterator);

end Magic.Strings.Iterators;
