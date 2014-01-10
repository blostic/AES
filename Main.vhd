LIBRARY ieee;
library My_Functions_package;
library S_Box;
library Inv_S_Box;

USE ieee.std_logic_1164.all;
USE work.ALL;
USE KeySchedulerFunction.ALL;

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
	
  signal GeneratedKey: RESULT_BUFFER; -- RESULT_BUFFER is defined in KeySchedulerFunction
 
  signal initialKey : RoundKeyArrayDoubled; -- RoundKeyArrayDoubled is defined in KeySchedulerFunction  
  constant keyType : std_LOGIC_VECTOR(1 downto 0) := "01"; 
  
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
	  
  initialKey  <= ( X"00", X"01", X"02", X"03", X"04", X"05", X"06", X"07", X"08", X"09", X"0a", X"0b", 
						 X"0c", X"0d", X"0e", X"0f", X"10", X"11", X"12", X"13", X"14", X"15", X"16", X"17",
						 X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00" ); 
  
  --state		  <= ( X"00", X"01", X"02", X"03", X"04", X"05", X"06", X"07", X"08", X"09", X"0a", X"0b", X"0c", X"0d", X"0e", X"0f",
  --						 X"10", X"11", X"12", X"13", X"14", X"15", X"16", X"17" );
						 
  PROCESS(CLK)
    VARIABLE char  :  INTEGER RANGE 0 TO 10 := 0;
  BEGIN
    IF(CLK'EVENT AND CLK = '1') THEN
		GeneratedKey <= KeyScheduler(initialKey,keyType);
		
    END IF;
  END PROCESS;
  
END behavior;
