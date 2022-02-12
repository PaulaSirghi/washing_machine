library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.STD_LOGIC_unsigned.all;	   

entity DivizorDeFrecventa is
	port(clk_i : in std_logic;	
	clk_o: out std_logic); 
end DivizorDeFrecventa;

architecture divide of DivizorDeFrecventa is
signal numarator: std_logic_vector (26 downto 0):="000000000000000000000000000";
begin
	process(clk_i)
	begin
		if clk_i'event and clk_i='1' then
			if numarator="101111101011110000100000001" then
				numarator<=(others=>'0');
				clk_o<='1';
			else
				numarator<=numarator+1;
				clk_o<='0';
			end if;
		end if;
	end process;	
end divide;