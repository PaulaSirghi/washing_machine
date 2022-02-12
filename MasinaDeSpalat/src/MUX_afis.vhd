library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_afis is
	port(I0,I1,I2,I3: in std_logic_vector(3 downto 0);
	MODUL: in std_logic_vector(1 downto 0);
	C: out std_logic_vector(3 downto 0));
end MUX_afis;

architecture MUXAfis of MUX_afis is
begin
	with MODUL select
	C<= I0 when "00",
	I1 when "01",
	I2 when "10",
	I3 when others;
end MUXAfis;