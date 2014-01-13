-- Modules make mix_column

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE work.ALL;
  use My_Functions_package.all;
  use work.mypackage.all;

ENTITY Mix_Columns IS
PORT(
      input_matrix_to_mix    :   IN   STATE_array;
      matrix_after_mixing    :   OUT  STATE_array
    );
END Mix_Columns;

ARCHITECTURE behavior OF Mix_Columns IS
    

BEGIN

  --1st row
  matrix_after_mixing(0)  <= G_Mul(input_matrix_to_mix(0),x"02")  XOR G_Mul(input_matrix_to_mix(1),x"03")  XOR input_matrix_to_mix(2)  XOR input_matrix_to_mix(3);
  matrix_after_mixing(4)  <= G_Mul(input_matrix_to_mix(4),x"02")  XOR G_Mul(input_matrix_to_mix(5),x"03")  XOR input_matrix_to_mix(6)  XOR input_matrix_to_mix(7);
  matrix_after_mixing(8)  <= G_Mul(input_matrix_to_mix(8),x"02")  XOR G_Mul(input_matrix_to_mix(9),x"03")  XOR input_matrix_to_mix(10) XOR input_matrix_to_mix(11);
  matrix_after_mixing(12) <= G_Mul(input_matrix_to_mix(12),x"02") XOR G_Mul(input_matrix_to_mix(13),x"03") XOR input_matrix_to_mix(14) XOR input_matrix_to_mix(15);
  --2nd row
  matrix_after_mixing(1)  <= input_matrix_to_mix(0)  XOR G_Mul(input_matrix_to_mix(1), x"02")  XOR G_Mul(input_matrix_to_mix(2),x"03")  XOR input_matrix_to_mix(3); 
  matrix_after_mixing(5)  <= input_matrix_to_mix(4)  XOR G_Mul(input_matrix_to_mix(5), x"02")  XOR G_Mul(input_matrix_to_mix(6),x"03")  XOR input_matrix_to_mix(7); 
  matrix_after_mixing(9)  <= input_matrix_to_mix(8)  XOR G_Mul(input_matrix_to_mix(9), x"02")  XOR G_Mul(input_matrix_to_mix(10),x"03") XOR input_matrix_to_mix(11); 
  matrix_after_mixing(13) <= input_matrix_to_mix(12) XOR G_Mul(input_matrix_to_mix(13),x"02")  XOR G_Mul(input_matrix_to_mix(14),x"03") XOR input_matrix_to_mix(15); 
  --3rd row
  matrix_after_mixing(2)  <= input_matrix_to_mix(0)  XOR input_matrix_to_mix(1)  XOR G_Mul(input_matrix_to_mix(2),x"02")  XOR G_Mul(input_matrix_to_mix(3) ,x"03");
  matrix_after_mixing(6)  <= input_matrix_to_mix(4)  XOR input_matrix_to_mix(5)  XOR G_Mul(input_matrix_to_mix(6),x"02")  XOR G_Mul(input_matrix_to_mix(7) ,x"03");
  matrix_after_mixing(10) <= input_matrix_to_mix(8)  XOR input_matrix_to_mix(9)  XOR G_Mul(input_matrix_to_mix(10),x"02") XOR G_Mul(input_matrix_to_mix(11),x"03");
  matrix_after_mixing(14) <= input_matrix_to_mix(12) XOR input_matrix_to_mix(13) XOR G_Mul(input_matrix_to_mix(14),x"02") XOR G_Mul(input_matrix_to_mix(15),x"03");
  --4th row
  matrix_after_mixing(3)  <= G_Mul(input_matrix_to_mix(0),x"03")  XOR input_matrix_to_mix(1)  XOR input_matrix_to_mix(2)  XOR G_Mul(input_matrix_to_mix(3),x"02");
  matrix_after_mixing(7)  <= G_Mul(input_matrix_to_mix(4),x"03")  XOR input_matrix_to_mix(5)  XOR input_matrix_to_mix(6)  XOR G_Mul(input_matrix_to_mix(7),x"02");
  matrix_after_mixing(11) <= G_Mul(input_matrix_to_mix(8),x"03")  XOR input_matrix_to_mix(9)  XOR input_matrix_to_mix(10) XOR G_Mul(input_matrix_to_mix(11),x"02");
  matrix_after_mixing(15) <= G_Mul(input_matrix_to_mix(12),x"03") XOR input_matrix_to_mix(13) XOR input_matrix_to_mix(14) XOR G_Mul(input_matrix_to_mix(15),x"02");
  
END behavior;  
