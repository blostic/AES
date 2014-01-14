LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.all;

USE work.mypackage.ALL;
USE KeySchedulerFunction.ALL;
USE S_Box.ALL;


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
		
		LCD_ON		: out std_logic;     --jd->  Tego brakowało! 
		--LCD Data Signals
		LCD_DATA 	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);	
	 
end Main;
  
ARCHITECTURE behavior of Main IS
	
	COMPONENT Round 
	PORT(
		 data_in         :	IN  STATE_array;
		 round_key	     :	IN  STATE_array;
		 data_out        :	OUT STATE_array;
		 run 				  :   IN  std_LOGIC
		 );
	END COMPONENT; 
  
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
		LCD_ON		: out std_logic;     --jd->  Tego brakowało! 
	
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
  signal RUN 		  : std_LOGIC;
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

  FirstRound: Round	
	PORT MAP(
		run      	    =>   RUN,
		data_in         =>	STATE,
		round_key	    =>	STATE,
		data_out        =>	NEXT_STATE
	);
			  
	  
	PROCESS
			VARIABLE round_count : INTEGER RANGE 10 to 14 := 10;
		BEGIN
			WAIT UNTIL(CLK'EVENT AND CLK = '1');
				
				CASE keyType IS
					WHEN  "00"  =>  round_count := 10;
					WHEN  "01"  =>  round_count := 12; 
					WHEN  "10"  =>  round_count := 14; 
					WHEN OTHERS =>  round_count := 0;
				END CASE;

			char_table <= (0 => x"4D",1 =>  x"49",2 =>  x"4B",3 =>  x"52",4 =>  x"4F",5 =>  x"50",6 =>  x"52",7 =>  x"4F",8 => x"43",
				9 =>  x"45",10 =>  x"53",11 =>  x"4F",12 =>  x"52",13 =>  x"59",14 =>  x"21",15 =>  x"21");
			
			 reset_signal <= '1';
			 
	END PROCESS;
END behavior;