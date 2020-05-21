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

package body Magic.Stream_Element_Buffers.Conversions is

   -------------------------
   -- Unchecked_To_String --
   -------------------------

   function Unchecked_To_String
     (Item : Stream_Element_Buffer'Class) return String
   is
      use type Ada.Streams.Stream_Element_Offset;

   begin
      if Item.Data = null or else Item.Data.Length = 0 then
         return "";
      end if;

      declare
         Result : String (1 .. Natural (Item.Data.Length))
           with Address => Item.Data.Storage (Item.Data.Storage'First)'Address;

      begin
         return Result;
      end;
   end Unchecked_To_String;

end Magic.Stream_Element_Buffers.Conversions;
