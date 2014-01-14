library IEEE; 
use IEEE.STD_LOGIC_1164.all; 

package mypackage is 
        type STATE_array is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
		  type char_array is array (15 downto 0) of STD_LOGIC_VECTOR(7 DOWNTO 0); --remember to change 15 to 31
end mypackage; 

package body mypackage is 
end mypackage;