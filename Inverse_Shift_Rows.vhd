
-- Module takes state array and make Inverse_Shift_Rows action


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;
use My_Functions_package.all;
use work.mypackage.all;


ENTITY Inverse_Shift_Rows IS
  PORT(
        matrix_to_re_shift     	   :   IN  STATE_array;
        matrix_after_re_shifting    :   OUT  STATE_array
      );
END Inverse_Shift_Rows;

ARCHITECTURE behavior OF Inverse_Shift_Rows IS

	----
	-- Arrangement of matrix (number in matrix identifies position of element)  
	--
	-- | 0  4  8  12 |
	-- | 1  5  9  13 |
	-- | 2  6  10 14 |
	-- | 3  7  11 15 |
	-----


  BEGIN

    matrix_after_re_shifting(0)  <=  matrix_to_re_shift(0);
    matrix_after_re_shifting(5)  <=  matrix_to_re_shift(1);
    matrix_after_re_shifting(10) <=  matrix_to_re_shift(2);
    matrix_after_re_shifting(15) <=  matrix_to_re_shift(3);
    
    matrix_after_re_shifting(4)  <=  matrix_to_re_shift(4);
    matrix_after_re_shifting(9)  <=  matrix_to_re_shift(5);
    matrix_after_re_shifting(14) <=  matrix_to_re_shift(6);
    matrix_after_re_shifting(3)  <=  matrix_to_re_shift(7);
    
    matrix_after_re_shifting(8)  <=  matrix_to_re_shift(8);
    matrix_after_re_shifting(13) <=  matrix_to_re_shift(9);
    matrix_after_re_shifting(2)  <=  matrix_to_re_shift(10);
    matrix_after_re_shifting(7)  <=  matrix_to_re_shift(11);
    
	  matrix_after_re_shifting(12) <=  matrix_to_re_shift(12);
    matrix_after_re_shifting(1)  <=  matrix_to_re_shift(13);
    matrix_after_re_shifting(6)  <=  matrix_to_re_shift(14);
    matrix_after_re_shifting(11) <=  matrix_to_re_shift(15);


END behavior;


