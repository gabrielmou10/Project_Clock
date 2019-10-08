library ieee;
use ieee.std_logic_1164.all;

entity relogio is
    generic (
        larguraBarramentoEnderecos  : natural := 8;
        larguraBarramentoDados      : natural := 8;
        quantidadeDisplays          : natural := 4
    );
    port
    (
        CLK : IN STD_LOGIC;
        -- BOTOEs
        
        -- DISPLAYS 7 SEG
        HEX0, HEX1, HEX2, HEX3 : OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end entity;
	
architecture estrutural of relogio is

    -- Sinais de barramentos
    signal barramentoEnderecos      : STD_LOGIC_VECTOR(larguraBarramentoEnderecos-1 DOWNTO 0);
    signal barramentoDadosEntrada   : STD_LOGIC_VECTOR(larguraBarramentoDados-1 DOWNTO 0);
    signal barramentoDadosSaida     : STD_LOGIC_VECTOR(larguraBarramentoDados-1 DOWNTO 0);
    
    -- Sinais de controle RD/WR
    signal readEnable               : STD_LOGIC;
    signal writeEnable              : STD_LOGIC;

    -- Sinais de habilitacao dos componentes
    signal habilitaDisplay          : STD_LOGIC_VECTOR(quantidadeDisplays-1 DOWNTO 0);
    signal habilitaBaseTempo        : STD_LOGIC;

    -- Sinais auxiliares
    signal entradaDisplays          : STD_LOGIC_VECTOR(quantidadeDisplays-1 DOWNTO 0);
    signal saidaDivisorGenerico     : STD_LOGIC;
	 
	 signal dadosEntrada					: STD_LOGIC_VECTOR(larguraBarramentoDados-1 DOWNTO 0);
	 signal entradaCPU					: STD_LOGIC_VECTOR(larguraBarramentoDados-1 DOWNTO 0);

begin
	
	entradaCPU <= "00000000";

    -- Instanciação da CPU
    CPU : entity work.cpu
    port map
	 
    (
        clk                     => clk,
        barramentoDadosEntrada  => entradaCPU or barramentoDadosSaida,
        barramentoEnderecos     => barramentoEnderecos,
        barramentoDadosSaida    => barramentoDadosSaida,
        readEnable              => readEnable,
        writeEnable             => writeEnable
    );
    
    -- Instanciação do Decodificador de Endereços
        -- A entidade do decodificador fica a criterio do grupo
        -- o portmap a seguir serve como exemplo
    DE : entity work.decoder 
    port map
    (
        enable_decoder  => barramentoEnderecos(7 DOWNTO 5),
		  enable_dez_hora => habilitaDisplay(0),
        enable_unit_hora => habilitaDisplay(1),
        enable_dez_min => habilitaDisplay(2),
		  enable_unit_min => habilitaDisplay(3)       -- ...
    );
	 
	 RAM: entity work.ram
	 port map
	 (
			clk => clk,
			endereco => barramentoEnderecos,
			dadoEscrita => barramentoDadosSaida,
			escreve => writeEnable,
			saida => barramentoDadosEntrada
	 );

    -- Instanciação do componente Divisor Genérico
        -- Componente da composição da Base de Tempo
    BASE_TEMPO : entity work.divisorGenerico 
    port map
    (
        clk             => clk,
		  divisorin			=> barramentoDadosSaida(7),
        divisorout      => entradaCPU(7)
    );
	 
	 
    -- Completar com a instanciação de demais componentes necessários 
    -- e ligações entre os sinais auxiliares de saida/entrada e os barramentos da CPU

end architecture;