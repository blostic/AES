
library IEEE;
use IEEE.std_logic_1164.all; 
USE work.ALL;
use S_Box.all;

package KeySchedulerFunction is 

	type RoundKeyArrayDoubled is array (0 to 31) of std_logic_vector(7 downto 0);
	type RESULT_BUFFER is array (0 to 256 ) of STD_LOGIC_VECTOR(7 downto 0);
	
function KeyScheduler( 
		--key_in contains initial key for key generator  
	
		key_in : IN RoundKeyArrayDoubled;
		-- type of key: 
		-- 00 - 128 bits 
		-- 01 - 192 bits
		-- 10 - 256 bits 
		key_length_type  :  IN  std_logic_vector(1 downto 0))
		--key_out contains round key for at most 14 rounds (14 * 128). 		  
	return RESULT_BUFFER;
	
end package KeySchedulerFunction;  

package body KeySchedulerFunction is 
		
function KeyScheduler(
			key_in  			  :  IN  RoundKeyArrayDoubled;
			key_length_type  :  IN  std_logic_vector(1 downto 0)) 
			return RESULT_BUFFER is
			
	type RCON_TABLE is array (0 to 14) of STD_LOGIC_VECTOR(7 downto 0);
	
	variable RCON : RCON_TABLE;
	variable roundKey : RESULT_BUFFER;
	variable b,n,it,offset: integer; 

begin
	--component instantiation
	Rcon := (x"01", x"02", x"04", x"08", x"10", x"20", x"40", x"80", x"1b", x"36", x"6c", x"d8", x"ab", x"4d", x"9a");

	CASE key_length_type IS
		 WHEN  "00"  =>  b := 176; n := 16;
		 WHEN  "01"  =>  b := 208; n := 24; 
		 WHEN  "10"  =>  b := 240; n := 32; 
		 WHEN OTHERS =>  b := 0;
	END CASE;

	it := 0;
	offset := n;
	
	FOR i IN 0 TO n-1 LOOP
		roundKey(i) := key_in(i);
	END LOOP;
	
	while offset<b loop
		
		roundKey(offset) 	 := S_Box_fun( roundKey( offset-3) ) XOR roundKey( offset-n) XOR Rcon(it);
		roundKey(offset+1) := S_Box_fun( roundKey( offset-2) ) XOR roundKey( offset-n+1 );
		roundKey(offset+2) := S_Box_fun( roundKey( offset-1) ) XOR roundKey( offset-n+2 );
		roundKey(offset+3) := S_Box_fun( roundKey( offset-4) ) XOR roundKey( offset-n+3 );

		for X in 1 to 4 loop
			for Y in 0 to 4 loop
				roundKey(offset+x*4+y) := roundKey(offset+x*4+y-4) XOR roundKey(offset+x*4+y-n);
			end loop;
		end loop;
		
		offset := offset + 16;
		it := it + 1;
		
		if ( key_length_type = "10") then 
		   roundKey(offset)   := S_Box_fun( roundKey( offset - 4 ) ) XOR roundKey( offset - n );
			roundKey(offset+1) := S_Box_fun( roundKey( offset - 3 ) ) XOR roundKey( offset - n + 1 );
			roundKey(offset+2) := S_Box_fun( roundKey( offset - 2 ) ) XOR roundKey( offset - n + 2 );
			roundKey(offset+3) := S_Box_fun( roundKey( offset - 1 ) ) XOR roundKey( offset - n + 3 );
			for X in 1 to 4 loop
				for Y in 0 to 4 loop
					roundKey(offset+x*4+y) := roundKey(offset+x*4+y-4) XOR roundKey(offset+x*4+y-n);
				end loop;
			end loop;
			offset := offset + 16;
			
		elsif ( key_length_type = "01" ) then 
			for X in 0 to 2 loop
				for Y in 0 to 4 loop
					roundKey(offset+x*4+y) := roundKey(offset+x*4+y-4) XOR roundKey(offset+x*4+y-n);
				end loop;
			end loop;
			offset := offset + 8;
		end if;
		
	end loop;
	
   return roundKey;
end KeyScheduler;

end package body KeySchedulerFunction; 
