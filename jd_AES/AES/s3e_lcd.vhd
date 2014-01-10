library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.NUMERIC_STD.ALL;

library work;
use work.lcd_package.all;

entity s3e_lcd is
    Port ( clk       : in  STD_LOGIC;
			  KEY 		: in STD_LOGIC;
			  
           LCD_RS_PIN    : out STD_LOGIC;
           LCD_RW_PIN    : out STD_LOGIC;
           LCD_E_PIN     : out STD_LOGIC;
           LCD_D_PIN     : out STD_LOGIC_VECTOR(7 downto 4) );
end s3e_lcd;

architecture Behavioral of s3e_lcd is

signal LCD_RS    : STD_LOGIC;
signal LCD_RW    : STD_LOGIC;
signal LCD_E     : STD_LOGIC;
signal LCD_D     : STD_LOGIC_VECTOR(7 downto 4);

-- Fill with space (' ') character
signal Chars : LCD_CHARS := ( 
                              ( "00100000", "00100000", "00100000", "00100000",
                                "00100000", "00100000", "00100000", "00100000",
                                "00100000", "00100000", "00100000", "00100000",
                                "00100000", "00100000", "00100000", "00100000"  ),
                              ( "00100000", "00100000", "00100000", "00100000",
                                "00100000", "00100000", "00100000", "00100000",
                                "00100000", "00100000", "00100000", "00100000",
                                "00100000", "00100000", "00100000", "00100000"  ) );


begin    

  S3E_LCD : LCD port map ( 
           CLK          => CLK,
           LCD_RS       => LCD_RS,
           LCD_RW       => LCD_RW,
           LCD_E        => LCD_E,
           LCD_D        => LCD_D,
			  Chars 			=> Chars
);

  Chars(2,13) <= std_logic_vector(to_unsigned(character'pos('('),8)); --"00101000";   -- '('
  Chars(2,14) <= std_logic_vector(to_unsigned(character'pos('2'),8)); --"00110010";   -- '2'
  Chars(2,15) <= std_logic_vector(to_unsigned(character'pos('K'),8)); --"01001011";   -- 'K'
  Chars(2,16) <= std_logic_vector(to_unsigned(character'pos(')'),8)); --"00101001";   -- ')'
  
  process (clk) 
  begin
    if (KEY = '1') then	
		if rising_edge(clk) then
			LCD_RS_PIN <= LCD_RS;
			LCD_RW_PIN <= LCD_RW;
			LCD_E_PIN  <= LCD_E;
			LCD_D_PIN  <= LCD_D;
		end if;	
    end if;
  end process;    
  
 
end Behavioral;
