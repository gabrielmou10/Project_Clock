-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity ula is

	generic(
		larguraBarramentoDados: natural := 8
	);

	port
	(
		-- Input ports
		A	: in  std_logic_vector(larguraBarramentoDados-1 DOWNTO 0);
		B	: in   std_logic_vector(larguraBarramentoDados-1 DOWNTO 0);
		OP	: in std_logic_vector(1 DOWNTO 0);

		-- Output ports
		S	: out std_logic_vector(larguraBarramentoDados-1 DOWNTO 0);
		CMP	: out std_logic
	);
end entity;


architecture functions of ULA is

begin

	S <=  std_logic_vector (A) when (OP = "00") else std_logic_vector(unsigned(A) + unsigned(B)) when (OP = "01") else 
			"00000011" when (OP = "10") else
			"00000011" when (OP = "11") else "00000011";
			
	CMP <= '1' when ((A /= B) and (OP = "10")) else '1' when ((A = B) and (OP = "11")) else '0';
	
end architecture;


