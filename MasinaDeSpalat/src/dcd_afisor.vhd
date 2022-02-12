library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dcd_afisor is
	port(nr:in std_logic_vector(3 downto 0);
	afisor:out std_logic_vector(6 downto 0));
end dcd_afisor;

architecture afis of dcd_afisor is
begin
	process(nr)
	begin
		case nr is
			when "0000" => afisor <="0000001";
			when "0001" => afisor <="1001111";
			when "0010" => afisor <="0010010";
			when "0011" => afisor <="0000110";
			when "0100" => afisor <="1001100";
			when "0101" => afisor <="0100100";
			when "0110" => afisor <="0100000";
			when "0111" => afisor <="0001111";
			when "1000" => afisor <="0000000";
			when "1001" => afisor <="0000100";
			when "1010" => afisor <="0001000";
			when "1011" => afisor <="1100000";
			when "1100" => afisor <="0110001";
			when "1101" => afisor <="1000010";
			when "1110" => afisor <="0110000";
			when others => afisor <="0111000";
		end case;
	end process;
end afis;
