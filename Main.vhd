LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.all;

USE work.mypackage.ALL;
USE KeySchedulerFunction.ALL;
USE S_Box.ALL;
USE CORE_FUN.ALL;


	--Define The Core Entity
ENTITY Main IS
PORT(   
		CLK		   : IN STD_LOGIC;
		KEY 		   : IN STD_LOGIC;
		LED         : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);			
		--LCD Control Signals
		LCD_ENABLE 	: OUT STD_LOGIC;
		LCD_RW 		: OUT STD_LOGIC;
		LCD_RS 		: OUT STD_LOGIC;
		
		LCD_ON		: out std_logic;     --jd->  Tego brakowaĂ„â€šĂ˘â‚¬ĹľÄ‚â€žĂ˘â‚¬Â¦Ă„â€šĂ‹ÂÄ‚ËĂ˘â‚¬ĹˇĂ‚Â¬Ă„Ä…Ă‹â€ˇo! 
		--LCD Data Signals
		LCD_DATA 	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);	
	 
end Main;
  
ARCHITECTURE behavior of Main IS
	
  
  COMPONENT LCD_controller IS
    PORT(
		CLK		   : IN STD_LOGIC;
		KEY 		   : IN STD_LOGIC;
		LED         : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);			
		--LCD Control Signals
		LCD_ENABLE 	: OUT STD_LOGIC;
		LCD_RW 		: OUT STD_LOGIC;
		LCD_RS 		: OUT STD_LOGIC;
		RESET  		: IN STD_LOGIC;
		LCD_ON		: out std_logic;     --jd->  Tego brakowaĂ„â€šĂ˘â‚¬ĹľÄ‚â€žĂ˘â‚¬Â¦Ă„â€šĂ‹ÂÄ‚ËĂ˘â‚¬ĹˇĂ‚Â¬Ă„Ä…Ă‹â€ˇo! 
	
		--LCD Data Signals
		LCD_DATA 	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		char_table  : IN char_array
		);
  END COMPONENT;
  
  SIGNAL reset_signal : std_LOGIC;
  SIGNAL CHAR_table : char_array;

	   -- RESULT_BUFFER is defined in KeySchedulerFunction 
  signal GeneratedKey: RESULT_BUFFER; 
  
  -- RoundKeyArrayDoubled is defined in KeySchedulerFunction   
  signal initialKey : RoundKeyArrayDoubled :=  ( X"00", X"01", X"02", X"03",
																 X"04", X"05", X"06", X"07", 
																 X"08", X"09", X"0a", X"0b", 
																 X"0c", X"0d", X"0e", X"0f", 
																 X"00", X"00", X"00", X"00", 
																 X"00", X"00", X"00", X"00",
																 X"00", X"00", X"00", X"00", 
																 X"00", X"00", X"00", X"00" ); 
										 
  
  constant keyType : std_LOGIC_VECTOR(1 downto 0) := "00"; 
  
  signal STATE  : STATE_array :=  ( X"00", X"11", X"22", X"33",
												X"44", X"55", X"66", X"77",
											   X"88", X"99", X"aa", X"bb",
											   X"cc", X"dd", X"ee", X"ff" );
												
  signal AFTER_SUB   	: STATE_array;													  
  signal AFTER_SHIFT 	: STATE_array;													  
  signal AFTER_MIX   	: STATE_array;													  
  signal AFTER_KEY_ADD  : STATE_array;
  
  SIGNAL round_key_s : STATE_array;
	
BEGIN
	dut: LCD_controller
    PORT MAP( 
	 	CLK		   => CLK,
		KEY 		   => KEY,
		LED         => LED,
		--LCD Control Signals
		LCD_ENABLE 	=> LCD_ENABLE,
		LCD_RW	   => LCD_RW,
		LCD_RS 		=> LCD_RS,
		LCD_ON		=> LCD_ON, 
		RESET 		=> reset_signal,
		LCD_DATA    => LCD_DATA,
		CHAR_table => CHAR_table
    );


	PROCESS
			VARIABLE round_count : INTEGER RANGE 10 to 14 := 10;
			VARIABLE actual_round : INTEGER RANGE 0 to 14 := 0;
		BEGIN
			WAIT UNTIL(CLK'EVENT AND CLK = '1');
				
				CASE keyType IS
					WHEN  "00"  =>  round_count := 10;
					WHEN  "01"  =>  round_count := 12; 
					WHEN  "10"  =>  round_count := 14; 
					WHEN OTHERS =>  round_count := 0;
				END CASE;
				
			GeneratedKey <= KeyScheduler(initialKey,keyType);
			
				round_key_S <= (0 => GeneratedKey(actual_round),
									1  => GeneratedKey(actual_round+1),
									2  => GeneratedKey(actual_round+2),
									3  => GeneratedKey(actual_round+3),
									4  => GeneratedKey(actual_round+4),
									5  => GeneratedKey(actual_round+5),
									6  => GeneratedKey(actual_round+6),
									7  => GeneratedKey(actual_round+7),
									8  => GeneratedKey(actual_round+8),
									9  => GeneratedKey(actual_round+9),
									10 => GeneratedKey(actual_round+10),
									11 => GeneratedKey(actual_round+11),
									12 => GeneratedKey(actual_round+12),
									13 => GeneratedKey(actual_round+13),
									14 => GeneratedKey(actual_round+14),
									15 => GeneratedKey(actual_round+15));
		
			
			AFTER_KEY_ADD <= ADD_ROUND_KEY(STATE, round_key_s);
			
			for  actual_round in 1 to round_count-1
			LOOP
			
				AFTER_SUB <= SUBBYTES_F(AFTER_KEY_ADD);
				AFTER_SHIFT<= SHIFT_ROWS_F(AFTER_SUB);
				AFTER_MIX <= MIX_COLUMNS(AFTER_SHIFT);
				round_key_S <= (0 => GeneratedKey(actual_round),
										1  => GeneratedKey(actual_round+1),
										2  => GeneratedKey(actual_round+2),
										3  => GeneratedKey(actual_round+3),
										4  => GeneratedKey(actual_round+4),
										5  => GeneratedKey(actual_round+5),
										6  => GeneratedKey(actual_round+6),
										7  => GeneratedKey(actual_round+7),
										8  => GeneratedKey(actual_round+8),
										9  => GeneratedKey(actual_round+9),
										10 => GeneratedKey(actual_round+10),
										11 => GeneratedKey(actual_round+11),
										12 => GeneratedKey(actual_round+12),
										13 => GeneratedKey(actual_round+13),
										14 => GeneratedKey(actual_round+14),
										15 => GeneratedKey(actual_round+15));

				AFTER_KEY_ADD <= ADD_ROUND_KEY(AFTER_MIX, round_key_s);
				
			end loop;

			
			
			char_table <= (0  => AFTER_KEY_ADD(0),
								1  => AFTER_KEY_ADD(1),
								2  => AFTER_KEY_ADD(2),
								3  => AFTER_KEY_ADD(3),
								4  => AFTER_KEY_ADD(4),
								5  => AFTER_KEY_ADD(5),
								6  => AFTER_KEY_ADD(6),
								7  => AFTER_KEY_ADD(7),
								8  => AFTER_KEY_ADD(8),
								9  => AFTER_KEY_ADD(9),
								10 => AFTER_KEY_ADD(10),
								11 => AFTER_KEY_ADD(11),
								12 => AFTER_KEY_ADD(12),
								13 => AFTER_KEY_ADD(13),
								14 => AFTER_KEY_ADD(14),
								15 => AFTER_KEY_ADD(15));	
								
			 reset_signal <= '1';

			
	END PROCESS;
END behavior;