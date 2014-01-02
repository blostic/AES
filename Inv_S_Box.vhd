--Rijndael S_Box is a table used in InverseSubByte procedure

library IEEE;

use IEEE.std_logic_1164.all; 

package Inv_S_Box is 

function Inv_S_Box_fun( 
	entry_element : IN std_logic_vector(7 downto 0) ) 
	return std_logic_vector;
	
end package Inv_S_Box;  

package body Inv_S_Box is 
		
function Inv_S_Box_fun(  entry_element: in std_logic_vector(7 downto 0)  ) return std_logic_vector is

begin
	case entry_element is 

		WHEN "00000000" => return  X"52"; 
		WHEN "00000001" => return  X"09";  
		WHEN "00000010" => return  X"6a"; 
		WHEN "00000011" => return  X"D5"; 
		WHEN "00000100" => return  X"30"; 
		WHEN "00000101" => return  X"36"; 
		WHEN "00000110" => return  X"A5";  
		WHEN "00000111" => return  X"38";  
		WHEN "00001000" => return  X"BF";  
		WHEN "00001001" => return  X"40";  
		WHEN "00001010" => return  X"A3";  
		WHEN "00001011" => return  X"9E";  
		WHEN "00001100" => return  X"81";  
		WHEN "00001101" => return  X"F3";  
		WHEN "00001110" => return  X"D7";  
		WHEN "00001111" => return  X"FB";  
		
		--2nd row
		WHEN "00010000" => return  X"7C";  
		WHEN "00010001" => return  X"E3"; 
		WHEN "00010010" => return  X"39"; 
		WHEN "00010011" => return  X"82"; 
		WHEN "00010100" => return  X"9B"; 
		WHEN "00010101" => return  X"2F"; 
		WHEN "00010110" => return  X"FF"; 
		WHEN "00010111" => return  X"87"; 
		WHEN "00011000" => return  X"34"; 
		WHEN "00011001" => return  X"8E"; 
		WHEN "00011010" => return  X"43"; 
		WHEN "00011011" => return  X"44"; 
		WHEN "00011100" => return  X"C4"; 
		WHEN "00011101" => return  X"DE"; 
		WHEN "00011110" => return  X"E9"; 
		WHEN "00011111" => return  X"CB"; 
		
		--3rd row
		WHEN "00100000" => return  X"54"; 
		WHEN "00100001" => return  X"7B"; 
		WHEN "00100010" => return  X"94"; 
		WHEN "00100011" => return  X"32"; 
		WHEN "00100100" => return  X"A6"; 
		WHEN "00100101" => return  X"C2"; 
		WHEN "00100110" => return  X"23"; 
		WHEN "00100111" => return  X"3D"; 
		WHEN "00101000" => return  X"EE"; 
		WHEN "00101001" => return  X"4C"; 
		WHEN "00101010" => return  X"95"; 
		WHEN "00101011" => return  X"0B"; 
		WHEN "00101100" => return  X"42"; 
		WHEN "00101101" => return  X"FA"; 
		WHEN "00101110" => return  X"C3"; 
		WHEN "00101111" => return  X"4E"; 
		
		--4th row
		WHEN "00110000" => return  X"08"; 
		WHEN "00110001" => return  X"2E"; 
		WHEN "00110010" => return  X"A1"; 
		WHEN "00110011" => return  X"66"; 
		WHEN "00110100" => return  X"28"; 
		WHEN "00110101" => return  X"D9"; 
		WHEN "00110110" => return  X"24"; 
		WHEN "00110111" => return  X"B2"; 
		WHEN "00111000" => return  X"76"; 
		WHEN "00111001" => return  X"5B"; 
		WHEN "00111010" => return  X"A2"; 
		WHEN "00111011" => return  X"49"; 
		WHEN "00111100" => return  X"6D"; 
		WHEN "00111101" => return  X"8B"; 
		WHEN "00111110" => return  X"D1"; 
		WHEN "00111111" => return  X"25"; 
		
		--5th row
		WHEN "01000000" => return  X"72";  
		WHEN "01000001" => return  X"F8";  
		WHEN "01000010" => return  X"F6";  
		WHEN "01000011" => return  X"64";  
		WHEN "01000100" => return  X"86";  
		WHEN "01000101" => return  X"68";  
		WHEN "01000110" => return  X"98";  
		WHEN "01000111" => return  X"16";  
		WHEN "01001000" => return  X"D4";  
		WHEN "01001001" => return  X"A4";  
		WHEN "01001010" => return  X"5C";  
		WHEN "01001011" => return  X"CC";  
		WHEN "01001100" => return  X"5D";  
		WHEN "01001101" => return  X"65";  
		WHEN "01001110" => return  X"B6";  
		WHEN "01001111" => return  X"92";  
		
		--6th row
		WHEN "01010000" => return  X"6C"; 
		WHEN "01010001" => return  X"70"; 
		WHEN "01010010" => return  X"48"; 
		WHEN "01010011" => return  X"50"; 
		WHEN "01010100" => return  X"FD"; 
		WHEN "01010101" => return  X"ED"; 
		WHEN "01010110" => return  X"B9"; 
		WHEN "01010111" => return  X"DA"; 
		WHEN "01011000" => return  X"5E"; 
		WHEN "01011001" => return  X"15"; 
		WHEN "01011010" => return  X"46"; 
		WHEN "01011011" => return  X"57"; 
		WHEN "01011100" => return  X"A7"; 
		WHEN "01011101" => return  X"8D"; 
		WHEN "01011110" => return  X"9D"; 
		WHEN "01011111" => return  X"84"; 

		--7th row
		WHEN "01100000" => return  X"90"; 
		WHEN "01100001" => return  X"D8"; 
		WHEN "01100010" => return  X"AB"; 
		WHEN "01100011" => return  X"00"; 
		WHEN "01100100" => return  X"8C"; 
		WHEN "01100101" => return  X"BC"; 
		WHEN "01100110" => return  X"D3"; 
		WHEN "01100111" => return  X"0A"; 
		WHEN "01101000" => return  X"F7"; 
		WHEN "01101001" => return  X"E4"; 
		WHEN "01101010" => return  X"58"; 
		WHEN "01101011" => return  X"05"; 
		WHEN "01101100" => return  X"B8"; 
		WHEN "01101101" => return  X"B3"; 
		WHEN "01101110" => return  X"45"; 
		WHEN "01101111" => return  X"06"; 
		
		--8th row
		WHEN "01110000" => return  X"D0"; 
		WHEN "01110001" => return  X"2C"; 
		WHEN "01110010" => return  X"1E"; 
		WHEN "01110011" => return  X"8F"; 
		WHEN "01110100" => return  X"CA"; 
		WHEN "01110101" => return  X"3F"; 
		WHEN "01110110" => return  X"0F"; 
		WHEN "01110111" => return  X"02"; 
		WHEN "01111000" => return  X"C1"; 
		WHEN "01111001" => return  X"AF"; 
		WHEN "01111010" => return  X"BD"; 
		WHEN "01111011" => return  X"03"; 
		WHEN "01111100" => return  X"01"; 
		WHEN "01111101" => return  X"13"; 
		WHEN "01111110" => return  X"8A"; 
		WHEN "01111111" => return  X"6B"; 
		
		--9th row
		WHEN "10000000" => return  X"3A";  
		WHEN "10000001" => return  X"91";  
		WHEN "10000010" => return  X"11";  
		WHEN "10000011" => return  X"41";  
		WHEN "10000100" => return  X"4F";  
		WHEN "10000101" => return  X"67";  
		WHEN "10000110" => return  X"DC";  
		WHEN "10000111" => return  X"EA";  
		WHEN "10001000" => return  X"97";  
		WHEN "10001001" => return  X"F2";  
		WHEN "10001010" => return  X"CF";  
		WHEN "10001011" => return  X"CE";  
		WHEN "10001100" => return  X"F0";  
		WHEN "10001101" => return  X"B4";  
		WHEN "10001110" => return  X"E6";  
		WHEN "10001111" => return  X"73";  
		
		--10th row
		WHEN "10010000" => return  X"96"; 
		WHEN "10010001" => return  X"AC"; 
		WHEN "10010010" => return  X"74"; 
		WHEN "10010011" => return  X"22"; 
		WHEN "10010100" => return  X"E7"; 
		WHEN "10010101" => return  X"AD"; 
		WHEN "10010110" => return  X"35"; 
		WHEN "10010111" => return  X"85"; 
		WHEN "10011000" => return  X"E2"; 
		WHEN "10011001" => return  X"F9"; 
		WHEN "10011010" => return  X"37"; 
		WHEN "10011011" => return  X"E8"; 
		WHEN "10011100" => return  X"1C"; 
		WHEN "10011101" => return  X"75"; 
		WHEN "10011110" => return  X"DF"; 
		WHEN "10011111" => return  X"6E"; 
		
		--11th row
		WHEN "10100000" => return  X"47";  
		WHEN "10100001" => return  X"F1";  
		WHEN "10100010" => return  X"1A";  
		WHEN "10100011" => return  X"71";  
		WHEN "10100100" => return  X"1D";  
		WHEN "10100101" => return  X"29";  
		WHEN "10100110" => return  X"C5";  
		WHEN "10100111" => return  X"89";  
		WHEN "10101000" => return  X"6F";  
		WHEN "10101001" => return  X"B7";  
		WHEN "10101010" => return  X"62";  
		WHEN "10101011" => return  X"0E";  
		WHEN "10101100" => return  X"AA";  
		WHEN "10101101" => return  X"18";  
		WHEN "10101110" => return  X"BE";  
		WHEN "10101111" => return  X"1B";  
		
		--12th row
		WHEN "10110000" => return  X"FC"; 
		WHEN "10110001" => return  X"56"; 
		WHEN "10110010" => return  X"3E"; 
		WHEN "10110011" => return  X"4B"; 
		WHEN "10110100" => return  X"C6"; 
		WHEN "10110101" => return  X"D2"; 
		WHEN "10110110" => return  X"79"; 
		WHEN "10110111" => return  X"20"; 
		WHEN "10111000" => return  X"9A"; 
		WHEN "10111001" => return  X"DB"; 
		WHEN "10111010" => return  X"C0"; 
		WHEN "10111011" => return  X"FE"; 
		WHEN "10111100" => return  X"78"; 
		WHEN "10111101" => return  X"CD"; 
		WHEN "10111110" => return  X"5A"; 
		WHEN "10111111" => return  X"F4"; 
		
		--13th row
		WHEN "11000000" => return  X"1F";  
		WHEN "11000001" => return  X"DD";  
		WHEN "11000010" => return  X"A8";  
		WHEN "11000011" => return  X"33";  
		WHEN "11000100" => return  X"88"; 
		WHEN "11000101" => return  X"07";  
		WHEN "11000110" => return  X"C7";  
		WHEN "11000111" => return  X"31";  
		WHEN "11001000" => return  X"B1";  
		WHEN "11001001" => return  X"12";  
		WHEN "11001010" => return  X"10";  
		WHEN "11001011" => return  X"59";  
		WHEN "11001100" => return  X"27";  
		WHEN "11001101" => return  X"80";  
		WHEN "11001110" => return  X"EC";  
		WHEN "11001111" => return  X"5F";  
 		
		--14th row
		WHEN "11010000" => return  X"60";  
		WHEN "11010001" => return  X"51";  
		WHEN "11010010" => return  X"7F";  
		WHEN "11010011" => return  X"A9";  
		WHEN "11010100" => return  X"19";  
		WHEN "11010101" => return  X"B5";  
		WHEN "11010110" => return  X"4A";  
		WHEN "11010111" => return  X"0D";  
		WHEN "11011000" => return  X"2D";  
		WHEN "11011001" => return  X"E5";  
		WHEN "11011010" => return  X"7A";  
		WHEN "11011011" => return  X"9F";  
		WHEN "11011100" => return  X"93";  
		WHEN "11011101" => return  X"C9";  
		WHEN "11011110" => return  X"9C";  
		WHEN "11011111" => return  X"EF";  
		
		--15th row
		WHEN "11100000" => return  X"A0";  
		WHEN "11100001" => return  X"E0";  
		WHEN "11100010" => return  X"3B";  
		WHEN "11100011" => return  X"4D";  
		WHEN "11100100" => return  X"AE";  
		WHEN "11100101" => return  X"2A";  
		WHEN "11100110" => return  X"F5";  
		WHEN "11100111" => return  X"B0";  
		WHEN "11101000" => return  X"C8";  
		WHEN "11101001" => return  X"EB";  
		WHEN "11101010" => return  X"BB";  
		WHEN "11101011" => return  X"3C";  
		WHEN "11101100" => return  X"83";  
		WHEN "11101101" => return  X"53";  
		WHEN "11101110" => return  X"99";  
		WHEN "11101111" => return  X"61";  
		
		--16th row
 		WHEN "11110000" => return  X"17"; 
		WHEN "11110001" => return  X"2B"; 
		WHEN "11110010" => return  X"04"; 
		WHEN "11110011" => return  X"7E"; 
		WHEN "11110100" => return  X"BA"; 
		WHEN "11110101" => return  X"77"; 
		WHEN "11110110" => return  X"D6"; 
		WHEN "11110111" => return  X"26"; 
		WHEN "11111000" => return  X"E1"; 
		WHEN "11111001" => return  X"69"; 
		WHEN "11111010" => return  X"14"; 
		WHEN "11111011" => return  X"63"; 
		WHEN "11111100" => return  X"55"; 
		WHEN "11111101" => return  X"21"; 
		WHEN "11111110" => return  X"0C"; 
		WHEN "11111111" => return  X"7D"; 
	end case;
end Inv_S_Box_fun;

end package body Inv_S_Box; 

    