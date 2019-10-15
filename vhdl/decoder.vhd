library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is

    port
    (
        -- Input ports
        enable_decoder : std_logic_vector(2 downto 0);
		  enable_geral  : std_logic;
		  
        -- Output ports
        enable_dez_hora : out STD_LOGIC;
        enable_unit_hora : out STD_LOGIC;
        enable_dez_min : out STD_LOGIC;
		  enable_unit_min : out STD_LOGIC;
		  enable_dez_seg : out STD_LOGIC;
		  enable_unit_seg : out STD_LOGIC;
		  enable_BT_read  : out STD_LOGIC
		  --enable_leit_switch : out STD_LOGIC
    );
end entity;

architecture comportamento of decoder is
	 
begin

--    process(all)
--	 
--    begin
	
	enable_dez_hora <= '1' when (enable_decoder = "110") AND (enable_geral = '0') else '0';
	enable_unit_hora <= '1' when (enable_decoder = "101") AND (enable_geral = '0') else '0';
	enable_unit_min <= '1' when (enable_decoder = "011") AND (enable_geral = '0') else '0';
	enable_dez_min <= '1' when (enable_decoder = "100") AND (enable_geral = '0') else '0';
	enable_dez_seg <= '1' when (enable_decoder = "010") AND (enable_geral = '0') else '0';
	enable_unit_seg <= '1' when (enable_decoder = "001") AND (enable_geral = '0') else '0';
	enable_BT_read <= '1' when (enable_decoder = "111") AND (enable_geral = '0') else '0';
	
--   
--	if (enable_decoder = "00") then 
--		  enable_dez_hora <= '0' ;
--        enable_unit_hora <= '0' ;
--        enable_dez_min <= '0' ;
--		  enable_unit_min <= '1' ;
--		  --enable_leit_switch <= 0 ;
--			
-- 
--     elsif (enable_decoder = "01") then
--		  enable_dez_hora <= '0';
--        enable_unit_hora <= '0';
--        enable_dez_min <= '1';
--		  enable_unit_min <= '0' ;
--		  --enable_leit_switch <= 0 ;
--		  
--     elsif (enable_decoder = "10") then
--		  enable_dez_hora <= '0';
--        enable_unit_hora <= '1' ;
--        enable_dez_min <= '0';
--		  enable_unit_min <= '0';
--		  --enable_leit_switch <= 0 ;
--		  
--     elsif (enable_decoder = "11") then
--		  enable_dez_hora <= '1';
--        enable_unit_hora <= '0';
--        enable_dez_min <= '0';
--		  enable_unit_min <= '0';
--		  --enable_leit_switch <= 0 ;
--		  
--	  elsif (enable_decoder = "11") then
--		  enable_dez_hora <= '0';
--        enable_unit_hora <= '0';
--        enable_dez_min <= '0';
--		  enable_unit_min <= '0';
--		  --enable_leit_switch <= 1 ;
--		  
--    end if;
--	 
--    end process;
	 
end architecture;

