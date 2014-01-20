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
		
		LCD_ON		: out std_logic;     --jd->  Tego brakowaĹ‚o! 
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
		LCD_ON		: out std_logic;     --jd->  Tego brakowaĹ‚o! 
	
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
  signal NEXT_STATE : STATE_array;											  
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
			
			for actual_round in 1 to round_count-1
			LOOP
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
			
				NEXT_STATE <= ROUND_ENC(STATE, round_key_s);
			
				char_table <= (0  => NEXT_STATE(0),
								1  => NEXT_STATE(1),
								2  => NEXT_STATE(2),
								3  => NEXT_STATE(3),
								4  => NEXT_STATE(4),
								5  => NEXT_STATE(5),
								6  => NEXT_STATE(6),
								7  => NEXT_STATE(7),
								8  => NEXT_STATE(8),
								9  => NEXT_STATE(9),
								10 => NEXT_STATE(10),
								11 => NEXT_STATE(11),
								12 => NEXT_STATE(12),
								13 => NEXT_STATE(13),
								14 => NEXT_STATE(14),
								15 => NEXT_STATE(15));
				reset_signal <= '1';
				
				end loop;
			--round_key_s <= generatedKey(round_count); --round_count czy cos innego?
			--xored := ADD_ROUND_KEY(nexT_STATE, round_key_s);
			--bytesub := SUBBYTES(xored);
			--shiftrow := SHIFT_ROWS(bytesub);
			--nexT_STATE := ADD_ROUND_KEY(shiftrow, round_key_s);

			
	END PROCESS;
END behavior;