--Miguel Freire
library ieee;
use ieee.std_logic_1164.all;

entity reg_sot3bits is
port (clock, reset, En: in std_logic;
		Ent: in std_logic_vector(2 downto 0);
		Q: out std_logic_vector(2 downto 0));
end reg_sot3bits;

architecture desarrollo of reg_sot3bits is
signal temp: std_logic_vector(2 downto 0);
begin
process(En)
	begin
	if reset='0' then temp<="000";
	elsif (clock'event and clock='1') then
		if En='1' then temp<=Ent;
			else temp<=temp;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;