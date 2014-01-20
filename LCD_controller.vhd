LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.all;

USE work.mypackage.ALL;
--PACKAGE LCD IS
--function PRINT(CLK, 
--END PACKAGE LCD;
--PACKAGE BODY LCD_B IS
--END PACKAGE BODY LCD_B;
	--Define The Core Entity
ENTITY LCD_controller IS
PORT(   
		CLK			: IN STD_LOGIC;
		KEY 			: IN STD_LOGIC;
		LED         : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);			
		--LCD Control Signals
		LCD_ENABLE 	: OUT STD_LOGIC;
		LCD_RW 		: OUT STD_LOGIC;
		LCD_RS 		: OUT STD_LOGIC;
		
		LCD_ON		: out std_logic;     --jd->  Tego brakowało! 
		RESET 		: IN std_logic;
		char_table  : in char_array;

		--LCD Data Signals
		LCD_DATA 	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	 
end LCD_controller;

	--Define The Architecture Of The Entity
ARCHITECTURE behavior of LCD_controller IS

type state_type is (	S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, 
							S10, S11, IDLE);

--type char_array is array (15 downto 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
							
signal current_state: state_type;
shared variable l1, l1b: std_logic;

BEGIN
--LED <= ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');

--LED(0) <= l1;


PROCESS
	VARIABLE cnt: INTEGER RANGE 0 TO 150_000_000;
	VARIABLE table_index: INTEGER RANGE 0 TO 32;
	VARIABLE tmp : INTEGER RANGE 0 TO 1;
	VARIABLE CHAR_VALUE : STD_LOGIC_VECTOR(3 downto 0);
BEGIN


WAIT UNTIL(CLK'EVENT) AND (CLK = '1') AND (RESET='1');

--Count Clock Ticks

	
	IF(cnt = 2_500_000)THEN		
		cnt := 0;
		l1:= not l1;
	ELSE
		cnt := cnt  + 1;
	END IF;
	
	

IF(l1 /= l1b)THEN		
		l1b:=l1;
--	--Next State Logic
--		LED(3) <= '1';
		case current_state is

		
-------------------Function Set-------------------
			 when S0 =>
				current_state <= S3;
				LED <= ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
				LED(0) <= '1';

				LCD_ON 	<= '1';   --jd->  Tego brakowało!  (po resecie LCD wyłącza się)
				--jd->  Pominąłem też błędne stany S1 i S2, bo w sumie nie są potrzebne.
				--jd->  DE2-70 i tak inicjuje LCD po włączeniu
				
--				LCD_DATA		<= "00110000";
--				LCD_RW 		<= '0';
--				LCD_RS		<= '0';

			 when S1 =>
				current_state <= S2;

				LED(1) <= '1';
				
				LCD_DATA		<= "00110000";
				
				LCD_ENABLE	<= '1';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';
				
			 when S2 =>
				current_state <= S3;
				
				LED(2) <= '1';
				
				LCD_DATA		<= "00110000";
				
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';

-------------------Reset Display-------------------				
			 when S3 =>
				current_state <= S4;

				LED(3) <= '1';
				
				LCD_DATA		<= "00000001";
				
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';
				
			 when S4 =>
				current_state <= S5;

				LED(4) <= '1';
				
				LCD_DATA		<= "00000001";
				
				LCD_ENABLE	<= '1';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';	
				
			 when S5 =>
				current_state <= S6;				
				
				LED(5) <= '1';
				
				LCD_DATA		<= "00000001";
				
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';

-------------------Display On-------------------				
			 when S6 =>
				current_state <= S7;					

				LED(6) <= '1';
				
				LCD_DATA		<= "00001110";
				
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';
				
			 when S7 =>
				current_state <= S8;
	
				LED(7) <= '1';
				
				LCD_DATA		<= "00001110";
				
				LCD_ENABLE	<= '1';
				LCD_RW 		<= '0';
				LCD_RS		<= '0';
				
			 when S8 =>
				current_state <= S9;	

				LED(8) <= '1';
				
				LCD_DATA		<= "00001110";
				
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '1';
				
-------------------Write String -------------------				
			 when S9 =>
				current_state <= S10;			

				LED(9) <= '1';
				LED(10) <= '0';
				
				IF (table_index mod 2 = 0 ) THEN
					CHAR_VALUE := char_table(table_index / 2)(7 downto 4);
				ELSE
					CHAR_VALUE := char_table(table_index / 2)(3 downto 0);
				END IF;
	
				CASE CHAR_VALUE iS
					 WHEN "0000" => LCD_DATA <= x"30";
					 WHEN "0001" => LCD_DATA <= x"31";
					 WHEN "0010" => LCD_DATA <= x"32";
					 WHEN "0011" => LCD_DATA <= x"33";
					 WHEN "0100" => LCD_DATA <= x"34";	
					 WHEN "0101" => LCD_DATA <= x"35";
					 WHEN "0110" => LCD_DATA <= x"36";
					 WHEN "0111" => LCD_DATA <= x"37";
					 WHEN "1000" => LCD_DATA <= x"38";
					 WHEN "1001" => LCD_DATA <= x"39";
					 WHEN "1010" => LCD_DATA <= x"41";
					 WHEN "1011" => LCD_DATA <= x"42";
					 WHEN "1100" => LCD_DATA <= x"43";
					 WHEN "1101" => LCD_DATA <= x"44"; 
					 WHEN "1110" => LCD_DATA <= x"45";
					 WHEN "1111" => LCD_DATA <= x"46";
				END CASE;
				
				LCD_ENABLE	<= '1';
				LCD_RW 		<= '0';
				LCD_RS		<= '1';		
				
			 when S10 =>
				IF (table_index < 32) THEN
					current_state <= S9;					
					table_index  := table_index + 1;
					LED(10) <= '1';
					LED(9) <= '0';
				else
					current_state <= S11;
					LED(10) <= '1';
				end if;
				
				IF (table_index mod 2 = 0 ) THEN
					CHAR_VALUE := char_table(table_index / 2)(7 downto 4);
				ELSE
					CHAR_VALUE := char_table(table_index / 2)(3 downto 0);
				END IF;
	
				CASE CHAR_VALUE iS
					 WHEN "0000" => LCD_DATA <= x"30";
					 WHEN "0001" => LCD_DATA <= x"31";
					 WHEN "0010" => LCD_DATA <= x"32";
					 WHEN "0011" => LCD_DATA <= x"33";
					 WHEN "0100" => LCD_DATA <= x"34";	
					 WHEN "0101" => LCD_DATA <= x"35";
					 WHEN "0110" => LCD_DATA <= x"36";
					 WHEN "0111" => LCD_DATA <= x"37";
					 WHEN "1000" => LCD_DATA <= x"38";
					 WHEN "1001" => LCD_DATA <= x"39";
					 WHEN "1010" => LCD_DATA <= x"41";
					 WHEN "1011" => LCD_DATA <= x"42";
					 WHEN "1100" => LCD_DATA <= x"43";
					 WHEN "1101" => LCD_DATA <= x"44"; 
					 WHEN "1110" => LCD_DATA <= x"45";
					 WHEN "1111" => LCD_DATA <= x"46";
				END CASE;
		
			 --LED(13) <= '1';
				LCD_ENABLE	<= '0';
				LCD_RW 		<= '0';
				LCD_RS		<= '1';		
				
			 when S11 =>
			   LED(11) <= '1';

				current_state <= IDLE;
				
			 when IDLE	=>
			 LED(17) <= '1';
			 current_state <= IDLE;
				
		    when others =>
			 current_state <= S0;
	
		end case;	

	END IF;

END PROCESS;

END behavior;