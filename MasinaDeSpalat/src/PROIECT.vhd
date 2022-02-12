 library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity proiect is
	port (TEMP0, VIT0: in STD_LOGIC_VECTOR (1 downto 0);
	PRE0, SUPL0: in STD_LOGIC;
	SEL: in STD_LOGIC_VECTOR (2 downto 0);
	USA: in STD_LOGIC; 	   
	PORNIRE: in STD_LOGIC;	  
	clk_i: in STD_LOGIC;
	ALIMENTARE: out STD_LOGIC;
	EVACUARE: out STD_LOGIC;
	INCALZIRE: out STD_LOGIC;
	ROTIRE60: out STD_LOGIC;
	ROTIRE120: out STD_LOGIC;
	ROTIRE800: out STD_LOGIC;
	ROTIRE1000: out STD_LOGIC;
	ROTIRE1200: out STD_LOGIC;  
	DEBLOCARE: out STD_LOGIC;
	IESIRE: out std_logic_vector(6 downto 0));
end proiect;


architecture arhitectura_principala of proiect is	

component DivizorDeFrecventa is				
	port(clk_i: in std_logic;
	clk_o: out std_logic);
end component;

component SelectareModMUX
	port( MANUAL: in STD_LOGIC_VECTOR(0 TO 5);  	   --TEMPERATURA OCUPA CELE MAI SEMNIFICATIVE DOUA POZITII
	MODUL: in STD_LOGIC_VECTOR(0 TO 2);
	TEMP: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	VIT:  OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	PRESPALARE: OUT STD_LOGIC;
	CLATIRE_SUPLIMENTARA: OUT STD_LOGIC);	
end component SelectareModMUX;

component TIMER is 
	port(
	PORNIRE: in std_logic; 
	USA: in std_logic;	  
	SEL_TIMP: in std_logic_vector(3 downto 0);
	clk: in std_logic; 
	DEBLOCARE: out std_logic;
	IESIRE: out std_logic_vector(6 downto 0));
end component TIMER;

component spalare_principala
    port(usa: in std_logic:='0'; 
	start: in std_logic:='0'; 
	clk: in std_logic;
	temp: in std_logic_vector(1 downto 0);
	A,I,R60,E,ABLE: out std_logic:='0');  
end component spalare_principala;

component clatire
	port(ENABLE: in STD_LOGIC := '0';
	clk: in STD_LOGIC;
	A, R120, E, ABLE: out STD_LOGIC :='0');
end component clatire;	   

component centrifugare is 
	port( viteza: in STD_LOGIC_VECTOR(1 downto 0);
	ENABLE: in STD_LOGIC := '0';
	clk: in std_logic;
	fin1: out STD_LOGIC := '0';
	rotatie1, rotatie2, rotatie3: out STD_LOGIC := '0');
end component centrifugare;

component prespalare
	port(ENABLE: in STD_LOGIC := '0';
	Temperatura: in STD_LOGIC_VECTOR(1 downto 0);
	Prespalat: in STD_LOGIC;	
	clk: in std_logic;
	Alimentare, Incalzire, Rotatie60, Evacuare, fin3: out STD_LOGIC :='0');
end component prespalare; 

component clatireSuplimentara
	port(ENABLE: in STD_LOGIC := '0';
	suplimentara: in STD_LOGIC;		
	clk: in STD_LOGIC;
	Alimentare, Rotatie120, Evacuare, fin2: out STD_LOGIC :='0');
end component clatireSuplimentara;	 

component OR4
	port(I0, I1, I2, I3: in STD_LOGIC;
	O: out STD_LOGIC);
end component OR4;	 

component OR2
	port(a, b: in STD_LOGIC;
	c: out STD_LOGIC);
end component OR2;	  


signal TEMP: STD_LOGIC_VECTOR (1 downto 0);
signal VIT: STD_LOGIC_VECTOR (1 downto 0);
signal PRE: STD_LOGIC;
signal SUPL: STD_LOGIC;	  
signal FIN1: STD_LOGIC;
signal FIN2: STD_LOGIC;
signal FIN3: STD_LOGIC;
signal FIN4: STD_LOGIC;	   
signal RESET: STD_LOGIC; 
signal Manual: STD_LOGIC_VECTOR (5 downto 0);
signal ALIMENTARE1: STD_LOGIC;
signal INCALZIRE1: STD_LOGIC;
signal EVACUARE1: STD_LOGIC;
signal ROTIRE60_1: STD_LOGIC;
signal ALIMENTARE2: STD_LOGIC;
signal EVACUARE2: STD_LOGIC;
signal ROTIRE120_2: STD_LOGIC;  
signal ALIMENTARE3: STD_LOGIC;
signal INCALZIRE3: STD_LOGIC;
signal EVACUARE3: STD_LOGIC;
signal ROTIRE60_3: STD_LOGIC;
signal ALIMENTARE4: STD_LOGIC;
signal EVACUARE4: STD_LOGIC;	
signal ROTIRE120_4: STD_LOGIC; 	
signal clk: STD_LOGIC;

begin 
	
clk_divizat: DivizorDeFrecventa port map(clk_i, clk);
	
Manual(5 downto 4) <= TEMP0 (1 downto 0);
Manual (3 downto 2) <= VIT0 (1 downto 0);
Manual (1) <= PRE0;	
Manual (0) <= SUPL0;


SEL_MOD: SelectareModMUX port map(	
    MANUAL => Manual,
	MODUL =>	SEL,
	TEMP => TEMP,
    VIT =>	VIT,
	PRESPALARE =>	PRE,
	CLATIRE_SUPLIMENTARA => SUPL
);

DURATA: TIMER port map(	
    PORNIRE => PORNIRE, 
	USA	=> USA,
	SEL_TIMP(3 downto 2) => TEMP,
	SEL_TIMP(1) => PRE,
	SEL_TIMP(0) => SUPL,
	clk	=> clk,
	DEBLOCARE =>DEBLOCARE,
	IESIRE => IESIRE
);

ETAPA_1: spalare_principala port map(
    clk => clk,
    USA => USA,
    START => PORNIRE,
	TEMP =>	TEMP,	 
	A => ALIMENTARE1,
    I => INCALZIRE1,
    R60 => ROTIRE60_1,
    E =>   EVACUARE1,
    ABLE =>	FIN1 
);

ETAPA_2:clatire port map(
    clk => clk,
    ENABLE => FIN1,
    A => ALIMENTARE2,
    R120 =>	ROTIRE120_2,
    E => EVACUARE2,
    ABLE =>	FIN2
);

ETAPA_3: centrifugare port map(	
    clk => clk,
    viteza => VIT,
	ENABLE => FIN2,
	fin1 => FIN3,
	rotatie1 => ROTIRE800,
	rotatie2 => ROTIRE1000,
	rotatie3 => ROTIRE1200
);

ETAPA_4: prespalare port map( 
    clk => clk,
    ENABLE => FIN3,
	Temperatura => TEMP,
	Prespalat => PRE,
	Alimentare => ALIMENTARE3,
	Incalzire => INCALZIRE3,
    Rotatie60 => ROTIRE60_3,
	Evacuare => EVACUARE3,
	fin3 => FIN4
);

ETAPA_5: clatireSuplimentara port map(
	clk => clk,
    ENABLE => FIN4,
    suplimentara =>	SUPL,
	Alimentare => ALIMENTARE4,
    Rotatie120 =>	ROTIRE120_4,
    Evacuare => EVACUARE4,
    fin2 => RESET
);

ALIM: OR4 port map(
    I0 => ALIMENTARE1,
    I1 => ALIMENTARE2,
    I2 => ALIMENTARE3,
    I3 => ALIMENTARE4, 
	O => ALIMENTARE
); 

EVAC: OR4 port map(
I0 => EVACUARE1,
I1 => EVACUARE2,
I2 => EVACUARE3,
I3 => EVACUARE4,
O => EVACUARE
);

INCAL: OR2 port map(
a=> INCALZIRE1,
b => INCALZIRE3,
c => INCALZIRE
);

ROT60: OR2 port map(
a => ROTIRE60_1,
b => ROTIRE60_3,
c => ROTIRE60
);

ROT120: OR2 port map(
a => ROTIRE120_2,
b => ROTIRE120_4,
c => ROTIRE120
);

end arhitectura_principala;
