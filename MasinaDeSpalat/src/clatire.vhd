library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--se alimenteaza cu apa, se roteste (120 ROTATII) timp de 10 minute, se evacueaza apa
entity clatire is
	port( ENABLE: in STD_LOGIC:='0';
	CLK: in STD_LOGIC;
	A,R120,E,ABLE: out STD_LOGIC:= '0'); --alimentare, rotatie, evacuare, able=sfarsit
end clatire;																  

architecture  clateste of clatire is
signal timp: std_logic_vector(3 downto 0) :="1110"; --14 de minute, 10 rotirea +4 alimentare signal evacuare
begin 

incepe: process(ENABLE, CLK)
begin
	if ENABLE='1' then
		if clk'event and clk='1' then
			if timp="1110" or timp="1101" then 
				A<='1'; --se alimenteaza cu apa
				R120<='0';
				E<='0';
				timp<=timp-1;			
			elsif timp="0001" or timp="0010" then 
			 	A<='0';
				R120<='0';
				E<='1'; --se evacueaza apa
				timp<=timp-1;
			elsif timp="0000" then	 
				A<='0';
				R120<='0';
				E<='0';
				ABLE<='1'; --s-a incheiat clatirea	
			else   
				A<='0'; 
				R120<='1'; --se roteste
				E<='0';
				timp<=timp-1; 
			end if;
			end if;
	else
		timp<="1110";
		ABLE<='0';
	end if;
end process;
end clateste;
				
				