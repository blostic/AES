LIBRARY ieee;
library My_Functions_package;
library S_Box;
library Inv_S_Box;

USE ieee.std_logic_1164.all;

ENTITY Main IS
  PORT(
      CLK           : IN  STD_LOGIC;  --system clock
      rw, rs, e : OUT STD_LOGIC;  --read/write, setup/data, and enable for lcd
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
  
  PROCESS(CLK)
    VARIABLE char  :  INTEGER RANGE 0 TO 10 := 0;
  BEGIN
    IF(CLK'EVENT AND CLK = '1') THEN
      IF(lcd_busy = '0' AND lcd_enable = '0' and char < 11) THEN
        lcd_enable <= '1';
        IF(char < 10) THEN
          char := char + 1;
        END IF;
        CASE char IS
          WHEN 1 => lcd_bus <= "1000110001";
          WHEN 2 => lcd_bus <= "1000110010";
          WHEN 3 => lcd_bus <= "1000110011";
          WHEN 4 => lcd_bus <= "1000110100";
          WHEN 5 => lcd_bus <= "1000110101";
          WHEN 6 => lcd_bus <= "1000110110";
          WHEN 7 => lcd_bus <= "1000110111";
          WHEN 8 => lcd_bus <= "1000111000";
          WHEN 9 => lcd_bus <= "1000111001";
          WHEN 10 => lcd_bus <="0000001110";
          WHEN OTHERS => lcd_enable <= '0';
        END CASE;
      ELSE
        lcd_enable <= '0';
      END IF;
    END IF;
  END PROCESS;
  
END behavior;
