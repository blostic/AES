LIBRARY ieee;
library My_Functions_package;
library S_Box;
library Inv_S_Box;

USE ieee.std_logic_1164.all;
USE work.ALL;
USE work.mypackage.ALL;

USE KeySchedulerFunction.ALL;
USE S_Box.ALL;

ENTITY Main IS
  PORT(
      CLK           : IN  STD_LOGIC;  --system clock
      rw, rs, e     : OUT STD_LOGIC;  --read/write, setup/data, and enable for lcd
      lcd_data      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); --data signals for lcd

END Main;

ARCHITECTURE behavior OF Main IS
  SIGNAL   lcd_enable : STD_LOGIC;
  SIGNAL   lcd_bus    : STD_LOGIC_VECTOR(9 DOWNTO 0);
  SIGNAL   lcd_busy   : STD_LOGIC;
  
  COMPONENT lcd_controller IS
    PORT(
       CLK            : IN  STD_LOGIC; 
       reset_n        : IN  STD_LOGIC; --active low reinitializes lcd
       lcd_enable     : IN  STD_LOGIC; --latches data into lcd controller
       lcd_bus        : IN  STD_LOGIC_VECTOR(9 DOWNTO 0); --data and control signals
       busy           : OUT STD_LOGIC; --lcd controller busy/idle feedback
       rw, rs, e	 	 : OUT STD_LOGIC; --read/write, setup/data, and enable for lcd
       lcd_data       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); --data signals for lcd
  END COMPONENT;

  COMPONENT Mix_Columns
  PORT(
			input_matrix           :   IN  STATE_array;
			matrix_after_mixing    :   OUT  STATE_array
		 );
	END COMPONENT;
	
	signal round_state_to_xor_S  :   STATE_array;
   signal round_key_S       	  :   STATE_array;
   signal round_state_xored_S   :   STATE_array;
		
	COMPONENT AddRoundKey
	PORT(
		 round_state_to_xor   	: 	IN  STATE_array;
		 round_key 					:  IN  STATE_array;
		 round_state_xored   	: 	OUT STATE_array
		 );
	END COMPONENT;
	
	
  signal GeneratedKey: RESULT_BUFFER; -- RESULT_BUFFER is defined in KeySchedulerFunction
  signal initialKey : RoundKeyArrayDoubled; -- RoundKeyArrayDoubled is defined in KeySchedulerFunction  
  
  constant keyType : std_LOGIC_VECTOR(1 downto 0) := "01"; 
  
  signal STATE : STATE_array;
	
  SIGNAL shiftrow    : STATE_array;
  SIGNAL mixcolumn   : STATE_array;
  
  BEGIN

  --instantiate the lcd controller
  dut: lcd_controller
    PORT MAP(CLK => CLK, 
         reset_n => '1', 
         lcd_enable => lcd_enable, 
         lcd_bus => lcd_bus, 
         busy => lcd_busy, 
         rw => rw, 
         rs => rs, 
         e => e, 
         lcd_data => lcd_data
     );
	  
	  mixcolumn_s: Mix_Columns
		PORT MAP(
		      input_matrix 			 => shiftrow,
				matrix_after_mixing   => mixcolumn
		);
	
	RoundKeyAdder: AddRoundKey
		PORT MAP(   
			round_state_to_xor => round_state_to_xor_S,
			round_key			 => round_key_S,       	
			round_state_xored  => round_state_xored_S
		);
	
	
  initialKey  <= ( X"00", X"01", X"02", X"03",
						 X"04", X"05", X"06", X"07", 
						 X"08", X"09", X"0a", X"0b", 
						 X"0c", X"0d", X"0e", X"0f", 
						 
						 X"10", X"11", X"12", X"13", 
						 X"14", X"15", X"16", X"17",
						 X"00", X"00", X"00", X"00", 
						 X"00", X"00", X"00", X"00" ); 
  
  STATE		  <= ( X"00", X"11", X"22", X"33",
						 X"44", X"55", X"66", X"77",
						 X"88", X"99", X"aa", X"bb",
						 X"cc", X"dd", X"ee", X"ff" );
						 
  PROCESS(CLK)
    VARIABLE char  :  INTEGER RANGE 0 TO 10 := 0;
  BEGIN
    IF(CLK'EVENT AND CLK = '1') THEN
		GeneratedKey <= KeyScheduler(initialKey,keyType);
		STATE(1)(7 downto 0) <= GeneratedKey(1)(7 downto 0) XOR STATE(1)(7 downto 0);
    END IF;
  END PROCESS;
  
END behavior;
