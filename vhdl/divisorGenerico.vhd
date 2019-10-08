LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity divisorGenerico is

  generic (
    divisor : natural := 50000000
  );
  
  port(
    clk      :   in std_logic;
	 divisorin :   in std_logic;
    divisorout :   out std_logic
  );
  
end entity;

-- O valor "n" do divisor, define a divisao por "2n".
-- Ou seja, n é metade do período da frequência de saída.

architecture divInteiro of divisorGenerico is

  signal tick : std_logic := '0';
  signal contador : integer range 0 to divisor+1 := 0;

begin

  process(clk)
  
  begin
  
    if rising_edge(clk) then
	 
		if (divisorin = '1') then
			divisorout <= '0';
			contador <= 0;
			
		end if;
		
      if (contador >= divisor) then
        contador <= 0;
        --tick <= not tick;
		  divisorout <= '1';
		  
      else
        contador <= contador + 1;
		  divisorout <= '0';
      end if;
		
    end if;
	 
  end process;
  
end architecture divInteiro;