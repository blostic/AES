-- Module takes state vector, convert to 4 by 4 byte matrix, make inv_mix_column, convert to 128 bit vector

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;
use My_Functions_package.all;

ENTITY Inverse_Mix_Columns IS
PORT(
      mixcolumn_vector_in     :   IN  std_logic_vector(127 downto 0);
      mixcolumn_vector_out    :   OUT std_logic_vector(127 downto 0)
    );
END Inverse_Mix_Columns;

ARCHITECTURE behavior OF Inverse_Mix_Columns IS
    
TYPE matrix_index is array (15 downto 0) of std_logic_vector(7 downto 0); 

SIGNAL matrix, matrix_output: matrix_index;

BEGIN

	input_to_matrix:PROCESS(mixcolumn_vector_in)
	BEGIN
		 FOR i IN 15 DOWNTO 0 LOOP
			matrix(15-i) <= mixcolumn_vector_in(8*i+7 downto 8*i);
		 END LOOP;
	END PROCESS input_to_matrix;

	--1st row
	matrix_output(0)  <= G_Mul(matrix(0), x"0e")  XOR G_Mul(matrix(1),x"0b")  XOR G_Mul(matrix(2), x"0d")  XOR G_Mul(matrix(3), x"09");
	matrix_output(4)  <= G_Mul(matrix(4), x"0e")  XOR G_Mul(matrix(5),x"0b")  XOR G_Mul(matrix(6), x"0d")  XOR G_Mul(matrix(7), x"09");
	matrix_output(8)  <= G_Mul(matrix(8), x"0e")  XOR G_Mul(matrix(9),x"0b")  XOR G_Mul(matrix(10),x"0d")  XOR G_Mul(matrix(11),x"09");
	matrix_output(12) <= G_Mul(matrix(12),x"0e")  XOR G_Mul(matrix(13),x"0b") XOR G_Mul(matrix(14),x"0d")  XOR G_Mul(matrix(15),x"09");
	--2nd row
	matrix_output(1)  <= G_Mul(matrix(0), x"09")  XOR G_Mul(matrix(1),x"0e")  XOR G_Mul(matrix(2), x"0b")  XOR G_Mul(matrix(3), x"0d");
	matrix_output(5)  <= G_Mul(matrix(4), x"09")  XOR G_Mul(matrix(5),x"0e")  XOR G_Mul(matrix(6), x"0b")  XOR G_Mul(matrix(7), x"0d");
	matrix_output(9)  <= G_Mul(matrix(8), x"09")  XOR G_Mul(matrix(9),x"0e")  XOR G_Mul(matrix(10),x"0b")  XOR G_Mul(matrix(11),x"0d");
	matrix_output(13) <= G_Mul(matrix(12),x"09")  XOR G_Mul(matrix(13),x"0e") XOR G_Mul(matrix(14),x"0b")  XOR G_Mul(matrix(15),x"0d");
	--3rd row
	matrix_output(2)  <= G_Mul(matrix(0), x"0d")  XOR G_Mul(matrix(1),x"09")  XOR G_Mul(matrix(2), x"0e")  XOR G_Mul(matrix(3), x"0b");
	matrix_output(6)  <= G_Mul(matrix(4), x"0d")  XOR G_Mul(matrix(5),x"09")  XOR G_Mul(matrix(6), x"0e")  XOR G_Mul(matrix(7), x"0b");
	matrix_output(10) <= G_Mul(matrix(8), x"0d")  XOR G_Mul(matrix(9),x"09")  XOR G_Mul(matrix(10),x"0e")  XOR G_Mul(matrix(11),x"0b");
	matrix_output(14) <= G_Mul(matrix(12),x"0d")  XOR G_Mul(matrix(13),x"09") XOR G_Mul(matrix(14),x"0e")  XOR G_Mul(matrix(15),x"0b");
	--4th row
	matrix_output(3)  <= G_Mul(matrix(0), x"0b")  XOR G_Mul(matrix(1),x"0d")  XOR G_Mul(matrix(2), x"09")  XOR G_Mul(matrix(3), x"0e");
	matrix_output(7)  <= G_Mul(matrix(4), x"0b")  XOR G_Mul(matrix(5),x"0d")  XOR G_Mul(matrix(6), x"09")  XOR G_Mul(matrix(7), x"0e");
	matrix_output(11) <= G_Mul(matrix(8), x"0b")  XOR G_Mul(matrix(9),x"0d")  XOR G_Mul(matrix(10),x"09")  XOR G_Mul(matrix(11),x"0e");
	matrix_output(15) <= G_Mul(matrix(12),x"0b")  XOR G_Mul(matrix(13),x"0d") XOR G_Mul(matrix(14),x"09")  XOR G_Mul(matrix(15),x"0e");

	matrix_to_vector:PROCESS(matrix_output)
	BEGIN
		 FOR i IN 15 downto 0 LOOP
			mixcolumn_vector_out(8*i+7 downto 8*i) <= matrix_output(15-i);
		 END LOOP;
	END PROCESS matrix_to_vector;

END behavior;	
