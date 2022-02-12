library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity prespalare is 
	port(ENABLE: in STD_LOGIC := '0';
	Temperatura: in STD_LOGIC_VECTOR(1 downto 0);
	Prespalat: in STD_LOGIC;	
	clk: in std_logic;
	Alimentare, Incalzire, Rotatie60, Evacuare, fin3: out STD_LOGIC :='0');
end  prespalare;									

architecture prespalare1 of prespalare  is  
signal timp: STD_LOGIC_VECTOR(4 downto 0);
begin
	process(ENABLE, clk, Temperatura, Prespalat)
begin
	if ENABLE = '1' then  
		if Prespalat = '1' then  
		if clk'event and clk = '1' then
		if Temperatura = "00" then
			if timp = "01111" or timp = "01110" then
						Alimentare <= '1';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '0';
						timp <= timp - 1;
					elsif timp = "01101" then
						Alimentare <= '0';	  
						Incalzire <= '1';
						Rotatie60 <= '0';
						Evacuare <= '0';
						timp <= timp - 1;
					elsif timp = "00010" or timp = "00001" then
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '1'; 
						timp <= timp - 1;
					elsif timp = "00000" then
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '0'; 
						fin3 <= '1';
					else
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '1';
						Evacuare <= '0';
						timp <= timp - 1;
					end if;
				elsif Temperatura = "01" then
					  if timp = "10000" or timp = "01111" then
						Alimentare <= '1';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '0';
						timp <= timp - 1;
					elsif timp = "01110" or timp = "01101" then
						Alimentare <= '0';	  
						Incalzire <= '1';
						Rotatie60 <= '0';
						Evacuare <= '0'; 
						timp <= timp - 1;
					elsif timp = "00010" or timp = "00001" then
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '1'; 
						timp <= timp - 1;
					elsif timp = "00000" then
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '0'; 
						fin3 <= '1';
					else
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '1';
						Evacuare <= '0'; 
						timp <= timp - 1;
					end if;
				elsif Temperatura = "10" then 
					if timp = "10001" or timp = "10000" then
						Alimentare <= '1';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '0';
						timp <= timp - 1;
					elsif timp = "01111" or timp = "01110" or timp = "01101" then
						Alimentare <= '0';	  
						Incalzire <= '1';
						Rotatie60 <= '0';
						Evacuare <= '0';
						timp <= timp - 1;
					elsif timp = "00010" or timp = "00001" then
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '1'; 
						timp <= timp - 1;
					elsif timp = "00000" then
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '0'; 
						fin3 <= '1';
					else
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '1';
						Evacuare <= '0'; 
						timp <= timp - 1;
					end if;
				else
					if timp = "10010" or timp = "10001" then
						Alimentare <= '1';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '0'; 
						timp <= timp - 1;
					elsif timp = "10000" or timp = "01111" or timp = "01110" or timp = "01101" then
						Alimentare <= '0';	  
						Incalzire <= '1';
						Rotatie60 <= '0';
						Evacuare <= '0'; 
						timp <= timp - 1;
					elsif timp = "00010" or timp = "00001" then
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '1'; 
						timp <= timp - 1;
					elsif timp = "00000" then
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '0';
						Evacuare <= '0'; 
						fin3 <= '1';
					else
						Alimentare <= '0';	  
						Incalzire <= '0';
						Rotatie60 <= '1';
						Evacuare <= '0'; 
						timp <= timp - 1;
					end if;	
				end if;
				end if;	
				else
					fin3 <= '1';
				end if;
			else
				if Temperatura = "00" then
		           timp <= "01111";
	            elsif Temperatura = "01" then
		           timp <= "10000";
	            elsif Temperatura = "10" then
		           timp <= "10001";
	            else
	            	timp <= "10010";
	            end if;	 
				fin3 <= '0';   
			end if;
	end process;

end prespalare1;