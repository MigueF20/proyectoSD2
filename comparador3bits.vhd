--Miguel Freire
library ieee;
use ieee.std_logic_1164.all;

entity comparador3bits is
port(A, B: in std_logic_vector(2 downto 0);
		AigualB, AmenorB, AmayorB: out std_logic);
end comparador3bits;

architecture solve of comparador3bits is
begin
AigualB<='1' when A=B else '0';
AmenorB<='1' when A<B else '0';
AmayorB<='1' when A>B else '0';
end solve;