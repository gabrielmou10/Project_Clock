library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
    generic (
        -- Total de bits das entradas e saidas
        larguraDados    : natural  :=   8
    );
    port (
        entradaA_MUX    : in  std_logic_vector(larguraDados-1 downto 0);
        entradaB_MUX    : in  std_logic_vector(larguraDados-1 downto 0);
        seletor_MUX   : in  std_logic;

        saida_MUX   : out std_logic_vector(larguraDados-1 downto 0)
    );
end entity;

architecture comportamento of mux2x1 is
begin


saida_MUX <= entradaA_MUX when seletor_MUX='0' else entradaB_MUX;

end architecture;