

--Miguel Freire
library ieee;
use ieee.std_logic_1164.all;

entity MSS is
port(clock,resetn: in std_logic;
		start,en_numRam,verificacion_numingresado: in std_logic;
		en_numero,en_sost,cuentadatos,en_sost_bcd,en_contadores: out std_logic;
		estados: out std_logic_vector(3 downto 0));
		
end MSS;


--Arquitectura de la MSS
architecture solve of MSS is

type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg);
signal y: estado;
--Declaracion de Componente

begin
	process(clock, resetn) 
		begin
		if resetn='0' then y<=Ta;
			elsif(clock'event and clock='1') then
			case y is
--Estados de la MSS
				when Ta=> if start='1' then y<=Tb; else y<=Ta; end if;
				when Tb=> if start='0' then y<=Tc; else y<=Tb; end if;
				when Tc=> if verificacion_numingresado='1' then y<=Td; else y<=Tc; end if;
				when Td=> if en_numRam='1' then y<=Te; else y<=Tf; end if;
				when Te=> if en_numRam='1' then y<=Td; else y<=Tf; end if;
				when tf=> y<=Tg;
				when tg=> y<=Ta;
			end case;
		end if;
	end process;
	
		process(y)
		begin
		--Encerado de señaloes
		en_numero<='0';en_sost<='0';cuentadatos<='0';en_sost_bcd<='0';en_contadores<='0';
		estados<="0000";
		case y is	
			when Ta=>estados<="0000";
			when Tb=>estados<="0001"; 
			when Tc=>estados<="0010";
			if verificacion_numingresado='1' then en_numero<='1' ; en_sost<='1'; 
			else en_numero<='0'; 
			end if;
			when Td=> estados<="0011"; if en_numRam='1' then cuentadatos<='1'; en_sost<='1'; en_contadores<='1';else en_contadores<='1';en_sost_bcd<='1'; end if;
			when Te=> estados<="0100"; if en_numRam='1' then cuentadatos<='1'; en_sost<='1'; en_contadores<='1'; else en_contadores<='1';en_sost_bcd<='1'; end if;
			when tf=> estados<="0101";
			when Tg=> estados<="0110";
		end case;
		end process;
	end solve;