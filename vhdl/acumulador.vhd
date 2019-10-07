library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity acumulador is
    generic (
        larguraBarramentoDados      : natural := 8
    );
    port (
		 DADOSIN : in std_logic_vector(larguraBarramentoDados-1 downto 0);
       DADOSOUT : out std_logic_vector(larguraBarramentoDados-1 downto 0);
       HABACUM : in std_logic;
       CLK : in std_logic
    );
end entity;

architecture comportamento of acumulador is
begin
    process(CLK)
	 begin
        if (rising_edge(CLK)) then
            if (HABACUM = '1') then
                    DADOSOUT <= DADOSIN;
            end if;
        end if;
    end process;
end architecture;