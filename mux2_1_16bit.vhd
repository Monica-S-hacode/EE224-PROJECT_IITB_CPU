library ieee;
use ieee.std_logic_1164.all;

entity mux2_1_16bit is 
 port( A,B: in std_logic_vector(15 downto 0);sel : in std_logic; Y: out std_logic_vector(15 downto 0));
end entity;

architecture logic of mux2_1_16bit is 
 component mux2_1 is 
	 port( A,B,sel: in std_logic; Y: out std_logic);
 end component;
 
begin 
 gen: for i in 0 to 15 generate
  mux: mux2_1
   port map( A => A(i), B => B(i), sel => sel, Y => Y(i));
 end generate;	

end logic;  