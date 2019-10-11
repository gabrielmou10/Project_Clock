  
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity teste_intermediario is
	generic (
		larguraBarramentoDados		: natural := 8
	);
    port(
			INSTRUC : in std_logic_vector(1 downto 0);
        entra     : in  STD_LOGIC;
		  sai     : out  STD_LOGIC
    );
end entity;

architecture arch of teste_intermediario is

begin
	
	sai <= entra when INSTRUC = "10" OR INSTRUC = "11" else '0';
  
end architecture;