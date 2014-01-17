-- Module changes the state array elements, using corresponding elements from the S-Box array 


library IEEE;
use IEEE.std_logic_1164.all; 
USE work.ALL;
use S_Box.all;

use work.mypackage.all;

ENTITY SubBytes IS
PORT(
		round_state_to_sub_S_box  :   IN  STATE_array;
      round_state_converted     :   OUT STATE_array;
		subbytes_on               :   in std_logic;
		subbytes_in               :   out std_logic
	 );
END SubBytes;

ARCHITECTURE behavior OF SubBytes IS

BEGIN
	Sub_Elemnts_From_S_Box:PROCESS
	BEGIN
		
      WAIT UNTIL(SUBBYTES_ON='1');
		subbytes_in <= '1';
		 FOR i IN 15 downto 0 LOOP
			round_state_converted(i)(7 downto 0) <= S_Box_fun( round_state_to_sub_S_box(i)(7 downto 0));
		 END LOOP;
		 subbytes_in <= '0';
	END PROCESS Sub_Elemnts_From_S_Box;
END behavior;  



