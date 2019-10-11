-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/08/2019 15:20:41"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ram
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ram_vhd_vec_tst IS
END ram_vhd_vec_tst;
ARCHITECTURE ram_arch OF ram_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL dadoEscrita : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL endereco : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL escreve : STD_LOGIC;
SIGNAL leitura : STD_LOGIC;
SIGNAL saida : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT ram
	PORT (
	clk : IN STD_LOGIC;
	dadoEscrita : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	endereco : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	escreve : IN STD_LOGIC;
	leitura : IN STD_LOGIC;
	saida : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ram
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	dadoEscrita => dadoEscrita,
	endereco => endereco,
	escreve => escreve,
	leitura => leitura,
	saida => saida
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;
-- dadoEscrita[7]
t_prcs_dadoEscrita_7: PROCESS
BEGIN
	dadoEscrita(7) <= '0';
WAIT;
END PROCESS t_prcs_dadoEscrita_7;
-- dadoEscrita[6]
t_prcs_dadoEscrita_6: PROCESS
BEGIN
	dadoEscrita(6) <= '0';
WAIT;
END PROCESS t_prcs_dadoEscrita_6;
-- dadoEscrita[5]
t_prcs_dadoEscrita_5: PROCESS
BEGIN
	dadoEscrita(5) <= '0';
WAIT;
END PROCESS t_prcs_dadoEscrita_5;
-- dadoEscrita[4]
t_prcs_dadoEscrita_4: PROCESS
BEGIN
	dadoEscrita(4) <= '0';
WAIT;
END PROCESS t_prcs_dadoEscrita_4;
-- dadoEscrita[3]
t_prcs_dadoEscrita_3: PROCESS
BEGIN
	dadoEscrita(3) <= '0';
WAIT;
END PROCESS t_prcs_dadoEscrita_3;
-- dadoEscrita[2]
t_prcs_dadoEscrita_2: PROCESS
BEGIN
	dadoEscrita(2) <= '0';
WAIT;
END PROCESS t_prcs_dadoEscrita_2;
-- dadoEscrita[1]
t_prcs_dadoEscrita_1: PROCESS
BEGIN
	dadoEscrita(1) <= '0';
WAIT;
END PROCESS t_prcs_dadoEscrita_1;
-- dadoEscrita[0]
t_prcs_dadoEscrita_0: PROCESS
BEGIN
	dadoEscrita(0) <= '0';
WAIT;
END PROCESS t_prcs_dadoEscrita_0;
-- endereco[7]
t_prcs_endereco_7: PROCESS
BEGIN
	endereco(7) <= '0';
WAIT;
END PROCESS t_prcs_endereco_7;
-- endereco[6]
t_prcs_endereco_6: PROCESS
BEGIN
	endereco(6) <= '0';
WAIT;
END PROCESS t_prcs_endereco_6;
-- endereco[5]
t_prcs_endereco_5: PROCESS
BEGIN
	endereco(5) <= '0';
WAIT;
END PROCESS t_prcs_endereco_5;
-- endereco[4]
t_prcs_endereco_4: PROCESS
BEGIN
	endereco(4) <= '0';
WAIT;
END PROCESS t_prcs_endereco_4;
-- endereco[3]
t_prcs_endereco_3: PROCESS
BEGIN
	endereco(3) <= '0';
WAIT;
END PROCESS t_prcs_endereco_3;
-- endereco[2]
t_prcs_endereco_2: PROCESS
BEGIN
	endereco(2) <= '0';
WAIT;
END PROCESS t_prcs_endereco_2;
-- endereco[1]
t_prcs_endereco_1: PROCESS
BEGIN
	endereco(1) <= '0';
WAIT;
END PROCESS t_prcs_endereco_1;
-- endereco[0]
t_prcs_endereco_0: PROCESS
BEGIN
	endereco(0) <= '1';
WAIT;
END PROCESS t_prcs_endereco_0;

-- escreve
t_prcs_escreve: PROCESS
BEGIN
	escreve <= '1';
WAIT;
END PROCESS t_prcs_escreve;

-- leitura
t_prcs_leitura: PROCESS
BEGIN
	leitura <= '0';
WAIT;
END PROCESS t_prcs_leitura;
END ram_arch;
