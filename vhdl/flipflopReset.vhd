library ieee ;
use ieee.std_logic_1164.all ;

entity flipflopReset is
	port
	( 
	D, clk, reset : IN STD_LOGIC ;
	Q : OUT STD_LOGIC
	) ;
	
end flipflopReset;

architecture comportamento of flipflopReset is
begin
	process (clk)
	begin
	if reset = '1' then 
	Q <= '0';
		elsif rising_edge(clk) then
				Q <= D ;
		end if;
	end process ;
end architecture;