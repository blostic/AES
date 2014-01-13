LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.mypackage.all;
	--Define The Core Entity
ENTITY LCD_controller IS
PORT(   
		CLK_LCD		: IN STD_LOGIC;
		--KEY 		: IN STD_LOGIC;
		--LED         : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);			
		--LCD Control Signals
		LCD_ENABLE 	: OUT STD_LOGIC;
		LCD_RW 		: OUT STD_LOGIC;
		LCD_RS 		: OUT STD_LOGIC;
		
		LCD_ON		: out std_logic;     --jd->  Tego brakowało! 
	
		--LCD Data Signals
		LCD_DATA 	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		
		--Char_array
		char_table  : IN char_array; --text to display
		
		RESET       : INOUT STD_LOGIC;
		IS_WORKING  : OUT STD_LOGIC);
end LCD_controller;

	--Define The Architecture Of The Entity
ARCHITECTURE behavior of LCD_controller IS

type state_type is (	S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, IDLE);
							
signal current_state: state_type;

shared variable l1, l1b: std_logic;

BEGIN

PROCESS
VARIABLE cnt: INTEGER RANGE 0 TO 150_000_000;
VARIABLE table_index: INTEGER RANGE 0 TO 32;

BEGIN

WAIT UNTIL(CLK_LCD'EVENT) AND (CLK_LCD = '1') AND (RESET = '1');
--oznaczać stany kombinacją reset i is_working (jedną zmienna sterujemy stąd a drugą z maina, da sie?)
--Count Clock Ticks
	IS_WORKING <= '1';
	
	IF(cnt = 2_500_000)THEN		
		cnt := 0;
		l1:= not l1;
	ELSE
		cnt := cnt  + 1;
	END IF;
	
	

IF(l1 /= l1b)THEN		
		l1b:=l1;
	--Next State Logic
		case current_state is

-------------------Function Set-------------------
			 when S0 =>
				current_state <= S1;
				--LED <= ('0','0','0','0','0','0','0','0','0','0','0');
				--LED(0) <= '1';

				LCD_ON 	<= '1';   --jd->  Tego brakowało!  (po resecie LCD wyłącza się)

-------------------Reset Display-------------------				
			 when S1 =>
				current_state <= S2;

				--LED(1) <= '1';
				
				LCD_DATA		<= "00000001";
				
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';
				
			 when S2 =>
				current_state <= S3;

				--LED(2) <= '1';
				
				LCD_DATA		<= "00000001";
				
				LCD_ENABLE	<= '1';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';	
				
			 when S3 =>
				current_state <= S4;				
				
				--LED(3) <= '1';
				
				LCD_DATA		<= "00000001";
				
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';

-------------------Display On-------------------				
			 when S4 =>
				current_state <= S5;					

				--LED(4) <= '1';
				
				LCD_DATA		<= "00001110";
				
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';
				
			 when S5 =>
				current_state <= S6;
	
				--LED(5) <= '1';
				
				LCD_DATA		<= "00001110";
				
				LCD_ENABLE	<= '1';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';
				
			 when S6 =>
				current_state <= S7;	

				--LED(6) <= '1';
				
				LCD_DATA		<= "00001110";
				
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '1';
				
-------------------Write String -------------------				
			 when S7 =>
				current_state <= S8;			
				
				--LED(8) <= '0';
				--LED(7) <= '1';
				
				LCD_DATA		<= char_table(table_index);
				
				LCD_ENABLE	<= '1';
				LCD_RW 		<= '0';
				LCD_RS		<= '1';		
				
			 when S8 =>
				IF (table_index < 32) THEN
					table_index := table_index + 1;
					current_state <= S7;
					--LED(8) <= '1';
					--LED(9) <= '0';
				else
					current_state <= S9;
					--LED(8) <= '1';
				end if;

				LCD_DATA		<= char_table(table_index);
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '1';		
				
			 when S9 =>
			   --LED(9) <= '1';

				current_state <= IDLE;
				
			 when IDLE	=>
			 --LED(10) <= '1';
			 IS_WORKING <= '0';
			 --RESET <= '0';
			 current_state <= IDLE;
				
		    when others =>
			 current_state <= S0;
	
		end case;	

	END IF;

END PROCESS;

END behavior;