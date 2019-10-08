library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Baseado no apendice C (Register Files) do COD (Patterson & Hennessy).

entity ram is
    generic
    (
        larguraDados        : natural := 8;
        larguraEndBancoRegs : natural := 8   --Resulta em 2^5=32 posicoeS
    );
-- Leitura de 2 registradores e escrita em 1 registrador simultaneamente.
    port
    (
        clk        : in std_logic;
		  
        endereco       : in std_logic_vector((larguraEndBancoRegs-1) downto 0);
		  
        dadoEscrita    : in std_logic_vector((larguraDados-1) downto 0);
		  
		  leitura        : in std_logic;
--
        escreve        : in std_logic;
		  
        saida          : out std_logic_vector((larguraDados-1) downto 0)
    );
end entity;

architecture comportamento of ram is

    subtype palavra_t is std_logic_vector((larguraDados-1) downto 0);
    type memoria_t is array(2**larguraEndBancoRegs-1 downto 0) of palavra_t;

    -- Declaracao dos registradores:
    shared variable registrador : memoria_t;

begin
    process(clk) is
	
    begin
        if (rising_edge(clk)) then
				
					if (escreve = '1') then
						registrador(to_integer(unsigned(endereco))) := dadoEscrita;
				
					end if;
					 
		 
        end if;
    end process;

    -- IF endereco = 0 : retorna ZERO
     process(all) is
     begin
			if (leitura = '1') then
			
				if (unsigned(endereco) = 0) then
					saida <= (others => '0');
					
				else
					saida <= registrador(to_integer(unsigned(endereco)));
				
				end if;
				
			
			else (leitura = '0') then
				saida <= (others => '0');
			
			end if;
			
     end process;
end architecture;