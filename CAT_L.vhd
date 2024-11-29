library ieee;
use ieee.std_logic_1164.all;

entity CAT_L is
    port (
        A: in std_logic_vector(7 downto 0);
        C: out std_logic_vector(15 downto 0)
    );
end entity;

architecture ringdingdong of CAT_L is
begin
process(A)
 variable cat: std_logic_vector(15 downto 0) := (others => '0');
 begin
        loop1: for i in 7 downto 0 loop
            cat(i) := A(i);
        end loop;
		  
        for_loop1: for i in 15 downto 8 loop
            cat(i) := '0' ;
        end loop;
        C<=cat;
end process;
end architecture;