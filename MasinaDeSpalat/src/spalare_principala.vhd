library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity spalare_principala is
	port(usa: in std_logic:='0'; 
	start: in std_logic:='0'; 
	clk: in std_logic;
	temp: in std_logic_vector(1 downto 0);
	A,I,R60,E,ABLE: out std_logic:='0');  
end spalare_principala;

architecture spalare of spalare_principala is
signal timp: STD_LOGIC_VECTOR (4 DOWNTO 0);
begin 	

spala: process(clk,start, usa, temp)
begin 	
	if temp = "00" then
		           timp <= "11001";
	           elsif temp = "01" then
		           timp <= "11010";
	            elsif temp = "10" then
		           timp <= "11011";
	            else
	            	timp <= "11100";  
		endif;
	
	if usa='1' and start='1' then --daca usa e inchisa
		if clk'event and clk='1' then
			if temp="00" then --30 de grade
				if timp="11001" or timp="11000" then
					A<='1';
					I<='0';
					R60<='0';
					E<='0'; 
					timp<=timp-1; 
				elsif timp="10111" then 
					A<='0';
					I<='1';
					R60<='0';
					E<='0'; 
					timp<=timp-1; 
				elsif timp="00000" then
					A<='0';
					I<='0';
					R60<='0';
					E<='0'; 
					ABLE<='1';
				elsif timp="00010" or timp="00001" then
					A<='0';
					I<='0';
					R60<='0';
					E<='1'; 
					timp<=timp-1; 
				else
					A<='0';
					I<='0';
					R60<='1';
					E<='0'; 
					timp<=timp-1; 
				end if;
			elsif temp="01" then  --40 de grade
					if timp="11010" or timp="11001" then
					A<='1';
					I<='0';
					R60<='0';
					E<='0'; 
					timp<=timp-1; 
				elsif timp="11000" or timp="10111" then 
					A<='0';
					I<='1';
					R60<='0';
					E<='0'; 
					timp<=timp-1; 
				elsif timp="00000" then
					A<='0';
					I<='0';
					R60<='0';
					E<='0'; 
					ABLE<='1';
				elsif timp="00010" or timp="00001" then
					A<='0';
					I<='0';
					R60<='0';
					E<='1'; 
					timp<=timp-1; 
				else
					A<='0';
					I<='0';
					R60<='1';
					E<='0'; 
					timp<=timp-1; 
				end if;
			elsif temp="10" then  --60 de grade
					if timp="11011" or timp="11010" then
					A<='1';
					I<='0';
					R60<='0';
					E<='0'; 
					timp<=timp-1; 
				elsif timp="11001" or timp="11000" or timp="10111" then 
					A<='0';
					I<='1';
					R60<='0';
					E<='0'; 
					timp<=timp-1; 
				elsif timp="00000" then
					A<='0';
					I<='0';
					R60<='0';
					E<='0'; 
					ABLE<='1';
				elsif timp="00010" or timp="00001" then
					A<='0';
					I<='0';
					R60<='0';
					E<='1'; 
					timp<=timp-1; 
				else
					A<='0';
					I<='0';
					R60<='1';
					E<='0'; 
					timp<=timp-1; 
				end if;	
			else 	--90 de grade
				if timp="11100" or timp="11011" then
					A<='1';
					I<='0';
					R60<='0';
					E<='0'; 
					timp<=timp-1; 
				elsif timp="11010" or timp="11001" or timp="11000" or timp="10111" then 
					A<='0';
					I<='1';
					R60<='0';
					E<='0'; 
					timp<=timp-1; 
				elsif timp="00000" then
					A<='0';
					I<='0';
					R60<='0';
					E<='0'; 
					ABLE<='1';
				elsif timp="00010" or timp="00001" then
					A<='0';
					I<='0';
					R60<='0';
					E<='1'; 
					timp<=timp-1; 
				else
					A<='0';
					I<='0';
					R60<='1';
					E<='0'; 
					timp<=timp-1; 
				end if;
				end if;
			end if;
			else
				if temp = "00" then
		           timp <= "11001";
	            elsif temp = "01" then
		           timp <= "11010";
	            elsif temp = "10" then
		           timp <= "11011";
	            else
	            	timp <= "11100";
	            end if;	 
				ABLE <= '0';
	end if;
	end process;

end spalare;

				
				