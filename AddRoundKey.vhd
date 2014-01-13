-- Module takes state vector, convert to 4 by 4 byte matrix, make mix_column, convert to 128 bit vector
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.mypackage.all; 

ENTITY AddRoundKey IS
PORT(
      round_state_to_xor  :   IN  STATE_array;
      round_key       	  :   IN  STATE_array;
      round_state_xored   :   OUT STATE_array
	 );
END AddRoundKey;

ARCHITECTURE behavior OF AddRoundKey IS

BEGIN
	ArraysXoring:PROCESS(round_state_to_xor,round_key)
	BEGIN
		 FOR i IN 15 downto 0 LOOP
			round_state_xored(i)(7 downto 0) <= round_state_to_xor(i)(7 downto 0) XOR round_key(i)(7 downto 0);
		 END LOOP;
	END PROCESS ArraysXoring;
END behavior;  
