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
		lcd_rw        : OUT STD_LOGIC;
		lcd_rs        : OUT STD_LOGIC;
		lcd_enable    : OUT STD_LOGIC;
		lcd_on        : OUT STD_LOGIC;  --read/write, setup/data, enable, on turn on/off for lcd
      lcd_data      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); --data signals for lcd

END Main;

ARCHITECTURE behavior OF Main IS
  SIGNAL   lcd_bus    : STD_LOGIC_VECTOR(9 DOWNTO 0);
  SIGNAL   lcd_busy   : STD_LOGIC;
  
  SIGNAL   char_table : char_array;
  SIGNAL   reset : STD_LOGIC;
  SIGNAL   is_working : std_logic;
  
  
  COMPONENT lcd_controller IS
    PORT(
	   CLK_LCD		: IN STD_LOGIC;
      --LCD Control Signals
      LCD_ENABLE 	: OUT STD_LOGIC; --latches data into lcd controller
      LCD_RW 		: OUT STD_LOGIC; --read/write 
      LCD_RS 		: OUT STD_LOGIC; --setup/data

      LCD_ON		: OUT STD_LOGIC; --turns on lcd

      --LCD Data Signals
      LCD_DATA 	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  --data signals for lcd
		
		CHAR_TABLE  : IN char_array;  -- text to display
		
		RESET       : INOUT STD_LOGIC;
		IS_WORKING  : OUT STD_LOGIC);

  END COMPONENT;
 
COMPONENT Round 
PORT(
    data_in         :	IN  STATE_array;
    round_key	     :	IN  STATE_array;
    data_out        :	OUT STATE_array
    );
END COMPONENT; 
  
  -- RESULT_BUFFER is defined in KeySchedulerFunction 
  signal GeneratedKey: RESULT_BUFFER; 
  
  -- RoundKeyArrayDoubled is defined in KeySchedulerFunction   
  signal initialKey : RoundKeyArrayDoubled :=  ( X"00", X"01", X"02", X"03",
																 X"04", X"05", X"06", X"07", 
																 X"08", X"09", X"0a", X"0b", 
																 X"0c", X"0d", X"0e", X"0f", 
																 X"10", X"11", X"12", X"13", 
																 X"14", X"15", X"16", X"17",
																 X"00", X"00", X"00", X"00", 
																 X"00", X"00", X"00", X"00" ); 
										 
  
  constant keyType : std_LOGIC_VECTOR(1 downto 0) := "01"; 
  
  signal STATE  : STATE_array :=  ( X"00", X"11", X"22", X"33",
												X"44", X"55", X"66", X"77",
											   X"88", X"99", X"aa", X"bb",
											   X"cc", X"dd", X"ee", X"ff" );
  signal NEXT_STATE : STATE_array;
  
  BEGIN

  --instantiate the lcd controller
    dut: lcd_controller
    PORT MAP(CLK_LCD => CLK, 
         LCD_ENABLE => lcd_enable, 
         LCD_RS => lcd_rs, 
         LCD_RW => lcd_rw,
			LCD_DATA => lcd_DATA,
			LCD_ON => lcd_ON,
			CHAR_TABLE => char_table,
			RESET => reset,
			IS_WORKING => is_working
     );
		

   	FirstRound: Round	
		PORT MAP(
			data_in         =>	STATE,
			round_key	    =>	STATE,
			data_out        =>	NEXT_STATE
		);
		
  PROCESS(CLK)
    VARIABLE char  :  INTEGER RANGE 0 TO 10 := 0;
  BEGIN
    IF(CLK'EVENT AND CLK = '1') THEN
		GeneratedKey <= KeyScheduler(initialKey,keyType);
		STATE(1)(7 downto 0) <= GeneratedKey(1)(7 downto 0) XOR STATE(1)(7 downto 0);
    END IF;
  END PROCESS;
  
END behavior;
