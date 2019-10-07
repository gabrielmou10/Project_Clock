library ieee ;
use ieee.std_logic_1164.all ;

entity flipflop is
	port
	( 
	D, clk : IN STD_LOGIC ;
	Q : OUT STD_LOGIC
	) ;
	
end flipflop ;

architecture comportamento of flipflop is
begin
	process (clk)
	begin
		if clk'EVENT AND clk = '1' then
			Q <= D ;
		end if;
	end process ;
end architecture;