

-- Module make inv_mix_column

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;
use My_Functions_package.all;
use work.mypackage.all;

ENTITY Inverse_Mix_Columns IS
PORT(
      input_matrix              :   IN  STATE_array;
      matrix_after_re_mixing    :   OUT  STATE_array
    );
END Inverse_Mix_Columns;

ARCHITECTURE behavior OF Inverse_Mix_Columns IS
    
BEGIN

	--1st row
	matrix_after_re_mixing(0)  <= G_Mul(input_matrix(0), x"0e")  XOR G_Mul(input_matrix(1),x"0b")  XOR G_Mul(input_matrix(2), x"0d")  XOR G_Mul(input_matrix(3), x"09");
	matrix_after_re_mixing(4)  <= G_Mul(input_matrix(4), x"0e")  XOR G_Mul(input_matrix(5),x"0b")  XOR G_Mul(input_matrix(6), x"0d")  XOR G_Mul(input_matrix(7), x"09");
	matrix_after_re_mixing(8)  <= G_Mul(input_matrix(8), x"0e")  XOR G_Mul(input_matrix(9),x"0b")  XOR G_Mul(input_matrix(10),x"0d")  XOR G_Mul(input_matrix(11),x"09");
	matrix_after_re_mixing(12) <= G_Mul(input_matrix(12),x"0e")  XOR G_Mul(input_matrix(13),x"0b") XOR G_Mul(input_matrix(14),x"0d")  XOR G_Mul(input_matrix(15),x"09");
	--2nd row
	matrix_after_re_mixing(1)  <= G_Mul(input_matrix(0), x"09")  XOR G_Mul(input_matrix(1),x"0e")  XOR G_Mul(input_matrix(2), x"0b")  XOR G_Mul(input_matrix(3), x"0d");
	matrix_after_re_mixing(5)  <= G_Mul(input_matrix(4), x"09")  XOR G_Mul(input_matrix(5),x"0e")  XOR G_Mul(input_matrix(6), x"0b")  XOR G_Mul(input_matrix(7), x"0d");
	matrix_after_re_mixing(9)  <= G_Mul(input_matrix(8), x"09")  XOR G_Mul(input_matrix(9),x"0e")  XOR G_Mul(input_matrix(10),x"0b")  XOR G_Mul(input_matrix(11),x"0d");
	matrix_after_re_mixing(13) <= G_Mul(input_matrix(12),x"09")  XOR G_Mul(input_matrix(13),x"0e") XOR G_Mul(input_matrix(14),x"0b")  XOR G_Mul(input_matrix(15),x"0d");
	--3rd row
	matrix_after_re_mixing(2)  <= G_Mul(input_matrix(0), x"0d")  XOR G_Mul(input_matrix(1),x"09")  XOR G_Mul(input_matrix(2), x"0e")  XOR G_Mul(input_matrix(3), x"0b");
	matrix_after_re_mixing(6)  <= G_Mul(input_matrix(4), x"0d")  XOR G_Mul(input_matrix(5),x"09")  XOR G_Mul(input_matrix(6), x"0e")  XOR G_Mul(input_matrix(7), x"0b");
	matrix_after_re_mixing(10) <= G_Mul(input_matrix(8), x"0d")  XOR G_Mul(input_matrix(9),x"09")  XOR G_Mul(input_matrix(10),x"0e")  XOR G_Mul(input_matrix(11),x"0b");
	matrix_after_re_mixing(14) <= G_Mul(input_matrix(12),x"0d")  XOR G_Mul(input_matrix(13),x"09") XOR G_Mul(input_matrix(14),x"0e")  XOR G_Mul(input_matrix(15),x"0b");
	--4th row
	matrix_after_re_mixing(3)  <= G_Mul(input_matrix(0), x"0b")  XOR G_Mul(input_matrix(1),x"0d")  XOR G_Mul(input_matrix(2), x"09")  XOR G_Mul(input_matrix(3), x"0e");
	matrix_after_re_mixing(7)  <= G_Mul(input_matrix(4), x"0b")  XOR G_Mul(input_matrix(5),x"0d")  XOR G_Mul(input_matrix(6), x"09")  XOR G_Mul(input_matrix(7), x"0e");
	matrix_after_re_mixing(11) <= G_Mul(input_matrix(8), x"0b")  XOR G_Mul(input_matrix(9),x"0d")  XOR G_Mul(input_matrix(10),x"09")  XOR G_Mul(input_matrix(11),x"0e");
	matrix_after_re_mixing(15) <= G_Mul(input_matrix(12),x"0b")  XOR G_Mul(input_matrix(13),x"0d") XOR G_Mul(input_matrix(14),x"09")  XOR G_Mul(input_matrix(15),x"0e");

END behavior;	
