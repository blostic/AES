-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 12.0 Build 263 08/02/2012 Service Pack 2 SJ Web Edition"

-- DATE "01/20/2014 19:11:09"

-- 
-- Device: Altera EP2C70F896C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Main IS
    PORT (
	CLK : IN std_logic;
	KEY : IN std_logic;
	LED : OUT std_logic_vector(17 DOWNTO 0);
	LCD_ENABLE : OUT std_logic;
	LCD_RW : OUT std_logic;
	LCD_RS : OUT std_logic;
	LCD_ON : OUT std_logic;
	LCD_DATA : OUT std_logic_vector(7 DOWNTO 0)
	);
END Main;

-- Design Ports Information
-- KEY	=>  Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- LED[0]	=>  Location: PIN_AJ6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[1]	=>  Location: PIN_AK5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[2]	=>  Location: PIN_AJ5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[3]	=>  Location: PIN_AJ4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[4]	=>  Location: PIN_AK3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[5]	=>  Location: PIN_AH4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[6]	=>  Location: PIN_AJ3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[7]	=>  Location: PIN_AJ2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[8]	=>  Location: PIN_AH3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[9]	=>  Location: PIN_AD14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[10]	=>  Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[11]	=>  Location: PIN_AB13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[12]	=>  Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[13]	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[14]	=>  Location: PIN_AC11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[15]	=>  Location: PIN_AD9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[16]	=>  Location: PIN_AD8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LED[17]	=>  Location: PIN_AJ7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_ENABLE	=>  Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_RW	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_RS	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_ON	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_DATA[0]	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_DATA[1]	=>  Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_DATA[2]	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_DATA[3]	=>  Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_DATA[4]	=>  Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_DATA[5]	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_DATA[6]	=>  Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_DATA[7]	=>  Location: PIN_B2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLK	=>  Location: PIN_AD15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Main IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_KEY : std_logic;
SIGNAL ww_LED : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_LCD_ENABLE : std_logic;
SIGNAL ww_LCD_RW : std_logic;
SIGNAL ww_LCD_RS : std_logic;
SIGNAL ww_LCD_ON : std_logic;
SIGNAL ww_LCD_DATA : std_logic_vector(7 DOWNTO 0);
SIGNAL \CLK~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dut|Add1~9\ : std_logic;
SIGNAL \dut|Add0~12_combout\ : std_logic;
SIGNAL \dut|Add0~20_combout\ : std_logic;
SIGNAL \dut|Add0~26_combout\ : std_logic;
SIGNAL \dut|Add0~34_combout\ : std_logic;
SIGNAL \dut|Add0~38_combout\ : std_logic;
SIGNAL \dut|Add0~40_combout\ : std_logic;
SIGNAL \dut|Add0~48_combout\ : std_logic;
SIGNAL \dut|Add1~10_combout\ : std_logic;
SIGNAL \dut|Equal0~2_combout\ : std_logic;
SIGNAL \dut|Equal0~5_combout\ : std_logic;
SIGNAL \dut|l1b~regout\ : std_logic;
SIGNAL \dut|Mux1~0_combout\ : std_logic;
SIGNAL \dut|Selector19~1_combout\ : std_logic;
SIGNAL \dut|Selector15~1_combout\ : std_logic;
SIGNAL \dut|Selector13~1_combout\ : std_logic;
SIGNAL \dut|cnt~4_combout\ : std_logic;
SIGNAL \dut|cnt~5_combout\ : std_logic;
SIGNAL \dut|cnt~6_combout\ : std_logic;
SIGNAL \dut|Mux0~0_combout\ : std_logic;
SIGNAL \dut|Mux0~1_combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \CLK~clkctrl_outclk\ : std_logic;
SIGNAL \dut|current_state.S0~feeder_combout\ : std_logic;
SIGNAL \dut|Add0~0_combout\ : std_logic;
SIGNAL \dut|Add0~7\ : std_logic;
SIGNAL \dut|Add0~9\ : std_logic;
SIGNAL \dut|Add0~10_combout\ : std_logic;
SIGNAL \dut|cnt~1_combout\ : std_logic;
SIGNAL \dut|Add0~11\ : std_logic;
SIGNAL \dut|Add0~13\ : std_logic;
SIGNAL \dut|Add0~14_combout\ : std_logic;
SIGNAL \dut|cnt~2_combout\ : std_logic;
SIGNAL \dut|Add0~15\ : std_logic;
SIGNAL \dut|Add0~16_combout\ : std_logic;
SIGNAL \dut|cnt~3_combout\ : std_logic;
SIGNAL \dut|Add0~17\ : std_logic;
SIGNAL \dut|Add0~18_combout\ : std_logic;
SIGNAL \dut|Add0~19\ : std_logic;
SIGNAL \dut|Add0~21\ : std_logic;
SIGNAL \dut|Add0~22_combout\ : std_logic;
SIGNAL \dut|Add0~23\ : std_logic;
SIGNAL \dut|Add0~24_combout\ : std_logic;
SIGNAL \dut|Add0~25\ : std_logic;
SIGNAL \dut|Add0~27\ : std_logic;
SIGNAL \dut|Add0~28_combout\ : std_logic;
SIGNAL \dut|Add0~29\ : std_logic;
SIGNAL \dut|Add0~30_combout\ : std_logic;
SIGNAL \dut|Add0~31\ : std_logic;
SIGNAL \dut|Add0~32_combout\ : std_logic;
SIGNAL \dut|Add0~33\ : std_logic;
SIGNAL \dut|Add0~35\ : std_logic;
SIGNAL \dut|Add0~36_combout\ : std_logic;
SIGNAL \dut|cnt~7_combout\ : std_logic;
SIGNAL \dut|Add0~37\ : std_logic;
SIGNAL \dut|Add0~39\ : std_logic;
SIGNAL \dut|Add0~41\ : std_logic;
SIGNAL \dut|Add0~42_combout\ : std_logic;
SIGNAL \dut|cnt~8_combout\ : std_logic;
SIGNAL \dut|Add0~43\ : std_logic;
SIGNAL \dut|Add0~45\ : std_logic;
SIGNAL \dut|Add0~46_combout\ : std_logic;
SIGNAL \dut|Add0~47\ : std_logic;
SIGNAL \dut|Add0~49\ : std_logic;
SIGNAL \dut|Add0~50_combout\ : std_logic;
SIGNAL \dut|Add0~51\ : std_logic;
SIGNAL \dut|Add0~52_combout\ : std_logic;
SIGNAL \dut|Add0~53\ : std_logic;
SIGNAL \dut|Add0~54_combout\ : std_logic;
SIGNAL \dut|Equal0~7_combout\ : std_logic;
SIGNAL \dut|Add0~44_combout\ : std_logic;
SIGNAL \dut|Equal0~6_combout\ : std_logic;
SIGNAL \dut|Equal0~8_combout\ : std_logic;
SIGNAL \dut|cnt~0_combout\ : std_logic;
SIGNAL \dut|Add0~1\ : std_logic;
SIGNAL \dut|Add0~3\ : std_logic;
SIGNAL \dut|Add0~4_combout\ : std_logic;
SIGNAL \dut|Add0~5\ : std_logic;
SIGNAL \dut|Add0~6_combout\ : std_logic;
SIGNAL \dut|Add0~2_combout\ : std_logic;
SIGNAL \dut|Equal0~0_combout\ : std_logic;
SIGNAL \dut|Add0~8_combout\ : std_logic;
SIGNAL \dut|Equal0~1_combout\ : std_logic;
SIGNAL \dut|Equal0~3_combout\ : std_logic;
SIGNAL \dut|Equal0~4_combout\ : std_logic;
SIGNAL \dut|l1~0_combout\ : std_logic;
SIGNAL \dut|l1~regout\ : std_logic;
SIGNAL \dut|process_0~0_combout\ : std_logic;
SIGNAL \dut|current_state.S0~regout\ : std_logic;
SIGNAL \dut|current_state.S3~0_combout\ : std_logic;
SIGNAL \dut|current_state.S3~regout\ : std_logic;
SIGNAL \dut|Selector10~0_combout\ : std_logic;
SIGNAL \dut|Selector9~0_combout\ : std_logic;
SIGNAL \dut|current_state.S4~regout\ : std_logic;
SIGNAL \dut|current_state.S5~regout\ : std_logic;
SIGNAL \dut|Selector8~0_combout\ : std_logic;
SIGNAL \dut|current_state.S6~regout\ : std_logic;
SIGNAL \dut|Selector7~0_combout\ : std_logic;
SIGNAL \dut|current_state.S7~regout\ : std_logic;
SIGNAL \dut|Selector6~0_combout\ : std_logic;
SIGNAL \dut|Selector5~0_combout\ : std_logic;
SIGNAL \dut|Selector0~0_combout\ : std_logic;
SIGNAL \dut|current_state.S9~regout\ : std_logic;
SIGNAL \dut|current_state.S10~regout\ : std_logic;
SIGNAL \dut|table_index[5]~5_combout\ : std_logic;
SIGNAL \dut|Selector4~0_combout\ : std_logic;
SIGNAL \dut|Selector4~1_combout\ : std_logic;
SIGNAL \dut|Selector3~0_combout\ : std_logic;
SIGNAL \dut|current_state~17_combout\ : std_logic;
SIGNAL \dut|current_state.S11~regout\ : std_logic;
SIGNAL \dut|Selector2~0_combout\ : std_logic;
SIGNAL \dut|Selector1~0_combout\ : std_logic;
SIGNAL \dut|current_state.IDLE~0_combout\ : std_logic;
SIGNAL \dut|current_state.IDLE~regout\ : std_logic;
SIGNAL \dut|Selector20~0_combout\ : std_logic;
SIGNAL \dut|Selector20~1_combout\ : std_logic;
SIGNAL \dut|LCD_ENABLE~regout\ : std_logic;
SIGNAL \dut|Selector21~0_combout\ : std_logic;
SIGNAL \dut|Selector21~1_combout\ : std_logic;
SIGNAL \dut|LCD_RS~regout\ : std_logic;
SIGNAL \dut|WideOr18~0_combout\ : std_logic;
SIGNAL \dut|Add1~0_combout\ : std_logic;
SIGNAL \dut|table_index~4_combout\ : std_logic;
SIGNAL \dut|table_index[4]~6_combout\ : std_logic;
SIGNAL \dut|Add1~1\ : std_logic;
SIGNAL \dut|Add1~3\ : std_logic;
SIGNAL \dut|Add1~4_combout\ : std_logic;
SIGNAL \dut|table_index~1_combout\ : std_logic;
SIGNAL \dut|Add1~5\ : std_logic;
SIGNAL \dut|Add1~6_combout\ : std_logic;
SIGNAL \dut|table_index~2_combout\ : std_logic;
SIGNAL \dut|Add1~7\ : std_logic;
SIGNAL \dut|Add1~8_combout\ : std_logic;
SIGNAL \dut|table_index~3_combout\ : std_logic;
SIGNAL \dut|Mux13~3_combout\ : std_logic;
SIGNAL \dut|Mux13~6_combout\ : std_logic;
SIGNAL \dut|CHAR_VALUE~5_combout\ : std_logic;
SIGNAL \dut|CHAR_VALUE~6_combout\ : std_logic;
SIGNAL \dut|Add1~2_combout\ : std_logic;
SIGNAL \dut|table_index~0_combout\ : std_logic;
SIGNAL \dut|Mux19~0_combout\ : std_logic;
SIGNAL \dut|Mux15~0_combout\ : std_logic;
SIGNAL \dut|CHAR_VALUE~1_combout\ : std_logic;
SIGNAL \dut|Mux21~0_combout\ : std_logic;
SIGNAL \dut|CHAR_VALUE~0_combout\ : std_logic;
SIGNAL \dut|Mux27~0_combout\ : std_logic;
SIGNAL \dut|Selector19~0_combout\ : std_logic;
SIGNAL \dut|Selector19~2_combout\ : std_logic;
SIGNAL \dut|current_state.S8~regout\ : std_logic;
SIGNAL \dut|Selector18~0_combout\ : std_logic;
SIGNAL \dut|Mux12~4_combout\ : std_logic;
SIGNAL \dut|Mux12~5_combout\ : std_logic;
SIGNAL \dut|Selector18~1_combout\ : std_logic;
SIGNAL \dut|Mux26~0_combout\ : std_logic;
SIGNAL \dut|Selector18~2_combout\ : std_logic;
SIGNAL \dut|LCD_DATA[1]~2_combout\ : std_logic;
SIGNAL \dut|Mux14~0_combout\ : std_logic;
SIGNAL \dut|Mux14~1_combout\ : std_logic;
SIGNAL \dut|Mux25~0_combout\ : std_logic;
SIGNAL \dut|Mux11~3_combout\ : std_logic;
SIGNAL \dut|Mux11~4_combout\ : std_logic;
SIGNAL \dut|Selector17~0_combout\ : std_logic;
SIGNAL \dut|Selector17~1_combout\ : std_logic;
SIGNAL \dut|Selector16~3_combout\ : std_logic;
SIGNAL \dut|Selector16~14_combout\ : std_logic;
SIGNAL \dut|Selector16~12_combout\ : std_logic;
SIGNAL \dut|Selector16~13_combout\ : std_logic;
SIGNAL \dut|Mux5~0_combout\ : std_logic;
SIGNAL \dut|CHAR_VALUE~2_combout\ : std_logic;
SIGNAL \dut|CHAR_VALUE~3_combout\ : std_logic;
SIGNAL \dut|CHAR_VALUE~4_combout\ : std_logic;
SIGNAL \dut|Selector15~0_combout\ : std_logic;
SIGNAL \dut|Selector15~2_combout\ : std_logic;
SIGNAL \dut|Selector15~3_combout\ : std_logic;
SIGNAL \dut|Selector13~0_combout\ : std_logic;
SIGNAL \dut|Selector13~2_combout\ : std_logic;
SIGNAL \dut|table_index\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \dut|cnt\ : std_logic_vector(27 DOWNTO 0);
SIGNAL \dut|LED\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \dut|LCD_DATA\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_CLK <= CLK;
ww_KEY <= KEY;
LED <= ww_LED;
LCD_ENABLE <= ww_LCD_ENABLE;
LCD_RW <= ww_LCD_RW;
LCD_RS <= ww_LCD_RS;
LCD_ON <= ww_LCD_ON;
LCD_DATA <= ww_LCD_DATA;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK~combout\);

-- Location: LCCOMB_X7_Y19_N24
\dut|Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add1~8_combout\ = (\dut|table_index\(4) & (\dut|Add1~7\ $ (GND))) # (!\dut|table_index\(4) & (!\dut|Add1~7\ & VCC))
-- \dut|Add1~9\ = CARRY((\dut|table_index\(4) & !\dut|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|table_index\(4),
	datad => VCC,
	cin => \dut|Add1~7\,
	combout => \dut|Add1~8_combout\,
	cout => \dut|Add1~9\);

-- Location: LCCOMB_X9_Y21_N16
\dut|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~12_combout\ = (\dut|cnt\(6) & (\dut|Add0~11\ $ (GND))) # (!\dut|cnt\(6) & (!\dut|Add0~11\ & VCC))
-- \dut|Add0~13\ = CARRY((\dut|cnt\(6) & !\dut|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(6),
	datad => VCC,
	cin => \dut|Add0~11\,
	combout => \dut|Add0~12_combout\,
	cout => \dut|Add0~13\);

-- Location: LCCOMB_X9_Y21_N24
\dut|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~20_combout\ = (\dut|cnt\(10) & (\dut|Add0~19\ $ (GND))) # (!\dut|cnt\(10) & (!\dut|Add0~19\ & VCC))
-- \dut|Add0~21\ = CARRY((\dut|cnt\(10) & !\dut|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(10),
	datad => VCC,
	cin => \dut|Add0~19\,
	combout => \dut|Add0~20_combout\,
	cout => \dut|Add0~21\);

-- Location: LCCOMB_X9_Y21_N30
\dut|Add0~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~26_combout\ = (\dut|cnt\(13) & (!\dut|Add0~25\)) # (!\dut|cnt\(13) & ((\dut|Add0~25\) # (GND)))
-- \dut|Add0~27\ = CARRY((!\dut|Add0~25\) # (!\dut|cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(13),
	datad => VCC,
	cin => \dut|Add0~25\,
	combout => \dut|Add0~26_combout\,
	cout => \dut|Add0~27\);

-- Location: LCCOMB_X9_Y20_N6
\dut|Add0~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~34_combout\ = (\dut|cnt\(17) & (!\dut|Add0~33\)) # (!\dut|cnt\(17) & ((\dut|Add0~33\) # (GND)))
-- \dut|Add0~35\ = CARRY((!\dut|Add0~33\) # (!\dut|cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(17),
	datad => VCC,
	cin => \dut|Add0~33\,
	combout => \dut|Add0~34_combout\,
	cout => \dut|Add0~35\);

-- Location: LCCOMB_X9_Y20_N10
\dut|Add0~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~38_combout\ = (\dut|cnt\(19) & (!\dut|Add0~37\)) # (!\dut|cnt\(19) & ((\dut|Add0~37\) # (GND)))
-- \dut|Add0~39\ = CARRY((!\dut|Add0~37\) # (!\dut|cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(19),
	datad => VCC,
	cin => \dut|Add0~37\,
	combout => \dut|Add0~38_combout\,
	cout => \dut|Add0~39\);

-- Location: LCCOMB_X9_Y20_N12
\dut|Add0~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~40_combout\ = (\dut|cnt\(20) & (\dut|Add0~39\ $ (GND))) # (!\dut|cnt\(20) & (!\dut|Add0~39\ & VCC))
-- \dut|Add0~41\ = CARRY((\dut|cnt\(20) & !\dut|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(20),
	datad => VCC,
	cin => \dut|Add0~39\,
	combout => \dut|Add0~40_combout\,
	cout => \dut|Add0~41\);

-- Location: LCCOMB_X9_Y20_N20
\dut|Add0~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~48_combout\ = (\dut|cnt\(24) & (\dut|Add0~47\ $ (GND))) # (!\dut|cnt\(24) & (!\dut|Add0~47\ & VCC))
-- \dut|Add0~49\ = CARRY((\dut|cnt\(24) & !\dut|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(24),
	datad => VCC,
	cin => \dut|Add0~47\,
	combout => \dut|Add0~48_combout\,
	cout => \dut|Add0~49\);

-- Location: LCCOMB_X7_Y19_N26
\dut|Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add1~10_combout\ = \dut|Add1~9\ $ (\dut|table_index\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \dut|table_index\(5),
	cin => \dut|Add1~9\,
	combout => \dut|Add1~10_combout\);

-- Location: LCFF_X9_Y21_N17
\dut|cnt[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(6));

-- Location: LCFF_X8_Y21_N31
\dut|cnt[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(10));

-- Location: LCCOMB_X8_Y21_N20
\dut|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Equal0~2_combout\ = (\dut|cnt\(8) & (\dut|cnt\(10) & (!\dut|cnt\(11) & !\dut|cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(8),
	datab => \dut|cnt\(10),
	datac => \dut|cnt\(11),
	datad => \dut|cnt\(9),
	combout => \dut|Equal0~2_combout\);

-- Location: LCFF_X8_Y21_N11
\dut|cnt[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|cnt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(13));

-- Location: LCFF_X8_Y21_N29
\dut|cnt[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|cnt~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(17));

-- Location: LCFF_X9_Y20_N11
\dut|cnt[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(19));

-- Location: LCCOMB_X8_Y21_N12
\dut|Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Equal0~5_combout\ = (\dut|cnt\(18) & (\dut|cnt\(17) & (!\dut|cnt\(19) & !\dut|cnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(18),
	datab => \dut|cnt\(17),
	datac => \dut|cnt\(19),
	datad => \dut|cnt\(16),
	combout => \dut|Equal0~5_combout\);

-- Location: LCFF_X9_Y20_N13
\dut|cnt[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(20));

-- Location: LCFF_X9_Y20_N21
\dut|cnt[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(24));

-- Location: LCFF_X8_Y21_N9
\dut|l1b\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|l1~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|l1b~regout\);

-- Location: LCCOMB_X10_Y19_N12
\dut|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux1~0_combout\ = (\dut|table_index\(1) & ((\dut|table_index\(4)) # ((\dut|table_index\(2) & \dut|table_index\(3))))) # (!\dut|table_index\(1) & (\dut|table_index\(4) & (\dut|table_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(1),
	datab => \dut|table_index\(4),
	datac => \dut|table_index\(2),
	datad => \dut|table_index\(3),
	combout => \dut|Mux1~0_combout\);

-- Location: LCCOMB_X9_Y19_N20
\dut|Selector19~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector19~1_combout\ = (\dut|current_state.S5~regout\) # ((\dut|current_state.S4~regout\) # (\dut|current_state.S3~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|current_state.S5~regout\,
	datac => \dut|current_state.S4~regout\,
	datad => \dut|current_state.S3~regout\,
	combout => \dut|Selector19~1_combout\);

-- Location: LCCOMB_X9_Y19_N12
\dut|Selector15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector15~1_combout\ = (\dut|LCD_DATA\(4) & ((\dut|current_state.IDLE~regout\) # ((\dut|current_state.S11~regout\) # (!\dut|current_state.S0~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.IDLE~regout\,
	datab => \dut|current_state.S11~regout\,
	datac => \dut|LCD_DATA\(4),
	datad => \dut|current_state.S0~regout\,
	combout => \dut|Selector15~1_combout\);

-- Location: LCCOMB_X10_Y19_N16
\dut|Selector13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector13~1_combout\ = (\dut|Mux0~1_combout\ & (\dut|current_state.S9~regout\ & ((\dut|CHAR_VALUE~2_combout\) # (\dut|CHAR_VALUE~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Mux0~1_combout\,
	datab => \dut|current_state.S9~regout\,
	datac => \dut|CHAR_VALUE~2_combout\,
	datad => \dut|CHAR_VALUE~4_combout\,
	combout => \dut|Selector13~1_combout\);

-- Location: LCCOMB_X8_Y21_N30
\dut|cnt~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|cnt~4_combout\ = (\dut|Add0~20_combout\ & ((!\dut|Equal0~8_combout\) # (!\dut|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|Equal0~4_combout\,
	datac => \dut|Equal0~8_combout\,
	datad => \dut|Add0~20_combout\,
	combout => \dut|cnt~4_combout\);

-- Location: LCCOMB_X8_Y21_N10
\dut|cnt~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|cnt~5_combout\ = (\dut|Add0~26_combout\ & ((!\dut|Equal0~8_combout\) # (!\dut|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|Equal0~4_combout\,
	datac => \dut|Equal0~8_combout\,
	datad => \dut|Add0~26_combout\,
	combout => \dut|cnt~5_combout\);

-- Location: LCCOMB_X8_Y21_N28
\dut|cnt~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|cnt~6_combout\ = (\dut|Add0~34_combout\ & ((!\dut|Equal0~8_combout\) # (!\dut|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Equal0~4_combout\,
	datab => \dut|Equal0~8_combout\,
	datad => \dut|Add0~34_combout\,
	combout => \dut|cnt~6_combout\);

-- Location: LCCOMB_X10_Y19_N28
\dut|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux0~0_combout\ = (\dut|table_index\(1) & ((\dut|table_index\(2) & ((\dut|table_index\(3)))) # (!\dut|table_index\(2) & (!\dut|table_index\(4))))) # (!\dut|table_index\(1) & ((\dut|table_index\(4)) # ((!\dut|table_index\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011101000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(1),
	datab => \dut|table_index\(4),
	datac => \dut|table_index\(2),
	datad => \dut|table_index\(3),
	combout => \dut|Mux0~0_combout\);

-- Location: LCCOMB_X10_Y19_N6
\dut|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux0~1_combout\ = (\dut|Mux0~0_combout\ & ((\dut|table_index\(4)) # (\dut|table_index\(0) $ (\dut|table_index\(2))))) # (!\dut|Mux0~0_combout\ & (\dut|table_index\(2) & (\dut|table_index\(4) $ (\dut|table_index\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(4),
	datab => \dut|table_index\(0),
	datac => \dut|table_index\(2),
	datad => \dut|Mux0~0_combout\,
	combout => \dut|Mux0~1_combout\);

-- Location: PIN_AD15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: CLKCTRL_G14
\CLK~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~clkctrl_outclk\);

-- Location: LCCOMB_X9_Y19_N8
\dut|current_state.S0~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|current_state.S0~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \dut|current_state.S0~feeder_combout\);

-- Location: LCCOMB_X9_Y21_N4
\dut|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~0_combout\ = \dut|cnt\(0) $ (VCC)
-- \dut|Add0~1\ = CARRY(\dut|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(0),
	datad => VCC,
	combout => \dut|Add0~0_combout\,
	cout => \dut|Add0~1\);

-- Location: LCCOMB_X9_Y21_N10
\dut|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~6_combout\ = (\dut|cnt\(3) & (!\dut|Add0~5\)) # (!\dut|cnt\(3) & ((\dut|Add0~5\) # (GND)))
-- \dut|Add0~7\ = CARRY((!\dut|Add0~5\) # (!\dut|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(3),
	datad => VCC,
	cin => \dut|Add0~5\,
	combout => \dut|Add0~6_combout\,
	cout => \dut|Add0~7\);

-- Location: LCCOMB_X9_Y21_N12
\dut|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~8_combout\ = (\dut|cnt\(4) & (\dut|Add0~7\ $ (GND))) # (!\dut|cnt\(4) & (!\dut|Add0~7\ & VCC))
-- \dut|Add0~9\ = CARRY((\dut|cnt\(4) & !\dut|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(4),
	datad => VCC,
	cin => \dut|Add0~7\,
	combout => \dut|Add0~8_combout\,
	cout => \dut|Add0~9\);

-- Location: LCCOMB_X9_Y21_N14
\dut|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~10_combout\ = (\dut|cnt\(5) & (!\dut|Add0~9\)) # (!\dut|cnt\(5) & ((\dut|Add0~9\) # (GND)))
-- \dut|Add0~11\ = CARRY((!\dut|Add0~9\) # (!\dut|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(5),
	datad => VCC,
	cin => \dut|Add0~9\,
	combout => \dut|Add0~10_combout\,
	cout => \dut|Add0~11\);

-- Location: LCCOMB_X8_Y21_N4
\dut|cnt~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|cnt~1_combout\ = (\dut|Add0~10_combout\ & ((!\dut|Equal0~8_combout\) # (!\dut|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|Equal0~4_combout\,
	datac => \dut|Add0~10_combout\,
	datad => \dut|Equal0~8_combout\,
	combout => \dut|cnt~1_combout\);

-- Location: LCFF_X9_Y21_N1
\dut|cnt[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \dut|cnt~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(5));

-- Location: LCCOMB_X9_Y21_N18
\dut|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~14_combout\ = (\dut|cnt\(7) & (!\dut|Add0~13\)) # (!\dut|cnt\(7) & ((\dut|Add0~13\) # (GND)))
-- \dut|Add0~15\ = CARRY((!\dut|Add0~13\) # (!\dut|cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(7),
	datad => VCC,
	cin => \dut|Add0~13\,
	combout => \dut|Add0~14_combout\,
	cout => \dut|Add0~15\);

-- Location: LCCOMB_X9_Y21_N2
\dut|cnt~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|cnt~2_combout\ = (\dut|Add0~14_combout\ & ((!\dut|Equal0~4_combout\) # (!\dut|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|Equal0~8_combout\,
	datac => \dut|Equal0~4_combout\,
	datad => \dut|Add0~14_combout\,
	combout => \dut|cnt~2_combout\);

-- Location: LCFF_X9_Y21_N3
\dut|cnt[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(7));

-- Location: LCCOMB_X9_Y21_N20
\dut|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~16_combout\ = (\dut|cnt\(8) & (\dut|Add0~15\ $ (GND))) # (!\dut|cnt\(8) & (!\dut|Add0~15\ & VCC))
-- \dut|Add0~17\ = CARRY((\dut|cnt\(8) & !\dut|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(8),
	datad => VCC,
	cin => \dut|Add0~15\,
	combout => \dut|Add0~16_combout\,
	cout => \dut|Add0~17\);

-- Location: LCCOMB_X8_Y21_N24
\dut|cnt~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|cnt~3_combout\ = (\dut|Add0~16_combout\ & ((!\dut|Equal0~8_combout\) # (!\dut|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|Equal0~4_combout\,
	datac => \dut|Add0~16_combout\,
	datad => \dut|Equal0~8_combout\,
	combout => \dut|cnt~3_combout\);

-- Location: LCFF_X8_Y21_N25
\dut|cnt[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(8));

-- Location: LCCOMB_X9_Y21_N22
\dut|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~18_combout\ = (\dut|cnt\(9) & (!\dut|Add0~17\)) # (!\dut|cnt\(9) & ((\dut|Add0~17\) # (GND)))
-- \dut|Add0~19\ = CARRY((!\dut|Add0~17\) # (!\dut|cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(9),
	datad => VCC,
	cin => \dut|Add0~17\,
	combout => \dut|Add0~18_combout\,
	cout => \dut|Add0~19\);

-- Location: LCFF_X9_Y21_N23
\dut|cnt[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(9));

-- Location: LCCOMB_X9_Y21_N26
\dut|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~22_combout\ = (\dut|cnt\(11) & (!\dut|Add0~21\)) # (!\dut|cnt\(11) & ((\dut|Add0~21\) # (GND)))
-- \dut|Add0~23\ = CARRY((!\dut|Add0~21\) # (!\dut|cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(11),
	datad => VCC,
	cin => \dut|Add0~21\,
	combout => \dut|Add0~22_combout\,
	cout => \dut|Add0~23\);

-- Location: LCFF_X9_Y21_N27
\dut|cnt[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(11));

-- Location: LCCOMB_X9_Y21_N28
\dut|Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~24_combout\ = (\dut|cnt\(12) & (\dut|Add0~23\ $ (GND))) # (!\dut|cnt\(12) & (!\dut|Add0~23\ & VCC))
-- \dut|Add0~25\ = CARRY((\dut|cnt\(12) & !\dut|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(12),
	datad => VCC,
	cin => \dut|Add0~23\,
	combout => \dut|Add0~24_combout\,
	cout => \dut|Add0~25\);

-- Location: LCFF_X9_Y21_N29
\dut|cnt[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(12));

-- Location: LCCOMB_X9_Y20_N0
\dut|Add0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~28_combout\ = (\dut|cnt\(14) & (\dut|Add0~27\ $ (GND))) # (!\dut|cnt\(14) & (!\dut|Add0~27\ & VCC))
-- \dut|Add0~29\ = CARRY((\dut|cnt\(14) & !\dut|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(14),
	datad => VCC,
	cin => \dut|Add0~27\,
	combout => \dut|Add0~28_combout\,
	cout => \dut|Add0~29\);

-- Location: LCFF_X9_Y20_N1
\dut|cnt[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(14));

-- Location: LCCOMB_X9_Y20_N2
\dut|Add0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~30_combout\ = (\dut|cnt\(15) & (!\dut|Add0~29\)) # (!\dut|cnt\(15) & ((\dut|Add0~29\) # (GND)))
-- \dut|Add0~31\ = CARRY((!\dut|Add0~29\) # (!\dut|cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(15),
	datad => VCC,
	cin => \dut|Add0~29\,
	combout => \dut|Add0~30_combout\,
	cout => \dut|Add0~31\);

-- Location: LCFF_X9_Y20_N3
\dut|cnt[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(15));

-- Location: LCCOMB_X9_Y20_N4
\dut|Add0~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~32_combout\ = (\dut|cnt\(16) & (\dut|Add0~31\ $ (GND))) # (!\dut|cnt\(16) & (!\dut|Add0~31\ & VCC))
-- \dut|Add0~33\ = CARRY((\dut|cnt\(16) & !\dut|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(16),
	datad => VCC,
	cin => \dut|Add0~31\,
	combout => \dut|Add0~32_combout\,
	cout => \dut|Add0~33\);

-- Location: LCFF_X9_Y20_N5
\dut|cnt[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(16));

-- Location: LCCOMB_X9_Y20_N8
\dut|Add0~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~36_combout\ = (\dut|cnt\(18) & (\dut|Add0~35\ $ (GND))) # (!\dut|cnt\(18) & (!\dut|Add0~35\ & VCC))
-- \dut|Add0~37\ = CARRY((\dut|cnt\(18) & !\dut|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(18),
	datad => VCC,
	cin => \dut|Add0~35\,
	combout => \dut|Add0~36_combout\,
	cout => \dut|Add0~37\);

-- Location: LCCOMB_X8_Y21_N14
\dut|cnt~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|cnt~7_combout\ = (\dut|Add0~36_combout\ & ((!\dut|Equal0~4_combout\) # (!\dut|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|Equal0~8_combout\,
	datac => \dut|Equal0~4_combout\,
	datad => \dut|Add0~36_combout\,
	combout => \dut|cnt~7_combout\);

-- Location: LCFF_X8_Y21_N15
\dut|cnt[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|cnt~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(18));

-- Location: LCCOMB_X9_Y20_N14
\dut|Add0~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~42_combout\ = (\dut|cnt\(21) & (!\dut|Add0~41\)) # (!\dut|cnt\(21) & ((\dut|Add0~41\) # (GND)))
-- \dut|Add0~43\ = CARRY((!\dut|Add0~41\) # (!\dut|cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(21),
	datad => VCC,
	cin => \dut|Add0~41\,
	combout => \dut|Add0~42_combout\,
	cout => \dut|Add0~43\);

-- Location: LCCOMB_X8_Y20_N16
\dut|cnt~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|cnt~8_combout\ = (\dut|Add0~42_combout\ & ((!\dut|Equal0~4_combout\) # (!\dut|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Equal0~8_combout\,
	datac => \dut|Add0~42_combout\,
	datad => \dut|Equal0~4_combout\,
	combout => \dut|cnt~8_combout\);

-- Location: LCFF_X8_Y20_N17
\dut|cnt[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|cnt~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(21));

-- Location: LCCOMB_X9_Y20_N16
\dut|Add0~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~44_combout\ = (\dut|cnt\(22) & (\dut|Add0~43\ $ (GND))) # (!\dut|cnt\(22) & (!\dut|Add0~43\ & VCC))
-- \dut|Add0~45\ = CARRY((\dut|cnt\(22) & !\dut|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(22),
	datad => VCC,
	cin => \dut|Add0~43\,
	combout => \dut|Add0~44_combout\,
	cout => \dut|Add0~45\);

-- Location: LCCOMB_X9_Y20_N18
\dut|Add0~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~46_combout\ = (\dut|cnt\(23) & (!\dut|Add0~45\)) # (!\dut|cnt\(23) & ((\dut|Add0~45\) # (GND)))
-- \dut|Add0~47\ = CARRY((!\dut|Add0~45\) # (!\dut|cnt\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(23),
	datad => VCC,
	cin => \dut|Add0~45\,
	combout => \dut|Add0~46_combout\,
	cout => \dut|Add0~47\);

-- Location: LCFF_X9_Y20_N19
\dut|cnt[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(23));

-- Location: LCCOMB_X9_Y20_N22
\dut|Add0~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~50_combout\ = (\dut|cnt\(25) & (!\dut|Add0~49\)) # (!\dut|cnt\(25) & ((\dut|Add0~49\) # (GND)))
-- \dut|Add0~51\ = CARRY((!\dut|Add0~49\) # (!\dut|cnt\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(25),
	datad => VCC,
	cin => \dut|Add0~49\,
	combout => \dut|Add0~50_combout\,
	cout => \dut|Add0~51\);

-- Location: LCFF_X9_Y20_N23
\dut|cnt[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(25));

-- Location: LCCOMB_X9_Y20_N24
\dut|Add0~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~52_combout\ = (\dut|cnt\(26) & (\dut|Add0~51\ $ (GND))) # (!\dut|cnt\(26) & (!\dut|Add0~51\ & VCC))
-- \dut|Add0~53\ = CARRY((\dut|cnt\(26) & !\dut|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(26),
	datad => VCC,
	cin => \dut|Add0~51\,
	combout => \dut|Add0~52_combout\,
	cout => \dut|Add0~53\);

-- Location: LCFF_X9_Y20_N25
\dut|cnt[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(26));

-- Location: LCCOMB_X9_Y20_N26
\dut|Add0~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~54_combout\ = \dut|Add0~53\ $ (\dut|cnt\(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \dut|cnt\(27),
	cin => \dut|Add0~53\,
	combout => \dut|Add0~54_combout\);

-- Location: LCFF_X9_Y20_N27
\dut|cnt[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(27));

-- Location: LCCOMB_X9_Y20_N30
\dut|Equal0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Equal0~7_combout\ = (!\dut|cnt\(24) & (!\dut|cnt\(25) & (!\dut|cnt\(26) & !\dut|cnt\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(24),
	datab => \dut|cnt\(25),
	datac => \dut|cnt\(26),
	datad => \dut|cnt\(27),
	combout => \dut|Equal0~7_combout\);

-- Location: LCFF_X9_Y20_N17
\dut|cnt[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(22));

-- Location: LCCOMB_X9_Y20_N28
\dut|Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Equal0~6_combout\ = (!\dut|cnt\(20) & (!\dut|cnt\(23) & (!\dut|cnt\(22) & \dut|cnt\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(20),
	datab => \dut|cnt\(23),
	datac => \dut|cnt\(22),
	datad => \dut|cnt\(21),
	combout => \dut|Equal0~6_combout\);

-- Location: LCCOMB_X8_Y21_N22
\dut|Equal0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Equal0~8_combout\ = (\dut|Equal0~5_combout\ & (\dut|Equal0~7_combout\ & \dut|Equal0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Equal0~5_combout\,
	datac => \dut|Equal0~7_combout\,
	datad => \dut|Equal0~6_combout\,
	combout => \dut|Equal0~8_combout\);

-- Location: LCCOMB_X8_Y21_N16
\dut|cnt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|cnt~0_combout\ = (\dut|Add0~0_combout\ & ((!\dut|Equal0~8_combout\) # (!\dut|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|Equal0~4_combout\,
	datac => \dut|Add0~0_combout\,
	datad => \dut|Equal0~8_combout\,
	combout => \dut|cnt~0_combout\);

-- Location: LCFF_X8_Y21_N17
\dut|cnt[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(0));

-- Location: LCCOMB_X9_Y21_N6
\dut|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~2_combout\ = (\dut|cnt\(1) & (!\dut|Add0~1\)) # (!\dut|cnt\(1) & ((\dut|Add0~1\) # (GND)))
-- \dut|Add0~3\ = CARRY((!\dut|Add0~1\) # (!\dut|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(1),
	datad => VCC,
	cin => \dut|Add0~1\,
	combout => \dut|Add0~2_combout\,
	cout => \dut|Add0~3\);

-- Location: LCCOMB_X9_Y21_N8
\dut|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add0~4_combout\ = (\dut|cnt\(2) & (\dut|Add0~3\ $ (GND))) # (!\dut|cnt\(2) & (!\dut|Add0~3\ & VCC))
-- \dut|Add0~5\ = CARRY((\dut|cnt\(2) & !\dut|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|cnt\(2),
	datad => VCC,
	cin => \dut|Add0~3\,
	combout => \dut|Add0~4_combout\,
	cout => \dut|Add0~5\);

-- Location: LCFF_X9_Y21_N9
\dut|cnt[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(2));

-- Location: LCFF_X9_Y21_N11
\dut|cnt[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(3));

-- Location: LCFF_X9_Y21_N7
\dut|cnt[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(1));

-- Location: LCCOMB_X8_Y21_N18
\dut|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Equal0~0_combout\ = (!\dut|cnt\(0) & (!\dut|cnt\(3) & (!\dut|cnt\(2) & !\dut|cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(0),
	datab => \dut|cnt\(3),
	datac => \dut|cnt\(2),
	datad => \dut|cnt\(1),
	combout => \dut|Equal0~0_combout\);

-- Location: LCFF_X9_Y21_N13
\dut|cnt[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|cnt\(4));

-- Location: LCCOMB_X9_Y21_N0
\dut|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Equal0~1_combout\ = (!\dut|cnt\(6) & (\dut|cnt\(7) & (\dut|cnt\(5) & !\dut|cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(6),
	datab => \dut|cnt\(7),
	datac => \dut|cnt\(5),
	datad => \dut|cnt\(4),
	combout => \dut|Equal0~1_combout\);

-- Location: LCCOMB_X8_Y21_N0
\dut|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Equal0~3_combout\ = (\dut|cnt\(13) & (!\dut|cnt\(14) & (!\dut|cnt\(12) & !\dut|cnt\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|cnt\(13),
	datab => \dut|cnt\(14),
	datac => \dut|cnt\(12),
	datad => \dut|cnt\(15),
	combout => \dut|Equal0~3_combout\);

-- Location: LCCOMB_X8_Y21_N26
\dut|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Equal0~4_combout\ = (\dut|Equal0~2_combout\ & (\dut|Equal0~0_combout\ & (\dut|Equal0~1_combout\ & \dut|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Equal0~2_combout\,
	datab => \dut|Equal0~0_combout\,
	datac => \dut|Equal0~1_combout\,
	datad => \dut|Equal0~3_combout\,
	combout => \dut|Equal0~4_combout\);

-- Location: LCCOMB_X8_Y21_N8
\dut|l1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|l1~0_combout\ = \dut|l1~regout\ $ (((\dut|Equal0~4_combout\ & \dut|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|l1~regout\,
	datac => \dut|Equal0~4_combout\,
	datad => \dut|Equal0~8_combout\,
	combout => \dut|l1~0_combout\);

-- Location: LCFF_X8_Y21_N7
\dut|l1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \dut|l1~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|l1~regout\);

-- Location: LCCOMB_X8_Y21_N6
\dut|process_0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|process_0~0_combout\ = \dut|l1b~regout\ $ (\dut|l1~regout\ $ (((\dut|Equal0~4_combout\ & \dut|Equal0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|l1b~regout\,
	datab => \dut|Equal0~4_combout\,
	datac => \dut|l1~regout\,
	datad => \dut|Equal0~8_combout\,
	combout => \dut|process_0~0_combout\);

-- Location: LCFF_X9_Y19_N9
\dut|current_state.S0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|current_state.S0~feeder_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.S0~regout\);

-- Location: LCCOMB_X9_Y19_N22
\dut|current_state.S3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|current_state.S3~0_combout\ = !\dut|current_state.S0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dut|current_state.S0~regout\,
	combout => \dut|current_state.S3~0_combout\);

-- Location: LCFF_X9_Y19_N23
\dut|current_state.S3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|current_state.S3~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.S3~regout\);

-- Location: LCCOMB_X9_Y19_N28
\dut|Selector10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector10~0_combout\ = (\dut|current_state.S3~regout\) # ((\dut|LED\(3) & \dut|current_state.S0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|current_state.S3~regout\,
	datac => \dut|LED\(3),
	datad => \dut|current_state.S0~regout\,
	combout => \dut|Selector10~0_combout\);

-- Location: LCFF_X9_Y19_N29
\dut|LED[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector10~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LED\(3));

-- Location: LCCOMB_X9_Y19_N2
\dut|Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector9~0_combout\ = (\dut|current_state.S4~regout\) # ((\dut|LED\(4) & \dut|current_state.S0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S4~regout\,
	datac => \dut|LED\(4),
	datad => \dut|current_state.S0~regout\,
	combout => \dut|Selector9~0_combout\);

-- Location: LCFF_X9_Y19_N3
\dut|LED[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector9~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LED\(4));

-- Location: LCFF_X9_Y19_N21
\dut|current_state.S4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \dut|current_state.S3~regout\,
	sload => VCC,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.S4~regout\);

-- Location: LCFF_X9_Y19_N11
\dut|current_state.S5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \dut|current_state.S4~regout\,
	sload => VCC,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.S5~regout\);

-- Location: LCCOMB_X9_Y19_N18
\dut|Selector8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector8~0_combout\ = (\dut|current_state.S5~regout\) # ((\dut|LED\(5) & \dut|current_state.S0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|current_state.S5~regout\,
	datac => \dut|LED\(5),
	datad => \dut|current_state.S0~regout\,
	combout => \dut|Selector8~0_combout\);

-- Location: LCFF_X9_Y19_N19
\dut|LED[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector8~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LED\(5));

-- Location: LCFF_X9_Y19_N27
\dut|current_state.S6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \dut|current_state.S5~regout\,
	sload => VCC,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.S6~regout\);

-- Location: LCCOMB_X6_Y19_N20
\dut|Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector7~0_combout\ = (\dut|current_state.S6~regout\) # ((\dut|current_state.S0~regout\ & \dut|LED\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S0~regout\,
	datac => \dut|LED\(6),
	datad => \dut|current_state.S6~regout\,
	combout => \dut|Selector7~0_combout\);

-- Location: LCFF_X6_Y19_N21
\dut|LED[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector7~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LED\(6));

-- Location: LCFF_X6_Y19_N1
\dut|current_state.S7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \dut|current_state.S6~regout\,
	sload => VCC,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.S7~regout\);

-- Location: LCCOMB_X6_Y19_N6
\dut|Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector6~0_combout\ = (\dut|current_state.S7~regout\) # ((\dut|current_state.S0~regout\ & \dut|LED\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S0~regout\,
	datac => \dut|LED\(7),
	datad => \dut|current_state.S7~regout\,
	combout => \dut|Selector6~0_combout\);

-- Location: LCFF_X6_Y19_N7
\dut|LED[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector6~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LED\(7));

-- Location: LCCOMB_X6_Y19_N28
\dut|Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector5~0_combout\ = (\dut|current_state.S8~regout\) # ((\dut|LED\(8) & \dut|current_state.S0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S8~regout\,
	datac => \dut|LED\(8),
	datad => \dut|current_state.S0~regout\,
	combout => \dut|Selector5~0_combout\);

-- Location: LCFF_X6_Y19_N29
\dut|LED[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector5~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LED\(8));

-- Location: LCCOMB_X6_Y19_N18
\dut|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector0~0_combout\ = (\dut|current_state.S8~regout\) # ((!\dut|table_index\(5) & \dut|current_state.S10~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S8~regout\,
	datac => \dut|table_index\(5),
	datad => \dut|current_state.S10~regout\,
	combout => \dut|Selector0~0_combout\);

-- Location: LCFF_X6_Y19_N19
\dut|current_state.S9\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector0~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.S9~regout\);

-- Location: LCFF_X9_Y19_N1
\dut|current_state.S10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \dut|current_state.S9~regout\,
	sload => VCC,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.S10~regout\);

-- Location: LCCOMB_X6_Y19_N14
\dut|table_index[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|table_index[5]~5_combout\ = (\dut|table_index\(5)) # ((\dut|Add1~10_combout\ & (\dut|current_state.S10~regout\ & \dut|process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Add1~10_combout\,
	datab => \dut|current_state.S10~regout\,
	datac => \dut|table_index\(5),
	datad => \dut|process_0~0_combout\,
	combout => \dut|table_index[5]~5_combout\);

-- Location: LCFF_X6_Y19_N15
\dut|table_index[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|table_index[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|table_index\(5));

-- Location: LCCOMB_X6_Y19_N16
\dut|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector4~0_combout\ = (\dut|LED\(9) & ((\dut|current_state.S10~regout\ & ((\dut|table_index\(5)))) # (!\dut|current_state.S10~regout\ & (\dut|current_state.S0~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S0~regout\,
	datab => \dut|LED\(9),
	datac => \dut|table_index\(5),
	datad => \dut|current_state.S10~regout\,
	combout => \dut|Selector4~0_combout\);

-- Location: LCCOMB_X6_Y19_N2
\dut|Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector4~1_combout\ = (\dut|Selector4~0_combout\) # (\dut|current_state.S9~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dut|Selector4~0_combout\,
	datad => \dut|current_state.S9~regout\,
	combout => \dut|Selector4~1_combout\);

-- Location: LCFF_X6_Y19_N3
\dut|LED[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector4~1_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LED\(9));

-- Location: LCCOMB_X9_Y19_N16
\dut|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector3~0_combout\ = (\dut|current_state.S10~regout\) # ((!\dut|current_state.S9~regout\ & (\dut|LED\(10) & \dut|current_state.S0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S9~regout\,
	datab => \dut|current_state.S10~regout\,
	datac => \dut|LED\(10),
	datad => \dut|current_state.S0~regout\,
	combout => \dut|Selector3~0_combout\);

-- Location: LCFF_X9_Y19_N17
\dut|LED[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector3~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LED\(10));

-- Location: LCCOMB_X6_Y19_N12
\dut|current_state~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|current_state~17_combout\ = (\dut|table_index\(5) & \dut|current_state.S10~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dut|table_index\(5),
	datad => \dut|current_state.S10~regout\,
	combout => \dut|current_state~17_combout\);

-- Location: LCFF_X6_Y19_N13
\dut|current_state.S11\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|current_state~17_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.S11~regout\);

-- Location: LCCOMB_X9_Y19_N24
\dut|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector2~0_combout\ = (\dut|current_state.S11~regout\) # ((\dut|LED\(11) & \dut|current_state.S0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|current_state.S11~regout\,
	datac => \dut|LED\(11),
	datad => \dut|current_state.S0~regout\,
	combout => \dut|Selector2~0_combout\);

-- Location: LCFF_X9_Y19_N25
\dut|LED[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector2~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LED\(11));

-- Location: LCCOMB_X9_Y19_N4
\dut|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector1~0_combout\ = (\dut|current_state.IDLE~regout\) # ((\dut|LED\(17) & \dut|current_state.S0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.IDLE~regout\,
	datac => \dut|LED\(17),
	datad => \dut|current_state.S0~regout\,
	combout => \dut|Selector1~0_combout\);

-- Location: LCFF_X9_Y19_N5
\dut|LED[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector1~0_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LED\(17));

-- Location: LCCOMB_X6_Y19_N26
\dut|current_state.IDLE~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|current_state.IDLE~0_combout\ = (\dut|current_state.IDLE~regout\) # ((\dut|current_state.S11~regout\ & \dut|process_0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|current_state.S11~regout\,
	datac => \dut|current_state.IDLE~regout\,
	datad => \dut|process_0~0_combout\,
	combout => \dut|current_state.IDLE~0_combout\);

-- Location: LCFF_X6_Y19_N27
\dut|current_state.IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|current_state.IDLE~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.IDLE~regout\);

-- Location: LCCOMB_X6_Y19_N8
\dut|Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector20~0_combout\ = (\dut|LCD_ENABLE~regout\ & (((\dut|current_state.S11~regout\) # (\dut|current_state.IDLE~regout\)) # (!\dut|current_state.S0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S0~regout\,
	datab => \dut|LCD_ENABLE~regout\,
	datac => \dut|current_state.S11~regout\,
	datad => \dut|current_state.IDLE~regout\,
	combout => \dut|Selector20~0_combout\);

-- Location: LCCOMB_X6_Y19_N22
\dut|Selector20~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector20~1_combout\ = (\dut|current_state.S4~regout\) # ((\dut|current_state.S7~regout\) # ((\dut|Selector20~0_combout\) # (\dut|current_state.S9~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S4~regout\,
	datab => \dut|current_state.S7~regout\,
	datac => \dut|Selector20~0_combout\,
	datad => \dut|current_state.S9~regout\,
	combout => \dut|Selector20~1_combout\);

-- Location: LCFF_X6_Y19_N23
\dut|LCD_ENABLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector20~1_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LCD_ENABLE~regout\);

-- Location: LCCOMB_X6_Y19_N4
\dut|Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector21~0_combout\ = (\dut|LCD_RS~regout\ & (((\dut|current_state.S11~regout\) # (\dut|current_state.IDLE~regout\)) # (!\dut|current_state.S0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S0~regout\,
	datab => \dut|current_state.S11~regout\,
	datac => \dut|LCD_RS~regout\,
	datad => \dut|current_state.IDLE~regout\,
	combout => \dut|Selector21~0_combout\);

-- Location: LCCOMB_X6_Y19_N24
\dut|Selector21~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector21~1_combout\ = (\dut|current_state.S8~regout\) # ((\dut|current_state.S9~regout\) # ((\dut|Selector21~0_combout\) # (\dut|current_state.S10~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S8~regout\,
	datab => \dut|current_state.S9~regout\,
	datac => \dut|Selector21~0_combout\,
	datad => \dut|current_state.S10~regout\,
	combout => \dut|Selector21~1_combout\);

-- Location: LCFF_X6_Y19_N25
\dut|LCD_RS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector21~1_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LCD_RS~regout\);

-- Location: LCCOMB_X9_Y19_N0
\dut|WideOr18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|WideOr18~0_combout\ = (\dut|current_state.IDLE~regout\) # ((\dut|current_state.S11~regout\) # (!\dut|current_state.S0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.IDLE~regout\,
	datab => \dut|current_state.S11~regout\,
	datad => \dut|current_state.S0~regout\,
	combout => \dut|WideOr18~0_combout\);

-- Location: LCCOMB_X7_Y19_N16
\dut|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add1~0_combout\ = \dut|table_index\(0) $ (VCC)
-- \dut|Add1~1\ = CARRY(\dut|table_index\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|table_index\(0),
	datad => VCC,
	combout => \dut|Add1~0_combout\,
	cout => \dut|Add1~1\);

-- Location: LCCOMB_X7_Y19_N14
\dut|table_index~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|table_index~4_combout\ = (\dut|table_index\(5) & (\dut|table_index\(0))) # (!\dut|table_index\(5) & ((\dut|Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(5),
	datac => \dut|table_index\(0),
	datad => \dut|Add1~0_combout\,
	combout => \dut|table_index~4_combout\);

-- Location: LCCOMB_X8_Y21_N2
\dut|table_index[4]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|table_index[4]~6_combout\ = (\dut|current_state.S10~regout\ & \dut|process_0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dut|current_state.S10~regout\,
	datad => \dut|process_0~0_combout\,
	combout => \dut|table_index[4]~6_combout\);

-- Location: LCFF_X7_Y19_N15
\dut|table_index[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|table_index~4_combout\,
	ena => \dut|table_index[4]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|table_index\(0));

-- Location: LCCOMB_X7_Y19_N18
\dut|Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add1~2_combout\ = (\dut|table_index\(1) & (!\dut|Add1~1\)) # (!\dut|table_index\(1) & ((\dut|Add1~1\) # (GND)))
-- \dut|Add1~3\ = CARRY((!\dut|Add1~1\) # (!\dut|table_index\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(1),
	datad => VCC,
	cin => \dut|Add1~1\,
	combout => \dut|Add1~2_combout\,
	cout => \dut|Add1~3\);

-- Location: LCCOMB_X7_Y19_N20
\dut|Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add1~4_combout\ = (\dut|table_index\(2) & (\dut|Add1~3\ $ (GND))) # (!\dut|table_index\(2) & (!\dut|Add1~3\ & VCC))
-- \dut|Add1~5\ = CARRY((\dut|table_index\(2) & !\dut|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|table_index\(2),
	datad => VCC,
	cin => \dut|Add1~3\,
	combout => \dut|Add1~4_combout\,
	cout => \dut|Add1~5\);

-- Location: LCCOMB_X7_Y19_N0
\dut|table_index~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|table_index~1_combout\ = (\dut|table_index\(5) & (\dut|table_index\(2))) # (!\dut|table_index\(5) & ((\dut|Add1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(5),
	datac => \dut|table_index\(2),
	datad => \dut|Add1~4_combout\,
	combout => \dut|table_index~1_combout\);

-- Location: LCFF_X7_Y19_N1
\dut|table_index[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|table_index~1_combout\,
	ena => \dut|table_index[4]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|table_index\(2));

-- Location: LCCOMB_X7_Y19_N22
\dut|Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Add1~6_combout\ = (\dut|table_index\(3) & (!\dut|Add1~5\)) # (!\dut|table_index\(3) & ((\dut|Add1~5\) # (GND)))
-- \dut|Add1~7\ = CARRY((!\dut|Add1~5\) # (!\dut|table_index\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \dut|table_index\(3),
	datad => VCC,
	cin => \dut|Add1~5\,
	combout => \dut|Add1~6_combout\,
	cout => \dut|Add1~7\);

-- Location: LCCOMB_X7_Y19_N30
\dut|table_index~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|table_index~2_combout\ = (\dut|table_index\(5) & (\dut|table_index\(3))) # (!\dut|table_index\(5) & ((\dut|Add1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(5),
	datac => \dut|table_index\(3),
	datad => \dut|Add1~6_combout\,
	combout => \dut|table_index~2_combout\);

-- Location: LCFF_X7_Y19_N31
\dut|table_index[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|table_index~2_combout\,
	ena => \dut|table_index[4]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|table_index\(3));

-- Location: LCCOMB_X7_Y19_N8
\dut|table_index~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|table_index~3_combout\ = (\dut|table_index\(5) & (\dut|table_index\(4))) # (!\dut|table_index\(5) & ((\dut|Add1~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(5),
	datac => \dut|table_index\(4),
	datad => \dut|Add1~8_combout\,
	combout => \dut|table_index~3_combout\);

-- Location: LCFF_X7_Y19_N9
\dut|table_index[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|table_index~3_combout\,
	ena => \dut|table_index[4]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|table_index\(4));

-- Location: LCCOMB_X10_Y19_N22
\dut|Mux13~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux13~3_combout\ = (\dut|table_index\(1) & (\dut|table_index\(4) $ (((!\dut|table_index\(3)) # (!\dut|table_index\(2)))))) # (!\dut|table_index\(1) & ((\dut|table_index\(2) & (\dut|table_index\(4) & \dut|table_index\(3))) # (!\dut|table_index\(2) & 
-- ((!\dut|table_index\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001000100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(1),
	datab => \dut|table_index\(4),
	datac => \dut|table_index\(2),
	datad => \dut|table_index\(3),
	combout => \dut|Mux13~3_combout\);

-- Location: LCCOMB_X10_Y19_N4
\dut|Mux13~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux13~6_combout\ = (\dut|table_index\(0) & (((\dut|Mux13~3_combout\)))) # (!\dut|table_index\(0) & (\dut|table_index\(4) & (!\dut|table_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(4),
	datab => \dut|table_index\(0),
	datac => \dut|table_index\(2),
	datad => \dut|Mux13~3_combout\,
	combout => \dut|Mux13~6_combout\);

-- Location: LCCOMB_X8_Y19_N4
\dut|CHAR_VALUE~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|CHAR_VALUE~5_combout\ = (\dut|table_index~0_combout\ & (((\dut|table_index~2_combout\ & \dut|table_index~4_combout\)) # (!\dut|table_index~1_combout\))) # (!\dut|table_index~0_combout\ & (((\dut|table_index~1_combout\) # 
-- (!\dut|table_index~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index~0_combout\,
	datab => \dut|table_index~2_combout\,
	datac => \dut|table_index~1_combout\,
	datad => \dut|table_index~4_combout\,
	combout => \dut|CHAR_VALUE~5_combout\);

-- Location: LCCOMB_X8_Y19_N22
\dut|CHAR_VALUE~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|CHAR_VALUE~6_combout\ = (\dut|table_index~4_combout\ & ((\dut|CHAR_VALUE~5_combout\ & ((\dut|table_index~2_combout\) # (!\dut|table_index~3_combout\))) # (!\dut|CHAR_VALUE~5_combout\ & ((\dut|table_index~3_combout\))))) # 
-- (!\dut|table_index~4_combout\ & (((\dut|CHAR_VALUE~5_combout\ & \dut|table_index~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index~2_combout\,
	datab => \dut|table_index~4_combout\,
	datac => \dut|CHAR_VALUE~5_combout\,
	datad => \dut|table_index~3_combout\,
	combout => \dut|CHAR_VALUE~6_combout\);

-- Location: LCFF_X7_Y19_N13
\dut|table_index[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|table_index~0_combout\,
	ena => \dut|table_index[4]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|table_index\(1));

-- Location: LCCOMB_X7_Y19_N12
\dut|table_index~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|table_index~0_combout\ = (\dut|table_index\(5) & (\dut|table_index\(1))) # (!\dut|table_index\(5) & ((\dut|Add1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(5),
	datac => \dut|table_index\(1),
	datad => \dut|Add1~2_combout\,
	combout => \dut|table_index~0_combout\);

-- Location: LCCOMB_X8_Y19_N24
\dut|Mux19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux19~0_combout\ = (\dut|table_index~1_combout\ & (\dut|table_index~3_combout\ $ (((\dut|table_index~0_combout\) # (\dut|table_index~2_combout\))))) # (!\dut|table_index~1_combout\ & (\dut|table_index~2_combout\ $ (((\dut|table_index~0_combout\ & 
-- \dut|table_index~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index~1_combout\,
	datab => \dut|table_index~0_combout\,
	datac => \dut|table_index~2_combout\,
	datad => \dut|table_index~3_combout\,
	combout => \dut|Mux19~0_combout\);

-- Location: LCCOMB_X8_Y19_N18
\dut|Mux15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux15~0_combout\ = (\dut|table_index~1_combout\ & ((\dut|table_index~3_combout\) # ((\dut|table_index~0_combout\ & \dut|table_index~2_combout\)))) # (!\dut|table_index~1_combout\ & (\dut|table_index~0_combout\ & ((\dut|table_index~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index~1_combout\,
	datab => \dut|table_index~0_combout\,
	datac => \dut|table_index~2_combout\,
	datad => \dut|table_index~3_combout\,
	combout => \dut|Mux15~0_combout\);

-- Location: LCCOMB_X8_Y19_N2
\dut|CHAR_VALUE~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|CHAR_VALUE~1_combout\ = (\dut|table_index~4_combout\ & (\dut|Mux19~0_combout\)) # (!\dut|table_index~4_combout\ & ((\dut|Mux15~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index~4_combout\,
	datac => \dut|Mux19~0_combout\,
	datad => \dut|Mux15~0_combout\,
	combout => \dut|CHAR_VALUE~1_combout\);

-- Location: LCCOMB_X8_Y19_N20
\dut|Mux21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux21~0_combout\ = (\dut|table_index~0_combout\) # ((\dut|table_index~3_combout\ & (\dut|table_index~1_combout\ $ (!\dut|table_index~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index~1_combout\,
	datab => \dut|table_index~0_combout\,
	datac => \dut|table_index~2_combout\,
	datad => \dut|table_index~3_combout\,
	combout => \dut|Mux21~0_combout\);

-- Location: LCCOMB_X8_Y19_N10
\dut|CHAR_VALUE~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|CHAR_VALUE~0_combout\ = (\dut|table_index~4_combout\ & (!\dut|Mux21~0_combout\)) # (!\dut|table_index~4_combout\ & ((\dut|Mux15~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index~4_combout\,
	datac => \dut|Mux21~0_combout\,
	datad => \dut|Mux15~0_combout\,
	combout => \dut|CHAR_VALUE~0_combout\);

-- Location: LCCOMB_X8_Y19_N0
\dut|Mux27~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux27~0_combout\ = \dut|CHAR_VALUE~0_combout\ $ (((\dut|Mux14~1_combout\ & ((\dut|CHAR_VALUE~6_combout\) # (\dut|CHAR_VALUE~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Mux14~1_combout\,
	datab => \dut|CHAR_VALUE~6_combout\,
	datac => \dut|CHAR_VALUE~1_combout\,
	datad => \dut|CHAR_VALUE~0_combout\,
	combout => \dut|Mux27~0_combout\);

-- Location: LCCOMB_X8_Y19_N30
\dut|Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector19~0_combout\ = (\dut|current_state.S10~regout\ & ((\dut|Mux27~0_combout\) # ((\dut|current_state.S9~regout\ & \dut|Mux13~6_combout\)))) # (!\dut|current_state.S10~regout\ & (\dut|current_state.S9~regout\ & (\dut|Mux13~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S10~regout\,
	datab => \dut|current_state.S9~regout\,
	datac => \dut|Mux13~6_combout\,
	datad => \dut|Mux27~0_combout\,
	combout => \dut|Selector19~0_combout\);

-- Location: LCCOMB_X8_Y19_N16
\dut|Selector19~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector19~2_combout\ = (\dut|Selector19~1_combout\) # ((\dut|Selector19~0_combout\) # ((\dut|WideOr18~0_combout\ & \dut|LCD_DATA\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Selector19~1_combout\,
	datab => \dut|WideOr18~0_combout\,
	datac => \dut|LCD_DATA\(0),
	datad => \dut|Selector19~0_combout\,
	combout => \dut|Selector19~2_combout\);

-- Location: LCFF_X8_Y19_N17
\dut|LCD_DATA[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector19~2_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LCD_DATA\(0));

-- Location: LCFF_X6_Y19_N11
\dut|current_state.S8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	sdata => \dut|current_state.S7~regout\,
	sload => VCC,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|current_state.S8~regout\);

-- Location: LCCOMB_X6_Y19_N10
\dut|Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector18~0_combout\ = (!\dut|current_state.S9~regout\ & ((\dut|current_state.S6~regout\) # ((\dut|current_state.S8~regout\) # (\dut|current_state.S7~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S6~regout\,
	datab => \dut|current_state.S9~regout\,
	datac => \dut|current_state.S8~regout\,
	datad => \dut|current_state.S7~regout\,
	combout => \dut|Selector18~0_combout\);

-- Location: LCCOMB_X10_Y19_N0
\dut|Mux12~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux12~4_combout\ = (\dut|table_index\(0) & ((\dut|table_index\(2) & (\dut|table_index\(1) & !\dut|table_index\(3))) # (!\dut|table_index\(2) & ((\dut|table_index\(3)))))) # (!\dut|table_index\(0) & (\dut|table_index\(1) $ ((\dut|table_index\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(1),
	datab => \dut|table_index\(0),
	datac => \dut|table_index\(2),
	datad => \dut|table_index\(3),
	combout => \dut|Mux12~4_combout\);

-- Location: LCCOMB_X10_Y19_N14
\dut|Mux12~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux12~5_combout\ = (\dut|table_index\(4) & (((\dut|Mux12~4_combout\)))) # (!\dut|table_index\(4) & (\dut|table_index\(0) & (\dut|table_index\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(4),
	datab => \dut|table_index\(0),
	datac => \dut|table_index\(2),
	datad => \dut|Mux12~4_combout\,
	combout => \dut|Mux12~5_combout\);

-- Location: LCCOMB_X6_Y19_N30
\dut|Selector18~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector18~1_combout\ = (!\dut|current_state.S10~regout\ & ((\dut|Selector18~0_combout\) # ((\dut|current_state.S9~regout\ & \dut|Mux12~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S10~regout\,
	datab => \dut|current_state.S9~regout\,
	datac => \dut|Selector18~0_combout\,
	datad => \dut|Mux12~5_combout\,
	combout => \dut|Selector18~1_combout\);

-- Location: LCCOMB_X7_Y19_N10
\dut|Mux26~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux26~0_combout\ = (\dut|Mux14~1_combout\ & ((\dut|CHAR_VALUE~6_combout\ & (\dut|CHAR_VALUE~0_combout\)) # (!\dut|CHAR_VALUE~6_combout\ & (!\dut|CHAR_VALUE~0_combout\ & \dut|CHAR_VALUE~1_combout\)))) # (!\dut|Mux14~1_combout\ & 
-- (\dut|CHAR_VALUE~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Mux14~1_combout\,
	datab => \dut|CHAR_VALUE~6_combout\,
	datac => \dut|CHAR_VALUE~0_combout\,
	datad => \dut|CHAR_VALUE~1_combout\,
	combout => \dut|Mux26~0_combout\);

-- Location: LCCOMB_X7_Y19_N4
\dut|Selector18~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector18~2_combout\ = (\dut|Selector18~1_combout\) # ((\dut|current_state.S10~regout\ & \dut|Mux26~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|current_state.S10~regout\,
	datac => \dut|Selector18~1_combout\,
	datad => \dut|Mux26~0_combout\,
	combout => \dut|Selector18~2_combout\);

-- Location: LCCOMB_X7_Y19_N2
\dut|LCD_DATA[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|LCD_DATA[1]~2_combout\ = (!\dut|current_state.S11~regout\ & (\dut|current_state.S0~regout\ & (!\dut|current_state.IDLE~regout\ & \dut|process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S11~regout\,
	datab => \dut|current_state.S0~regout\,
	datac => \dut|current_state.IDLE~regout\,
	datad => \dut|process_0~0_combout\,
	combout => \dut|LCD_DATA[1]~2_combout\);

-- Location: LCFF_X7_Y19_N5
\dut|LCD_DATA[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector18~2_combout\,
	ena => \dut|LCD_DATA[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LCD_DATA\(1));

-- Location: LCCOMB_X8_Y19_N28
\dut|Mux14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux14~0_combout\ = (\dut|table_index~3_combout\ $ (((!\dut|table_index~2_combout\) # (!\dut|table_index~1_combout\)))) # (!\dut|table_index~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index~1_combout\,
	datab => \dut|table_index~0_combout\,
	datac => \dut|table_index~2_combout\,
	datad => \dut|table_index~3_combout\,
	combout => \dut|Mux14~0_combout\);

-- Location: LCCOMB_X8_Y19_N14
\dut|Mux14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux14~1_combout\ = (\dut|table_index~4_combout\ & (((\dut|Mux14~0_combout\)))) # (!\dut|table_index~4_combout\ & ((\dut|Mux14~0_combout\ & (\dut|table_index~3_combout\)) # (!\dut|Mux14~0_combout\ & ((\dut|table_index~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index~3_combout\,
	datab => \dut|table_index~4_combout\,
	datac => \dut|table_index~1_combout\,
	datad => \dut|Mux14~0_combout\,
	combout => \dut|Mux14~1_combout\);

-- Location: LCCOMB_X8_Y19_N8
\dut|Mux25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux25~0_combout\ = (\dut|CHAR_VALUE~1_combout\ & ((\dut|CHAR_VALUE~0_combout\) # ((\dut|CHAR_VALUE~6_combout\) # (!\dut|Mux14~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|CHAR_VALUE~0_combout\,
	datab => \dut|CHAR_VALUE~1_combout\,
	datac => \dut|CHAR_VALUE~6_combout\,
	datad => \dut|Mux14~1_combout\,
	combout => \dut|Mux25~0_combout\);

-- Location: LCCOMB_X10_Y19_N2
\dut|Mux11~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux11~3_combout\ = (\dut|table_index\(4) & ((\dut|table_index\(1) & (!\dut|table_index\(2) & !\dut|table_index\(3))) # (!\dut|table_index\(1) & (\dut|table_index\(2) $ (\dut|table_index\(3)))))) # (!\dut|table_index\(4) & (((\dut|table_index\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(1),
	datab => \dut|table_index\(4),
	datac => \dut|table_index\(2),
	datad => \dut|table_index\(3),
	combout => \dut|Mux11~3_combout\);

-- Location: LCCOMB_X10_Y19_N20
\dut|Mux11~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux11~4_combout\ = (\dut|table_index\(0) & ((\dut|Mux11~3_combout\))) # (!\dut|table_index\(0) & (\dut|Mux1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Mux1~0_combout\,
	datab => \dut|Mux11~3_combout\,
	datad => \dut|table_index\(0),
	combout => \dut|Mux11~4_combout\);

-- Location: LCCOMB_X9_Y19_N30
\dut|Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector17~0_combout\ = (!\dut|current_state.S10~regout\ & ((\dut|Selector18~0_combout\) # ((\dut|current_state.S9~regout\ & \dut|Mux11~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S9~regout\,
	datab => \dut|current_state.S10~regout\,
	datac => \dut|Selector18~0_combout\,
	datad => \dut|Mux11~4_combout\,
	combout => \dut|Selector17~0_combout\);

-- Location: LCCOMB_X8_Y19_N6
\dut|Selector17~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector17~1_combout\ = (\dut|Selector17~0_combout\) # ((\dut|current_state.S10~regout\ & \dut|Mux25~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S10~regout\,
	datac => \dut|Mux25~0_combout\,
	datad => \dut|Selector17~0_combout\,
	combout => \dut|Selector17~1_combout\);

-- Location: LCFF_X8_Y19_N7
\dut|LCD_DATA[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector17~1_combout\,
	ena => \dut|LCD_DATA[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LCD_DATA\(2));

-- Location: LCCOMB_X11_Y19_N28
\dut|Selector16~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector16~3_combout\ = (\dut|table_index\(0) & (!\dut|table_index\(4) & !\dut|table_index\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dut|table_index\(0),
	datac => \dut|table_index\(4),
	datad => \dut|table_index\(3),
	combout => \dut|Selector16~3_combout\);

-- Location: LCCOMB_X10_Y19_N18
\dut|Selector16~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector16~14_combout\ = (!\dut|table_index\(2) & (\dut|current_state.S9~regout\ & (!\dut|table_index\(1) & \dut|Selector16~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(2),
	datab => \dut|current_state.S9~regout\,
	datac => \dut|table_index\(1),
	datad => \dut|Selector16~3_combout\,
	combout => \dut|Selector16~14_combout\);

-- Location: LCCOMB_X7_Y19_N28
\dut|Selector16~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector16~12_combout\ = (\dut|current_state.S10~regout\ & (!\dut|CHAR_VALUE~6_combout\ & (\dut|Mux14~1_combout\ & !\dut|CHAR_VALUE~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S10~regout\,
	datab => \dut|CHAR_VALUE~6_combout\,
	datac => \dut|Mux14~1_combout\,
	datad => \dut|CHAR_VALUE~1_combout\,
	combout => \dut|Selector16~12_combout\);

-- Location: LCCOMB_X7_Y19_N6
\dut|Selector16~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector16~13_combout\ = (\dut|Selector16~12_combout\) # ((!\dut|current_state.S10~regout\ & ((\dut|Selector18~0_combout\) # (\dut|Selector16~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Selector18~0_combout\,
	datab => \dut|current_state.S10~regout\,
	datac => \dut|Selector16~14_combout\,
	datad => \dut|Selector16~12_combout\,
	combout => \dut|Selector16~13_combout\);

-- Location: LCFF_X7_Y19_N7
\dut|LCD_DATA[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector16~13_combout\,
	ena => \dut|LCD_DATA[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LCD_DATA\(3));

-- Location: LCCOMB_X10_Y19_N26
\dut|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Mux5~0_combout\ = (\dut|table_index\(1) & (\dut|table_index\(4) $ (((\dut|table_index\(2)) # (\dut|table_index\(3)))))) # (!\dut|table_index\(1) & (\dut|table_index\(3) $ (((\dut|table_index\(4) & \dut|table_index\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011101101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(1),
	datab => \dut|table_index\(4),
	datac => \dut|table_index\(2),
	datad => \dut|table_index\(3),
	combout => \dut|Mux5~0_combout\);

-- Location: LCCOMB_X10_Y19_N24
\dut|CHAR_VALUE~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|CHAR_VALUE~2_combout\ = (\dut|table_index\(0) & ((\dut|Mux5~0_combout\))) # (!\dut|table_index\(0) & (\dut|Mux1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Mux1~0_combout\,
	datac => \dut|table_index\(0),
	datad => \dut|Mux5~0_combout\,
	combout => \dut|CHAR_VALUE~2_combout\);

-- Location: LCCOMB_X10_Y19_N8
\dut|CHAR_VALUE~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|CHAR_VALUE~3_combout\ = (\dut|table_index\(2) & (((\dut|table_index\(0) & \dut|table_index\(3))) # (!\dut|table_index\(1)))) # (!\dut|table_index\(2) & (((\dut|table_index\(1))) # (!\dut|table_index\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101101011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(2),
	datab => \dut|table_index\(0),
	datac => \dut|table_index\(1),
	datad => \dut|table_index\(3),
	combout => \dut|CHAR_VALUE~3_combout\);

-- Location: LCCOMB_X10_Y19_N10
\dut|CHAR_VALUE~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|CHAR_VALUE~4_combout\ = (\dut|table_index\(4) & ((\dut|table_index\(0) & ((\dut|table_index\(3)) # (!\dut|CHAR_VALUE~3_combout\))) # (!\dut|table_index\(0) & (\dut|CHAR_VALUE~3_combout\)))) # (!\dut|table_index\(4) & (\dut|table_index\(0) & 
-- (\dut|CHAR_VALUE~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|table_index\(4),
	datab => \dut|table_index\(0),
	datac => \dut|CHAR_VALUE~3_combout\,
	datad => \dut|table_index\(3),
	combout => \dut|CHAR_VALUE~4_combout\);

-- Location: LCCOMB_X10_Y19_N30
\dut|Selector15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector15~0_combout\ = (\dut|current_state.S9~regout\ & (((!\dut|CHAR_VALUE~2_combout\ & !\dut|CHAR_VALUE~4_combout\)) # (!\dut|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Mux0~1_combout\,
	datab => \dut|current_state.S9~regout\,
	datac => \dut|CHAR_VALUE~2_combout\,
	datad => \dut|CHAR_VALUE~4_combout\,
	combout => \dut|Selector15~0_combout\);

-- Location: LCCOMB_X9_Y19_N6
\dut|Selector15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector15~2_combout\ = (\dut|Selector15~1_combout\) # ((\dut|Selector15~0_combout\) # ((\dut|current_state.S10~regout\ & !\dut|Mux14~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Selector15~1_combout\,
	datab => \dut|Selector15~0_combout\,
	datac => \dut|current_state.S10~regout\,
	datad => \dut|Mux14~1_combout\,
	combout => \dut|Selector15~2_combout\);

-- Location: LCCOMB_X9_Y19_N14
\dut|Selector15~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector15~3_combout\ = (\dut|Selector15~2_combout\) # ((!\dut|CHAR_VALUE~1_combout\ & (\dut|current_state.S10~regout\ & !\dut|CHAR_VALUE~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|CHAR_VALUE~1_combout\,
	datab => \dut|current_state.S10~regout\,
	datac => \dut|CHAR_VALUE~6_combout\,
	datad => \dut|Selector15~2_combout\,
	combout => \dut|Selector15~3_combout\);

-- Location: LCFF_X9_Y19_N15
\dut|LCD_DATA[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector15~3_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LCD_DATA\(4));

-- Location: LCCOMB_X8_Y19_N26
\dut|Selector13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector13~0_combout\ = (\dut|current_state.S10~regout\ & (\dut|Mux14~1_combout\ & ((\dut|CHAR_VALUE~6_combout\) # (\dut|CHAR_VALUE~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|current_state.S10~regout\,
	datab => \dut|CHAR_VALUE~6_combout\,
	datac => \dut|Mux14~1_combout\,
	datad => \dut|CHAR_VALUE~1_combout\,
	combout => \dut|Selector13~0_combout\);

-- Location: LCCOMB_X8_Y19_N12
\dut|Selector13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \dut|Selector13~2_combout\ = (\dut|Selector13~1_combout\) # ((\dut|Selector13~0_combout\) # ((\dut|WideOr18~0_combout\ & \dut|LCD_DATA\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dut|Selector13~1_combout\,
	datab => \dut|WideOr18~0_combout\,
	datac => \dut|LCD_DATA\(6),
	datad => \dut|Selector13~0_combout\,
	combout => \dut|Selector13~2_combout\);

-- Location: LCFF_X8_Y19_N13
\dut|LCD_DATA[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \dut|Selector13~2_combout\,
	ena => \dut|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \dut|LCD_DATA\(6));

-- Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_KEY);

-- Location: PIN_AJ6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(0));

-- Location: PIN_AK5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(1));

-- Location: PIN_AJ5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(2));

-- Location: PIN_AJ4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LED\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(3));

-- Location: PIN_AK3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LED\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(4));

-- Location: PIN_AH4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LED\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(5));

-- Location: PIN_AJ3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LED\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(6));

-- Location: PIN_AJ2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LED\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(7));

-- Location: PIN_AH3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LED\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(8));

-- Location: PIN_AD14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LED\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(9));

-- Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LED\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(10));

-- Location: PIN_AB13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LED\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(11));

-- Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(12));

-- Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(13));

-- Location: PIN_AC11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(14));

-- Location: PIN_AD9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(15));

-- Location: PIN_AD8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(16));

-- Location: PIN_AJ7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LED[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LED\(17),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LED(17));

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_ENABLE~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LCD_ENABLE~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_ENABLE);

-- Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_RW~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_RW);

-- Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_RS~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LCD_RS~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_RS);

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_ON~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_ON);

-- Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_DATA[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LCD_DATA\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_DATA(0));

-- Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_DATA[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LCD_DATA\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_DATA(1));

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_DATA[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LCD_DATA\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_DATA(2));

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_DATA[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LCD_DATA\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_DATA(3));

-- Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_DATA[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LCD_DATA\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_DATA(4));

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_DATA[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LCD_DATA\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_DATA(5));

-- Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_DATA[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dut|LCD_DATA\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_DATA(6));

-- Location: PIN_B2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_DATA[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_DATA(7));
END structure;


