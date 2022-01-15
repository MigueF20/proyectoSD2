--Miguel Freire
--Bloque creado por el diseñador
library ieee;
use ieee.std_logic_1164.all;

entity validadordatos is
port(teclado: in std_logic_vector(2 downto 0);
		numeroRamLeido: in std_logic_vector(5 downto 0);
		inicio,en_numRam: out std_logic);
end validadordatos ;
architecture solve of validadordatos is
begin 
process(teclado,numeroRamleido)
begin 
if  teclado(2)='1' or teclado(1)='1' or teclado(0)='1'  then inicio<='1';
else inicio<='0';
end if;
if (numeroRamLeido(5)='1' or numeroRamLeido(4)='1' or numeroRamLeido(3)='1' or numeroRamLeido(2)='1' or numeroRamLeido(1)='1' or numeroRamLeido(0)='1') then en_numRam<='1';
else en_numRam<='0';
end if;
end process;
end solve;
