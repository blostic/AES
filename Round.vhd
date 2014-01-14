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
		 run 				  :   in  std_logic
    );
END Round;

ARCHITECTURE behavior OF Round IS

	COMPONENT Mix_Columns 
	PORT(
		 input_matrix_to_mix     :   IN  STATE_array;
		 matrix_after_mixing     :   OUT STATE_array
		 );
	END COMPONENT;
	
	COMPONENT SubBytes 
	PORT(
		 round_state_to_sub_S_box    :	IN  STATE_array;
		 round_state_converted       :	OUT STATE_array
		 );
	END COMPONENT;

	COMPONENT Shift_Rows 
	PORT(
		 matrix_to_shift          :   IN  STATE_array;
		 matrix_after_shifting    :   OUT STATE_array
		 );
	END COMPONENT;

	COMPONENT AddRoundKey 
	PORT(
		 round_state_to_xor     :   IN  STATE_array;
		 round_key              :   IN  STATE_array;
		 round_state_xored      :   OUT STATE_array
		 );
	END COMPONENT;

	SIGNAL xored     : STATE_array;
	SIGNAL shiftrow  : STATE_array;
	SIGNAL bytesub   : STATE_array;
	SIGNAL mixcolumn : STATE_array;

BEGIN

		AddRoundKey_S:  AddRoundKey 
		PORT MAP(
				 round_state_to_xor     =>   data_in,
				 round_key              =>   round_key,
				 round_state_xored      =>   xored
			 );

		SubBytes_S:  SubBytes
		PORT MAP(
				 round_state_to_sub_S_box=> xored,
				 round_state_converted => bytesub
			 );

		Shift_Rows_S:  Shift_Rows
		PORT MAP(
				 matrix_to_shift  => bytesub,
				 matrix_after_shifting => shiftrow
			 );

		Mix_Columns_S: Mix_Columns
		PORT MAP(   
				 input_matrix_to_mix => shiftrow,
				 matrix_after_mixing => mixcolumn
			 );

		data_out <= mixcolumn;

END behavior;			    
			    