LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity TESTEdivisor is

  generic (
    divisor1 : natural := 50000000;
	 divisor2 : natural := 20000000
  );
  
  port(
    clk      :   in std_logic;
	 divisorin :   in std_logic;
	 switch    :   in std_logic;
    divisorout :   out std_logic
  );
  
end entity;

-- O valor "n" do divisor, define a divisao por "2n".
-- Ou seja, n é metade do período da frequência de saída.

architecture arc_TESTEdivisor of TESTEdivisor is

  signal tick : std_logic := '0';
  signal contador : integer range 0 to divisor1+1 := 0;

begin

  process(clk)
  
  begin
  
    if rising_edge(clk) then
	 
			if (contador >= divisor1) then
			contador <= 0;
			  tick <= not tick;
			  
			else
			  contador <= contador + 1;
			  
			  
			end if;
		
    end if;
	 
  end process;
  divisorout <= tick;
end architecture arc_TESTEdivisor;