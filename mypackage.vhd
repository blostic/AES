<<<<<<< HEAD
library IEEE; 
use IEEE.STD_LOGIC_1164.all; 

package mypackage is 
        type STATE_array is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
		  type char_array is array (15 downto 0) of STD_LOGIC_VECTOR(7 DOWNTO 0); --remember to change 15 to 31
end mypackage; 

package body mypackage is 
=======
library IEEE; 
use IEEE.STD_LOGIC_1164.all; 

package mypackage is 
	type STATE_array is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
end mypackage; 

package body mypackage is 
>>>>>>> 7d6c3001aef3797e91637ad4a7796fd0e7440d63
end mypackage;