library IEEE;
use IEEE.STD_LOGIC_1164.all;

--avem modul MANUAL signal cele 5 moduri automate: spalare rapida, camasi, culori inchise, antialergic si rufe murdare
--folosim un MUX 8:1 pentru a selecta modul (5 moduri reprezentate pe 3 biti)
entity SelectareModMUX is
	port( MANUAL: in STD_LOGIC_VECTOR(0 TO 5);  	   --TEMPERATURA OCUPA CELE MAI SEMNIFICATIVE DOUA POZITII
	MODUL: in STD_LOGIC_VECTOR(0 TO 2);
	TEMP: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	VIT:  OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	PRESPALARE: OUT STD_LOGIC;
	CLATIRE_SUPLIMENTARA: OUT STD_LOGIC);
end SelectareModMUX;

architecture SELECTIE of SelectareModMUX is
signal MOD_SELECTAT: STD_LOGIC_VECTOR(5 downto 0);
begin
	with MODUL select
	MOD_SELECTAT <= MANUAL when "000",
	"001000" when "001",
	"100000" when "010",
	"010101" when "011"	,
	"010110" when "100",
	"111001" when others;
	TEMP<=MOD_SELECTAT(5 downto 4);
	VIT<=MOD_SELECTAT(3 downto 2);
	PRESPALARE<=MOD_SELECTAT(1);
	CLATIRE_SUPLIMENTARA<=MOD_SELECTAT(0);
end SELECTIE;	