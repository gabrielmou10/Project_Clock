library ieee;
use ieee.std_logic_1164.all;

entity mux1bit is

    port (
        entradaA_MUX    : in  std_logic;
        entradaB_MUX    : in  std_logic;
        seletor_MUX   : in  std_logic;

        saida_MUX   : out std_logic
    );
end entity;

architecture comportamento of mux1bit is
begin


saida_MUX <= entradaA_MUX when seletor_MUX='0' else entradaB_MUX;

end architecture;