library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR4 is 
	port(I0, I1, I2, I3: in std_logic;	--4 pentru alimentare sau 4 pentru evacuare
	O: out std_logic);
end OR4;

--se va aprinde cate un bec cand are loc alimentarea sau evacuarea
architecture Or_4 of OR4 is
begin

	 O <= I0 or I1 or I2 or I3;

end Or_4;
