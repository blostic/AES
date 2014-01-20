-- Modules make mix_column

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE work.ALL;
  use My_Functions_package.all;
  USE S_Box.ALL;
  USE work.mypackage.ALL;
  
PACKAGE CORE_FUN IS

	FUNCTION MIX_COLUMNS(input_matrix_to_mix : IN STATE_array)
         RETURN STATE_array;

	FUNCTION SHIFT_ROWS_F(matrix_to_shift : IN STATE_array)
        RETURN STATE_array;
    
	FUNCTION ADD_ROUND_KEY(round_state_to_xor : IN STATE_array;
		round_key: IN  STATE_array)
		RETURN STATE_array;
	
	FUNCTION SUBBYTES_F(round_state_to_sub_S_box : IN STATE_array)
		RETURN STATE_array;
	
	FUNCTION ROUND_ENC(data_in : IN STATE_array;
		 round_key	     :	IN  STATE_array)
		 RETURN STATE_array;
		 
	
END PACKAGE CORE_FUN;

PACKAGE BODY CORE_FUN IS

	FUNCTION MIX_COLUMNS(input_matrix_to_mix : IN STATE_array)
         RETURN STATE_array 
		 IS
		 VARIABLE matrix_after_mixing : STATE_array;
		 BEGIN
			matrix_after_mixing(0)  := G_Mul(input_matrix_to_mix(0),x"02")  XOR G_Mul(input_matrix_to_mix(1),x"03")  XOR input_matrix_to_mix(2)  XOR input_matrix_to_mix(3);
			matrix_after_mixing(4)  := G_Mul(input_matrix_to_mix(4),x"02")  XOR G_Mul(input_matrix_to_mix(5),x"03")  XOR input_matrix_to_mix(6)  XOR input_matrix_to_mix(7);
			matrix_after_mixing(8)  := G_Mul(input_matrix_to_mix(8),x"02")  XOR G_Mul(input_matrix_to_mix(9),x"03")  XOR input_matrix_to_mix(10) XOR input_matrix_to_mix(11);
			matrix_after_mixing(12) := G_Mul(input_matrix_to_mix(12),x"02") XOR G_Mul(input_matrix_to_mix(13),x"03") XOR input_matrix_to_mix(14) XOR input_matrix_to_mix(15);
			--2nd row               
			matrix_after_mixing(1)  := input_matrix_to_mix(0)  XOR G_Mul(input_matrix_to_mix(1), x"02")  XOR G_Mul(input_matrix_to_mix(2),x"03")  XOR input_matrix_to_mix(3); 
			matrix_after_mixing(5)  := input_matrix_to_mix(4)  XOR G_Mul(input_matrix_to_mix(5), x"02")  XOR G_Mul(input_matrix_to_mix(6),x"03")  XOR input_matrix_to_mix(7); 
			matrix_after_mixing(9)  := input_matrix_to_mix(8)  XOR G_Mul(input_matrix_to_mix(9), x"02")  XOR G_Mul(input_matrix_to_mix(10),x"03") XOR input_matrix_to_mix(11); 
			matrix_after_mixing(13) := input_matrix_to_mix(12) XOR G_Mul(input_matrix_to_mix(13),x"02")  XOR G_Mul(input_matrix_to_mix(14),x"03") XOR input_matrix_to_mix(15); 
			--3rd row               
			matrix_after_mixing(2)  := input_matrix_to_mix(0)  XOR input_matrix_to_mix(1)  XOR G_Mul(input_matrix_to_mix(2),x"02")  XOR G_Mul(input_matrix_to_mix(3) ,x"03");
			matrix_after_mixing(6)  := input_matrix_to_mix(4)  XOR input_matrix_to_mix(5)  XOR G_Mul(input_matrix_to_mix(6),x"02")  XOR G_Mul(input_matrix_to_mix(7) ,x"03");
			matrix_after_mixing(10) := input_matrix_to_mix(8)  XOR input_matrix_to_mix(9)  XOR G_Mul(input_matrix_to_mix(10),x"02") XOR G_Mul(input_matrix_to_mix(11),x"03");
			matrix_after_mixing(14) := input_matrix_to_mix(12) XOR input_matrix_to_mix(13) XOR G_Mul(input_matrix_to_mix(14),x"02") XOR G_Mul(input_matrix_to_mix(15),x"03");
			--4th row               
			matrix_after_mixing(3)  := G_Mul(input_matrix_to_mix(0),x"03")  XOR input_matrix_to_mix(1)  XOR input_matrix_to_mix(2)  XOR G_Mul(input_matrix_to_mix(3),x"02");
			matrix_after_mixing(7)  := G_Mul(input_matrix_to_mix(4),x"03")  XOR input_matrix_to_mix(5)  XOR input_matrix_to_mix(6)  XOR G_Mul(input_matrix_to_mix(7),x"02");
			matrix_after_mixing(11) := G_Mul(input_matrix_to_mix(8),x"03")  XOR input_matrix_to_mix(9)  XOR input_matrix_to_mix(10) XOR G_Mul(input_matrix_to_mix(11),x"02");
			matrix_after_mixing(15) := G_Mul(input_matrix_to_mix(12),x"03") XOR input_matrix_to_mix(13) XOR input_matrix_to_mix(14) XOR G_Mul(input_matrix_to_mix(15),x"02");
		 RETURN matrix_after_mixing; 
	END MIX_COLUMNS;
	
	FUNCTION SHIFT_ROWS_F(matrix_to_shift : IN STATE_array)
		RETURN STATE_array
		IS
        VARIABLE matrix_after_shifting : STATE_array;
		BEGIN
			matrix_after_shifting(0)  :=  matrix_to_shift(0);
			matrix_after_shifting(1)  :=  matrix_to_shift(5);
			matrix_after_shifting(2)  :=  matrix_to_shift(10);
			matrix_after_shifting(3)  :=  matrix_to_shift(15);
			                          
			matrix_after_shifting(4)  :=  matrix_to_shift(4);
			matrix_after_shifting(5)  :=  matrix_to_shift(9);
			matrix_after_shifting(6)  :=  matrix_to_shift(14);
			matrix_after_shifting(7)  :=  matrix_to_shift(3);
			                          
			matrix_after_shifting(8)  :=  matrix_to_shift(8);
			matrix_after_shifting(9)  :=  matrix_to_shift(13);
			matrix_after_shifting(10) :=  matrix_to_shift(2);
			matrix_after_shifting(11) :=  matrix_to_shift(7);
			                          
			matrix_after_shifting(12) :=  matrix_to_shift(12);
			matrix_after_shifting(13) :=  matrix_to_shift(1);
			matrix_after_shifting(14) :=  matrix_to_shift(6);
			matrix_after_shifting(15) :=  matrix_to_shift(11);
		RETURN matrix_after_shifting;
	END SHIFT_ROWS_F;
	
	
	FUNCTION ADD_ROUND_KEY(
	   round_state_to_xor : IN STATE_array;
		round_key: IN  STATE_array)
		RETURN STATE_array
		IS
		VARIABLE round_state_xored : STATE_array;
		BEGIN
			FOR i IN 15 downto 0 
			LOOP
				round_state_xored(i)(7 downto 0) := round_state_to_xor(i)(7 downto 0) XOR round_key(i)(7 downto 0);
			END LOOP;
		RETURN round_state_xored;
	END ADD_ROUND_KEY;
	
	FUNCTION SUBBYTES_F(round_state_to_sub_S_box : IN STATE_array)
		RETURN STATE_array
		IS
		VARIABLE round_state_converted: STATE_array;
		BEGIN
		 FOR i IN 15 downto 0 
		 LOOP
			round_state_converted(i)(7 downto 0) := S_Box_fun( round_state_to_sub_S_box(i)(7 downto 0));
		 END LOOP;
		 RETURN round_state_converted;
	END SUBBYTES_F;
	
	FUNCTION ROUND_ENC(data_in : IN STATE_array;
		round_key :	IN STATE_array)
		RETURN STATE_array
		IS
		VARIABLE xored     : STATE_array;
		VARIABLE shiftrow  : STATE_array;
		VARIABLE bytesub   : STATE_array;
		VARIABLE mixcolumn : STATE_array;

		BEGIN
			xored := ADD_ROUND_KEY(data_in, round_key);
			bytesub := SUBBYTES_F(xored);
			shiftrow := SHIFT_ROWS_F(bytesub);
			mixcolumn := MIX_COLUMNS(shiftrow);
		RETURN mixcolumn;
	END ROUND_ENC;
	
	
END PACKAGE BODY CORE_FUN;
 
