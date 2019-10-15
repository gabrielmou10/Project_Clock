library ieee;
use ieee.std_logic_1164.all;

entity relogio is
    generic (
        larguraBarramentoEnderecos  : natural := 8;
        larguraBarramentoDados      : natural := 8;
        quantidadeDisplays          : natural := 6;
		  quantidadeChaves				: natural := 1
    );
    port
    (
        CLOCK_50 : IN STD_LOGIC;
		  
		  
		  LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        -- BOTOEs
        
		  SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		  
        -- DISPLAYS 7 SEG
        HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6 : OUT STD_LOGIC_VECTOR(6 downto 0)
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
	 
	 signal resetBarramento				: STD_LOGIC;
	 
	 signal dadosEntrada					: STD_LOGIC_VECTOR(larguraBarramentoDados-1 DOWNTO 0);
	 signal entradaCPU					: STD_LOGIC;
	 
	 SIGNAL aux		: STD_LOGIC_VECTOR(larguraBarramentoDados-1 DOWNTO 0);
	 signal testeclock50 : STD_LOGIC;
	 
	 signal saidaHEX : STD_LOGIC_VECTOR(3 downto 0);
	 signal saidadiv1 : STD_LOGIC;
	 signal saidadiv2 : STD_LOGIC;
	 signal saidamuxbasetempo : STD_LOGIC;
	 signal saidaflipReset   : STD_LOGIC;
	 signal habilita_BT_read  : STD_LOGIC;
	 

begin

	aux <= entradaCPU & barramentoDadosEntrada(6 downto 0);

	
    -- Instanciação da CPU
	CPU : entity work.cpu
	port map
	(	
		LEDG => LEDG,
		CLOCK_50 => CLOCK_50,
		barramentoDadosEntrada => aux,
		barramentoEnderecos => barramentoEnderecos,
		barramentoDadosSaida => barramentoDadosSaida,
		resetBarramento => resetBarramento,
		readEnable => readEnable,
		writeEnable => writeEnable,
		saidaHEX    => saidaHEX
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
		  enable_unit_min => habilitaDisplay(3),
		  enable_dez_seg => habilitaDisplay(4),
		  enable_unit_seg => habilitaDisplay(5),
		  enable_BT_read => habilita_BT_read
    );
	 
	 DISPLAY1: entity work.conversorHex7Seg
	 port map
	 (	
		clk => CLOCK_50,
		dadoHex => barramentoDadosSaida(3 DOWNTO 0),
		enable => habilitaDisplay(5),
      saida7seg => HEX0
	 );
	 
	  DISPLAY2: entity work.conversorHex7Seg
	 port map
	 (	
		clk => CLOCK_50,
		dadoHex => barramentoDadosSaida(3 DOWNTO 0),
		enable => habilitaDisplay(4),
      saida7seg => HEX1
	 );
	 
	 DISPLAY3: entity work.conversorHex7Seg
	 port map
	 (	
		clk => CLOCK_50,
		dadoHex => barramentoDadosSaida(3 DOWNTO 0),
		enable => habilitaDisplay(3),
      saida7seg => HEX2
	 );
	 
	 DISPLAY4: entity work.conversorHex7Seg
	 port map
	 (
		clk => CLOCK_50,
		dadoHex => barramentoDadosSaida(3 DOWNTO 0),
		enable => habilitaDisplay(2),
      saida7seg => HEX3
	 );
	 
	  DISPLAY5: entity work.conversorHex7Seg
	 port map
	 (
		clk => CLOCK_50,
		dadoHex => barramentoDadosSaida(3 DOWNTO 0),
		enable => habilitaDisplay(1),
      saida7seg => HEX4
	 );
	 
	  DISPLAY6: entity work.conversorHex7Seg
	 port map
	 (
		clk => CLOCK_50,
		dadoHex => barramentoDadosSaida(3 DOWNTO 0),
		enable => habilitaDisplay(0),
      saida7seg => HEX5
	 );
	 
	 DISPLAY7: entity work.conversorHex7Seg
	 port map
	 (
		clk => CLOCK_50,
		dadoHex => saidaHEX,
		enable => '1',
      saida7seg => HEX6
	 );
	 
	 RAM: entity work.ram
	 port map
	 (
			clk => CLOCK_50,
			endereco => barramentoEnderecos,
			dadoEscrita => barramentoDadosSaida,
			escreve => writeEnable,
			leitura => readEnable,
			saida => barramentoDadosEntrada
	 );

    -- Instanciação do componente Divisor Genérico
        -- Componente da composição da Base de Tempo
    BASE_TEMPO : entity work.divisorGenerico 
	 port map
    (
        clk             => CLOCK_50,
        saida_clk      => saidadiv1
    );
	 
	 BASE_TEMPO2 : entity work.divisorGenerico 
		  generic map(
		  divisor => 100000
		  )
	 port map
    (
        clk             => CLOCK_50,
        saida_clk      => saidadiv2
    );
	 
	 
	 
	     MUXBaseTempo : entity work.mux1bit

    port map
    (
        entradaA_MUX            => saidadiv1,
        entradaB_MUX            => saidadiv2,
        seletor_MUX             => SW(0),
        saida_MUX               => saidamuxbasetempo 
    );
	 
	 MUXBtRam : entity work.mux1bit

    port map
    (
        entradaA_MUX            => '0',
        entradaB_MUX            => saidaflipReset,
        seletor_MUX             => habilita_BT_read,
        saida_MUX               => entradaCPU 
    );
	 
	 
	 
	 
--	 BASE_TEMPO_TESTE : entity work.TESTEdivisor 
--    port map
--    (
--        clk             => CLOCK_50,
--		  divisorin			=> '0',
--		  switch				=> '0',
--        divisorout      => testeclock50
--    );
	 
	FFreset :  entity work.flipflopReset 
	port map
	( 
	D        => '1',
	clk      => saidamuxbasetempo,
	reset  =>  resetBarramento,
	Q    =>  saidaflipReset
	) ;
		 
	 
	 
    -- Completar com a instanciação de demais componentes necessários 
    -- e ligações entre os sinais auxiliares de saida/entrada e os barramentos da CPU

end architecture;