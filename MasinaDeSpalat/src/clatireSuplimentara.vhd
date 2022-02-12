library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clatireSuplimentara is 
	port(ENABLE: in STD_LOGIC := '0';
	suplimentara: in STD_LOGIC;	  
	clk: in std_logic;
	Alimentare, Rotatie120, Evacuare, fin2: out STD_LOGIC := '0');
end clatireSuplimentara;

architecture Suplimentara of clatireSuplimentara is	
signal timp: std_logic_vector(3 downto 0) := "1110";
begin
functionare: process(ENABLE, suplimentara, clk) 
begin 
	if ENABLE = '1' then 
	    if suplimentara = '1' then	  
		if clk'event and clk = '1' then
		if timp = "1110" or timp = "1101" then
			Alimentare <= '1';
			Rotatie120 <= '0';
			Evacuare <= '0';
			timp <= timp - 1;
		elsif timp = "0010" or timp = "0001" then 
			Alimentare <= '0';
			Rotatie120 <= '0';
			Evacuare <= '1';	
	    	timp <= timp - 1;
		elsif timp = "0000" then
			Alimentare <= '0';
			Rotatie120 <= '0';
			Evacuare <= '0';
			fin2 <='1';	  
		else 
			Alimentare <= '0';
			Rotatie120 <= '1';
			Evacuare <= '0';
			timp <= timp - 1;
		end if;
		end if;
		else
			fin2 <= '1';
			end if;
	else
		timp <= "1110";
		fin2 <= '0';
	end if;	 
end process;

end Suplimentara;
