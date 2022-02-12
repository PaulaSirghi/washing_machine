library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TIMER is
	port(PORNIRE: in std_logic;
	USA: in std_logic;
	SEL_TIMP: in std_logic_vector(3 downto 0);
	clk: in std_logic;
	DEBLOCARE:	 out std_logic;
	IESIRE: out std_logic_vector(6 downto 0)); --pentru 7 segmente
end TIMER;

architecture tempo of TIMER is

component NumaratorPrincipal is
	port(SEL: in std_logic_vector(3 downto 0);
	clk: in std_logic;
	USA, PORNIRE: in std_logic;
	DEBLOCARE: out std_logic:='1';
	O: out std_logic_vector(15 downto 0));
end component; 

component dcd_afisor is
	port(nr:in std_logic_vector(3 downto 0);
	afisor:out std_logic_vector(6 downto 0));
end component;

component MUX_afis is
	port(I0,I1,I2,I3: in std_logic_vector(3 downto 0);
	MODUL: in std_logic_vector(1 downto 0);
	C: out std_logic_vector(3 downto 0));
end component;

signal X: std_logic_vector(15 downto 0);
signal Y: std_logic_vector(3 downto 0);

begin
 
CNT: NumaratorPrincipal port map(SEL_TIMP, clk, USA, PORNIRE, DEBLOCARE, X);
MUX: MUX_afis port map(X(15 downto 12), X(11 downto 8), X(7 downto 4), X(3 downto 0), X(1 downto 0), Y);
DCD: dcd_afisor port map(Y, IESIRE); 

end tempo;