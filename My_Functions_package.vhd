library IEEE;

use IEEE.std_logic_1164.all; 

package My_Functions_package is 

function G_Mul( a , b: in std_logic_vector(7 downto 0) ) 
	return std_logic_vector;
	
end package My_Functions_package;  

package body My_Functions_package is 
		
function G_Mul( a , b: in std_logic_vector(7 downto 0) ) return std_logic_vector is
	variable p, counter, a_var, b_var: std_logic_vector(7 downto 0);
	variable carry : std_logic;
begin
  a_var := a;
  b_var := b;
  FOR i IN  0 to 7 LOOP
    IF (b_var(0) = '1') THEN
        p :=  p xor a_var;
	 END IF;	  
	 carry := a_var(7);                
    --left logical shift
	 a_var := a_var(6 downto 0) & '0';
    
	 IF ( carry = '1' ) THEN
        a_var :=  a_var xor x"01";
	 END IF;
	 --right logical shift
	 b_var:= '0' & b_var(7 downto 1);
  END LOOP;
  return p;
end G_Mul;

end package body My_Functions_package; 
