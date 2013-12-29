-- Module takes state vector, convert to 4 by 4 byte matrix, make mix_column, convert to 128 bit vector

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;
use My_Functions_package.all;

ENTITY Mix_Columns IS
PORT(
      mixcolumn_vector_in     :   IN  std_logic_vector(127 downto 0);
      mixcolumn_vector_out    :   OUT std_logic_vector(127 downto 0)
    );
END Mix_Columns;

ARCHITECTURE behavior OF Mix_Columns IS
    
TYPE matrix_index is array (15 downto 0) of std_logic_vector(7 downto 0); 
SIGNAL matrix, matrix_output : matrix_index;

BEGIN
  vector_to_matrix:PROCESS(mixcolumn_vector_in)
    BEGIN
      FOR i IN 15 DOWNTO 0 LOOP
        matrix(15-i) <= mixcolumn_vector_in(8*i+7 downto 8*i);
      END LOOP;
    END PROCESS vector_to_matrix;


	--1st row
	matrix_output(0)  <= G_Mul(matrix(0),"00000010")  XOR G_Mul(matrix(1),"00000011")  XOR matrix(2)  XOR matrix(3);
	matrix_output(4)  <= G_Mul(matrix(4),"00000010")  XOR G_Mul(matrix(5),"00000011")  XOR matrix(6)  XOR matrix(7);
	matrix_output(8)  <= G_Mul(matrix(8),"00000010")  XOR G_Mul(matrix(9),"00000011")  XOR matrix(10) XOR matrix(11);
	matrix_output(12) <= G_Mul(matrix(12),"00000010") XOR G_Mul(matrix(13),"00000011") XOR matrix(14) XOR matrix(15);
	--2nd row
	matrix_output(1)  <= matrix(0)  XOR G_Mul(matrix(1), "00000010")  XOR G_Mul(matrix(2),"00000011")  XOR matrix(3); 
	matrix_output(5)  <= matrix(4)  XOR G_Mul(matrix(5), "00000010")  XOR G_Mul(matrix(6),"00000011")  XOR matrix(7); 
	matrix_output(9)  <= matrix(8)  XOR G_Mul(matrix(9), "00000010")  XOR G_Mul(matrix(10),"00000011") XOR matrix(11); 
	matrix_output(13) <= matrix(12) XOR G_Mul(matrix(13),"00000010")  XOR G_Mul(matrix(14),"00000011") XOR matrix(15); 
	--3rd row
	matrix_output(2)  <= matrix(0)  XOR matrix(1)  XOR G_Mul(matrix(2),"00000010")  XOR G_Mul(matrix(3) ,"00000011");
	matrix_output(6)  <= matrix(4)  XOR matrix(5)  XOR G_Mul(matrix(6),"00000010")  XOR G_Mul(matrix(7) ,"00000011");
	matrix_output(10) <= matrix(8)  XOR matrix(9)  XOR G_Mul(matrix(10),"00000010") XOR G_Mul(matrix(11),"00000011");
	matrix_output(14) <= matrix(12) XOR matrix(13) XOR G_Mul(matrix(14),"00000010") XOR G_Mul(matrix(15),"00000011");
	--4th row
	matrix_output(3)  <= G_Mul(matrix(0),"00000011")  XOR matrix(1)  XOR matrix(2)  XOR G_Mul(matrix(3),"00000010");
	matrix_output(7)  <= G_Mul(matrix(4),"00000011")  XOR matrix(5)  XOR matrix(6)  XOR G_Mul(matrix(7),"00000010");
	matrix_output(11) <= G_Mul(matrix(8),"00000011")  XOR matrix(9)  XOR matrix(10) XOR G_Mul(matrix(11),"00000010");
	matrix_output(15) <= G_Mul(matrix(12),"00000011") XOR matrix(13) XOR matrix(14) XOR G_Mul(matrix(15),"00000010");

--mapping back to a vector

matrix_to_vector:PROCESS(matrix_output)
BEGIN
    FOR i IN 15 downto 0 LOOP
  mixcolumn_vector_out(8*i+7 downto 8*i) <= matrix_output(15-i);
    END LOOP;
END PROCESS matrix_to_vector;

END behavior;  
