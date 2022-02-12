library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity centrifugare is 
	port( viteza: in STD_LOGIC_VECTOR(1 downto 0);
	ENABLE: in STD_LOGIC := '0';
	clk: in std_logic;
	fin1: out STD_LOGIC := '0';
	rotatie1, rotatie2, rotatie3: out STD_LOGIC := '0');
end centrifugare;	

architecture rotatie of centrifugare is	
signal timp: STD_LOGIC_VECTOR(3 downto 0) := "1010";
begin

functionare: process(ENABLE, clk, viteza) 
begin
if ENABLE = '1' then  
	if clk'event and clk = '1' then
	if timp = "0000" then
		fin1 <= '1'; 
		rotatie1 <= '0';
		rotatie2 <= '0';
		rotatie3 <= '0';
	else
		if viteza = "00" then
			rotatie1 <= '1';
			rotatie2 <= '0';
			rotatie3 <= '0';
		elsif viteza = "01" then
			rotatie1 <= '0';
			rotatie2 <= '1';
			rotatie3 <= '0';
		else
			rotatie1 <= '0';
			rotatie2 <= '0';
			rotatie3 <= '1'; 
		end if;
		timp <= timp - '1';
	end if;	
	end if;
	else 
		timp <= "1010";	
		fin1 <= '0';
		end if;
	end process;
end rotatie;