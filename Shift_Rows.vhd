
-- Module takes state vector (128 bits) and shift it's rows as described in algorithm specyfication 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY Shift_Rows IS
  PORT(
        shiftrow_vector_in     :   IN  std_logic_vector(127 downto 0);
        shiftrow_vector_out    :   OUT std_logic_vector(127 downto 0)
      );
END Shift_Rows;

ARCHITECTURE behavior OF Shift_Rows IS
  TYPE byte_matrix IS array (15 downto 0) OF std_logic_vector(7 downto 0);

	----
	-- Arrangement of matrix (number in matrix identifies position of element)  
	--
	-- | 0  4  8  12 |
	-- | 1  5  9  13 |
	-- | 2  6  10 14 |
	-- | 3  7  11 15 |
	-----

  SIGNAL matrix_input, matrix_output : byte_matrix;

  BEGIN
    vector_to_matrix: PROCESS(shiftrow_vector_in)
      BEGIN
        FOR i IN 15 downto 0 LOOP
          matrix_input(15-i) <= shiftrow_vector_in(8*i+7 downto 8*i);
        END LOOP;
    END PROCESS vector_to_matrix;

    matrix_output(0)  <=  matrix_input(0);
    matrix_output(1)  <=  matrix_input(5);
    matrix_output(2)  <=  matrix_input(10);
    matrix_output(3)  <=  matrix_input(15);
    
    matrix_output(4)  <=  matrix_input(4);
    matrix_output(5)  <=  matrix_input(9);
    matrix_output(6)  <=  matrix_input(14);
    matrix_output(7)  <=  matrix_input(3);
    
    matrix_output(8)  <=  matrix_input(8);
    matrix_output(9)  <=  matrix_input(13);
    matrix_output(10) <=  matrix_input(2);
    matrix_output(11) <=  matrix_input(7);
    
	 matrix_output(12) <=  matrix_input(12);
    matrix_output(13) <=  matrix_input(1);
    matrix_output(14) <=  matrix_input(6);
    matrix_output(15) <=  matrix_input(11);

    matrix_to_vector: PROCESS(matrix_output)
    BEGIN
      FOR i IN 15 downto 0 LOOP
        shiftrow_vector_out(8*i+7 DOWNTO 8*i) <= matrix_output(15-i);
      END LOOP;
    END PROCESS matrix_to_vector;
END behavior;