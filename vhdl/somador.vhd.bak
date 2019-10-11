library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  --Soma (esta biblioteca =ieee)

entity somador is
    generic
    (
        larguraBarramentoEnderecos : natural := 8;
        incremento : natural := 1
    );
    port
    (
        entrada: in  STD_LOGIC_VECTOR((larguraBarramentoEnderecos-1) downto 0);
        saida:   out STD_LOGIC_VECTOR((larguraBarramentoEnderecos-1) downto 0)
    );
end entity;

architecture comportamento of somador is

    begin
        saida <= std_logic_vector(unsigned(entrada) + incremento);
		  
end architecture;