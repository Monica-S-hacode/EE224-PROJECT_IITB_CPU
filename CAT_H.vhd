library ieee;
use ieee.std_logic_1164.all;

entity CAT_H is
    port (
        A: in std_logic_vector(7 downto 0);
        C: out std_logic_vector(15 downto 0)
    );
end entity;

architecture tralalala of CAT_H is
begin

process(A)
    variable cat: std_logic_vector(15 downto 0) := (others => '0');
begin
	 
    top: for i in 15 downto 8 loop
        cat(i) := A(i-8);
    end loop top;

    bot: for i in 7 downto 0 loop
        cat(i) := '0';
    end loop bot;

    C <= cat;
end process;

end architecture;
