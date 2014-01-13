-- Module takes state array and shift its rows as described in algorithm specyfication 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;
use My_Functions_package.all;
use work.mypackage.all;

ENTITY Shift_Rows IS
  PORT(
        matrix_to_shift     		:    IN  STATE_array;
        matrix_after_shifting    :    OUT  STATE_array
      );
END Shift_Rows;

ARCHITECTURE behavior OF Shift_Rows IS

  ----
  -- Arrangement of matrix (number in matrix identifies position of element)  
  --
  -- | 0  4  8  12 |
  -- | 1  5  9  13 |
  -- | 2  6  10 14 |
  -- | 3  7  11 15 |
  -----

  BEGIN
  
    matrix_after_shifting(0)  <=  matrix_to_shift(0);
    matrix_after_shifting(1)  <=  matrix_to_shift(5);
    matrix_after_shifting(2)  <=  matrix_to_shift(10);
    matrix_after_shifting(3)  <=  matrix_to_shift(15);
    
    matrix_after_shifting(4)  <=  matrix_to_shift(4);
    matrix_after_shifting(5)  <=  matrix_to_shift(9);
    matrix_after_shifting(6)  <=  matrix_to_shift(14);
    matrix_after_shifting(7)  <=  matrix_to_shift(3);
    
    matrix_after_shifting(8)  <=  matrix_to_shift(8);
    matrix_after_shifting(9)  <=  matrix_to_shift(13);
    matrix_after_shifting(10) <=  matrix_to_shift(2);
    matrix_after_shifting(11) <=  matrix_to_shift(7);
    
    matrix_after_shifting(12) <=  matrix_to_shift(12);
    matrix_after_shifting(13) <=  matrix_to_shift(1);
    matrix_after_shifting(14) <=  matrix_to_shift(6);
    matrix_after_shifting(15) <=  matrix_to_shift(11);

END behavior;

