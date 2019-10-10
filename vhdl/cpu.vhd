library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library ieee;
use ieee.std_logic_1164.all;

entity cpu is 	
    generic (
        larguraBarramentoEnderecos  : natural := 8;
        larguraBarramentoDados      : natural := 8
    );
    port
    (	  
		  LEDG						  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        CLOCK_50                : IN  STD_LOGIC;
        barramentoDadosEntrada  : IN STD_LOGIC_VECTOR(larguraBarramentoDados-1 DOWNTO 0);
        barramentoEnderecos     : OUT STD_LOGIC_VECTOR(larguraBarramentoEnderecos-1 DOWNTO 0);
        barramentoDadosSaida    : OUT STD_LOGIC_VECTOR(larguraBarramentoDados-1 DOWNTO 0);
		  resetBarramento			  : OUT STD_LOGIC;
        readEnable              : OUT STD_LOGIC;
        writeEnable             : OUT STD_LOGIC
    );
end entity;

architecture estrutural of cpu is

    -- Declaração de sinais auxiliares
    signal saidaROM : STD_LOGIC_VECTOR(17 DOWNTO 0);
	 signal saidaMUXI, saidaULA1, saidaAcumulador, saidaPC, saidaMuxJump, saidaINC : STD_LOGIC_VECTOR(larguraBarramentoDados-1 DOWNTO 0);
	 signal saidaFLIPFLOP, saidaULA2 : std_logic;
     
    -- ...

begin
    -- Instanciação de Banco de Registradores
    ACUMULADOR : entity work.acumulador 
    -- generic map (
    -- );
    port map
    (
        clk         => CLOCK_50,
        HABACUM     => saidaROM(15),
        DADOSIN     => saidaULA1,
        DADOSOUT    => saidaAcumulador
    );
	 
	ROM : entity work.rom
	
	port map (
		Endereco		  => saidaPC,
		Instrucao	  => saidaROM
	);
	
	LEDG <= saidaINC;

    -- Instanciação de MUX
    MUXIMEDIATO : entity work.mux2x1
   -- generic map (
	--      larguraDados    => larguraBarramentoDados
   --);
    port map
    (
        entradaA_MUX            => saidaROM(7 DOWNTO 0),
        entradaB_MUX            => barramentoDadosEntrada,
        seletor_MUX             => saidaROM(12),
        saida_MUX               => saidaMUXI
    );
	 
	 FLIPFLOP : entity work.flipflop
	 
	 port map
	 (
		clk			=> CLOCK_50,
		D				=> saidaULA2,
		Q				=> saidaFLIPFLOP
	 );
	 
	 SOMADOR : entity work.somador
	 
	 port map
	 (
		entrada    => saidaPC,
		saida 	  => saidaINC
	 );
	 
	 MUXJUMP : entity work.mux2x1
	 
	 port map
	 (
			entradaA_MUX			  => saidaINC,
			entradaB_MUX			  => saidaROM(7 DOWNTO 0),
			seletor_MUX				  => saidaROM(11) or (saidaROM(10) and saidaFLIPFLOP),
			saida_MUX				  => saidaMuxJump
	 );
    
    -- ...
		
	 PC : entity work.pc
	 
	 port map
	 (
			clk 		=> CLOCK_50,
			input 	=> saidaMuxJump,
			output	=> saidaPC
	 );
		
    ULA : entity work.ULA
	 
    port map
    (
        A        => saidaMUXI,
		  B		  => saidaAcumulador,
		  OP       => saidaROM(14 DOWNTO 13),
		  S        => saidaULA1,
		  CMP 	  => saidaULA2
		  
    );
	 
	 barramentoEnderecos <= saidaROM(7 DOWNTO 0);
	 barramentoDadosSaida <= saidaAcumulador;
	 resetBarramento <= saidaROM(17);
	 readEnable <= saidaROM(8);
	 writeEnable <= saidaROM(9);

    
    -- Completar com a instanciação de demais 
    -- componentes necessários

end architecture;