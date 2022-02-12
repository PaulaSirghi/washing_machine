library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NumaratorPrincipal is
	port(SEL: in std_logic_vector(3 downto 0);
	clk: in std_logic;
	USA, PORNIRE: in std_logic;
	DEBLOCARE: out std_logic:='1';
	O: out std_logic_vector(15 downto 0));	--vom cascada
end NumaratorPrincipal;

architecture numaratorP of NumaratorPrincipal is

component timer_mux is
	port(SEL2:in STD_LOGIC_VECTOR(3 downto 0);
	TIMP:out STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;

component numarator is
port(enable: in std_logic;
	clk:in std_logic;
	R:in std_logic;
	PL:in std_logic;
	L:in std_logic_vector (3 downto 0); --4 intrari
	TC: out std_logic;
	iesire: out std_logic_vector(3 downto 0)); --4 iesiri
end component;

signal timp: std_logic_vector (15 downto 0);	  
signal nP: std_logic;
signal TC0: std_logic;	 	
signal TC1: std_logic;
signal TC2: std_logic;
signal TC3: std_logic; 
signal I: std_logic_vector(15 downto 0);

begin incarcaTIMP: timer_mux port map(SEL,I);
	
	process(USA,PORNIRE,I)
	begin 
		if(USA='0' and PORNIRE='0') then
			timp<=I;
		end if;
	end process;
	
	nr0: numarator port map('1' , clk, '0', PORNIRE, timp(3 downto 0), TC0, o(3 DOWNTO 0));			  --cascadam doua numaratoare
	nr1: numarator port map(TC0 , clk, '0', PORNIRE, timp(7 downto 4), TC1, o(7 DOWNTO 4));
	
	process(TC0,TC1)
	begin 
		if TC0='1' and TC1='1' then
			DEBLOCARE<='1';		
		elsif PORNIRE='1' and USA='1' then
			DEBLOCARE<='0';
		end if;
	end process;
end numaratorP;