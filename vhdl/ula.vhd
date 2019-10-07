library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity ula is
port
(
A, B: in STD_LOGIC_VECTOR(3 downto 0);
oper: in STD_LOGIC_VECTOR(2 downto 0);
N, Z, C, V: out STD_LOGIC;
S: out STD_LOGIC_VECTOR(3 downto 0)
);
end ula;
architecture ula4bits of ula is
signal iA, iB, i_S: STD_LOGIC_VECTOR(4 downto 0);
signal SS: STD_LOGIC_VECTOR(3 downto 0);
begin
iA <= A(3) & A; -- Extensão de sinal
iB <= B(3) & B;
SS <= i_S(3 downto 0);
S <= SS;
with op select
i_S <= iA + iB when “000”,
iA - iB when “001”,
iA + 1 when “010”,
iA - 1 when “011”,
iA and iB when “100”,
iA or iB when “101”,
iA xor iB when “110”,
not iA when others;
N <= '1' when SS < 0 else '0';
Z <= '1' when SS = 0 else '0';
C <= i_S(4);
V <= '1' when
((op=“000”) and ((iA>0 and iB>0 and SS<0) or (iA < 0 and iB < 0 and SS > 0))) or
((op=“010” or op=“011”) and ((iA > 0 and SS < 0) or (iA < 0 and SS > 0))) or
((op=“001”) and ((iA>0 and iB<0 and SS<0) or (iA < 0 and iB > 0 and SS > 0)))
else '0';
end ula4bits; 