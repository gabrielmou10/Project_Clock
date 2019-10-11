library ieee ;
use ieee.std_logic_1164.all ;

entity flipflop is
	port
	( 
	D, clk, enable : IN STD_LOGIC ;
	Q : OUT STD_LOGIC
	) ;
	
end flipflop ;

architecture comportamento of flipflop is
begin
	process (clk)
	begin		
		if rising_edge(clk) then
			if enable = '1' then
				Q <= D ;
			end if;
		end if;
	end process ;
end architecture;