library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is
   generic (
        larguraBarramentoEnderecos  : natural := 8;
        larguraInstrucao      : natural := 17;
    );
   port (
          Endereco : in std_logic_vector (larguraBarramentoEnderecos-1 DOWNTO 0);
          Instrucao : out std_logic_vector (larguraInstrucao-1 DOWNTO 0)
    );
end entity;

architecture initFileROM of romMif is

	type memory_t is array (2**larguraBarramentoEnderecos-1 downto 0) of std_logic_vector (larguraInstrucao-1 downto 0);
	
	signal content: memory_t;
	
	attribute ram_init_file : string;
	
	attribute ram_init_file of content:
	
	signal is ".../initROM.mif";
	
	begin
	
		Instrucao <= content(to_integer(unsigned(Endereco)));
		
end architecture;