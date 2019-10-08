library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is

    port
    (
        -- Input ports
        enable_decoder : std_logic_vector(2 downto 0);
		  
        -- Output ports
        enable_dez_hora : out STD_LOGIC;
        enable_unit_hora : out STD_LOGIC;
        enable_dez_min : out STD_LOGIC;
		  enable_unit_min : out STD_LOGIC
		  --enable_leit_switch : out STD_LOGIC
    );
end entity;

architecture comportamento of decoder is
	 
begin

    process(all)
	 
    begin
	 
    if (enable_decoder = "00") then 
		  enable_dez_hora <= '0' ;
        enable_unit_hora <= '0' ;
        enable_dez_min <= '0' ;
		  enable_unit_min <= '1' ;
		  --enable_leit_switch <= 0 ;
			
 
     elsif (enable_decoder = "01") then
		  enable_dez_hora <= '0';
        enable_unit_hora <= '0';
        enable_dez_min <= '1';
		  enable_unit_min <= '0' ;
		  --enable_leit_switch <= 0 ;
		  
     elsif (enable_decoder = "10") then
		  enable_dez_hora <= '0';
        enable_unit_hora <= '1' ;
        enable_dez_min <= '0';
		  enable_unit_min <= '0';
		  --enable_leit_switch <= 0 ;
		  
     elsif (enable_decoder = "11") then
		  enable_dez_hora <= '1';
        enable_unit_hora <= '0';
        enable_dez_min <= '0';
		  enable_unit_min <= '0';
		  --enable_leit_switch <= 0 ;
		  
	  elsif (enable_decoder = "11") then
		  enable_dez_hora <= '0';
        enable_unit_hora <= '0';
        enable_dez_min <= '0';
		  enable_unit_min <= '0';
		  --enable_leit_switch <= 1 ;
		  
    end if;
	 
    end process;
	 
end architecture;

