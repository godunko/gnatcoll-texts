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

with Interfaces;

with Magic.Strings;

package Magic.JSON is

   pragma Preelaborate;

   type JSON_Number_Kind is (None, JSON_Integer, JSON_Float, Out_Of_Range);
   --  Format of the number used to represent value. Note, it is only hint in
   --  most cases, implementation may use other format for some reason.

   type JSON_Number (Kind : JSON_Number_Kind := None) is record
      case Kind is
         when None =>
            null;

         when others =>
            String_Value : Magic.Strings.Magic_String;

            case Kind is
               when None | Out_Of_Range =>
                  null;

               when JSON_Integer =>
                  Integer_Value : Interfaces.Integer_64;

               when JSON_Float =>
                  Float_Value   : Interfaces.IEEE_Float_64;
            end case;
      end case;
   end record;

   function As_Integer (Self : JSON_Number) return Interfaces.Integer_64;
   --  Return number value as integer number. Non-integer value is rounded to
   --  integer.
   --  @exception Constraint_Error is raised when value is out of range or not
   --  present.

   function As_Float (Self : JSON_Number) return Interfaces.IEEE_Float_64;
   --  Return number value as floating point value.
   --  @exception Constraint_Error is raised when value is out of range or not
   --  present.

end Magic.JSON;
