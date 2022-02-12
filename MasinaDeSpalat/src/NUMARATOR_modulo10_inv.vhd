library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity numarator is
	port(enable: in std_logic;
	clk:in std_logic;
	R:in std_logic;
	PL:in std_logic;
	L:in std_logic_vector (3 downto 0); --4 intrari
	TC: out std_logic;
	iesire: out std_logic_vector(3 downto 0)); --4 iesiri
end numarator;

architecture num of numarator is
signal timp: std_logic_vector(0 to 3);
begin  
process (clk,R,PL)
begin
	if R='1' then 
		timp<="1001"; --incepe de la 10 sa numere
	elsif clk'event and clk='1'	then 
		if PL='1' then	 --incarca paralel
			timp<=L;
		elsif enable='1' then
			if timp="0000" then    --reincepe de la 10
				timp<="1001";
				TC<='0';
			else
				timp<=timp-1;	   --timpul scade pana la 0
				if timp="0001" then
					TC<='1';
				else
					TC<='0';  
				end if;
			end if;
		end if;
	end if;
	end process;   
	iesire<=timp;
end num;
	
	