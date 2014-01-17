LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;
use My_Functions_package.all;
use work.mypackage.all;

ENTITY Round IS

PORT(
		 data_in         :	IN  STATE_array;
		 round_key	     :	IN  STATE_array;
		 data_out        :	OUT STATE_array;
		 round_on 		  :   in  std_logic;
		 round_in        :   out std_logic
    );
END Round;

ARCHITECTURE behavior OF Round IS

	COMPONENT Mix_Columns 
	PORT(
		 input_matrix_to_mix     :   IN  STATE_array;
		 matrix_after_mixing     :   OUT STATE_array;
		 MIXCOLUMNS_IN				 :   OUT STD_logic;
		 MIXCOLUMNS_ON				 :   IN STD_logic
		 
		 );
	END COMPONENT;
	
	COMPONENT SubBytes 
	PORT(
		 round_state_to_sub_S_box    :	IN  STATE_array;
		 round_state_converted       :	OUT STATE_array;
		 SUBBYTES_IN                  :  OUT STD_logic;
		 SUBBYTES_ON						:	IN STD_logic
		 );
	END COMPONENT;

	COMPONENT Shift_Rows 
	PORT(
		 matrix_to_shift          :   IN  STATE_array;
		 matrix_after_shifting    :   OUT STATE_array;
		 SHIFTROWS_IN             :   OUT STD_logic;
		 SHIFTROWS_ON             :   IN STD_logic
		 );
	END COMPONENT;

	COMPONENT AddRoundKey 
	PORT(
		 round_state_to_xor     :   IN  STATE_array;
		 round_key              :   IN  STATE_array;
		 round_state_xored      :   OUT STATE_array;
		 ADD_ROUND_IN           :   OUT STD_logic;
		 ADD_ROUND_ON           :   IN STD_logic
		 );
	END COMPONENT;

	SIGNAL xored     : STATE_array;
	SIGNAL shiftrow  : STATE_array;
	SIGNAL bytesub   : STATE_array;
	SIGNAL mixcolumn : STATE_array;
	SIGNAL ADD_ROUND_IN : STD_logic;
	SIGNAL ADD_ROUND_ON : STD_logic;
	SIGNAL SUBBYTES_IN : STD_logic;
	SIGNAL SUBBYTES_ON : STD_logic;
	SIGNAL SHIFTROWS_IN : STD_logic;
	SIGNAL SHIFTROWS_ON : STD_logic;
	SIGNAL MIXCOLUMNS_IN : STD_logic;
	SIGNAL MIXCOLUMNS_ON : STD_logic;

BEGIN

		AddRoundKey_S:  AddRoundKey 
		PORT MAP(
				 round_state_to_xor     =>   data_in,
				 round_key              =>   round_key,
				 round_state_xored      =>   xored,
				 ADD_ROUND_IN => ADD_ROUND_IN,
				 ADD_ROUND_ON => ADD_ROUND_ON
			 );

		SubBytes_S:  SubBytes
		PORT MAP(
				 round_state_to_sub_S_box=> xored,
				 round_state_converted => bytesub,
				 SUBBYTES_IN => SUBBYTES_IN,
				 SUBBYTES_ON => SUBBYTES_ON
			 );

		Shift_Rows_S:  Shift_Rows
		PORT MAP(
				 matrix_to_shift  => bytesub,
				 matrix_after_shifting => shiftrow,
				 SHIFTROWS_IN => SHIFTROWS_IN,
				 SHIFTROWS_ON => SHIFTROWS_ON
			 );

		Mix_Columns_S: Mix_Columns
		PORT MAP(   
				 input_matrix_to_mix => shiftrow,
				 matrix_after_mixing => mixcolumn,
				 MIXCOLUMNS_IN => MIXCOLUMNS_IN,
				 MIXCOLUMNS_ON => MIXCOLUMNS_ON
			 );


		PROCESS
		BEGIN
		
			WAIT UNTIL(ROUND_ON='1');
				
				ROUND_IN <='1';
				
				ADD_ROUND_ON <= '1';
				WAIT on ADD_ROUND_IN;
				WAIT on ADD_ROUND_IN;
				ADD_ROUND_ON <= '0';
				
				SUBBYTES_ON <= '1';
				WAIT ON SUBBYTES_IN;
				WAIT ON SUBBYTES_IN;
				SUBBYTES_ON <= '0';
				
				SHIFTROWS_ON <= '1';
				WAIT ON SHIFTROWS_IN;
				WAIT ON SHIFTROWS_IN;
				SHIFTROWS_ON <= '0';
				
				
				MIXCOLUMNS_ON <= '1';
				WAIT ON MIXCOLUMNS_IN;
				WAIT ON MIXCOLUMNS_IN;
				MIXCOLUMNS_ON <= '0';
				
				data_out <= mixcolumn;
				
				ROUND_IN <= '0';
				end process;
		
END behavior;			    
			    