library IEEE;
use IEEE.STD_LOGIC_1164.all;

package lcd_package is

type LCD_CHARS is array (1 to 2, 1 to 16) of std_logic_vector(7 downto 0);


component LCD is
Port ( CLK   : in  STD_LOGIC;
LCD_RS       : out STD_LOGIC;
LCD_RW       : out STD_LOGIC;
LCD_E        : out STD_LOGIC;
LCD_D        : out STD_LOGIC_VECTOR(7 downto 4);
Chars 		 : in LCD_CHARS
);
  end component;

end lcd_package; 

package body lcd_package is


end lcd_package; 

