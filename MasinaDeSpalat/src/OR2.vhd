library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR2 is
	port(a,b:in std_logic;
	c:out std_logic);
end OR2;
architecture sau2 of OR2 is
begin
	c<=a or b;
end sau2;
