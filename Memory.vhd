library std;
use std.standard.all;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity memory is 
	port (add, mem_in: in std_logic_vector(15 downto 0); 
	      clk, mem_write, mem_read: in std_logic;
	      mem_out: out std_logic_vector(15 downto 0));
end entity;

architecture struct of memory is

	type regarray is array(31 downto 0) of std_logic_vector(15 downto 0);   -- defining a new type

	signal Mem: regarray := (
	   0 =>  "0000000001010000",--ADD
		1 =>  "0010000001010000",--SUB
		2 =>  "0011000001010000",--MUL
		3 =>  "0001000001000100",--ADI
		4 =>  "0100000000010000",--AND
		5 =>  "0101010001000000",--ORA
		6 =>  "0110000001010000",--IMP
		7 =>  "1000000000000111",--LHI
		8 =>  "1001000000000100",--LLI
		9 =>  "1010000110001110",--LW
		14=>  "1110000000001110",--J
		15 => "1100100110000010",--BEQ
		18 => "1111000001000000",--JLR
		27 => "1101000000000011",--JAL
		30 => "1011000001000101",--SW
		others => "0000000000000000");
	-- you can use the above mentioned way to initialise the memory with the instructions and the data as required to test your processor
	begin
	memory_read:
	process (mem_read, add, clk)
	begin
	if(mem_read = '1') then
			if(rising_edge(clk)) then
	           mem_out <= mem(to_integer(unsigned(add)));
	      end if;
	end if;
	end process;
	
	memory_write:
	process (mem_write, mem_in, add, clk)
		begin
		if(mem_write = '1') then
			if(rising_edge(clk)) then
				  mem(to_integer(unsigned(add))) <= mem_in;
			end if;
		end if;
	end process;

end architecture;
