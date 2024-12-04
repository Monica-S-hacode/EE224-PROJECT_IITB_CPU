library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Memory is
    port (
        add, mem_in : in std_logic_vector(15 downto 0); -- Address and input data
        clk, mem_write : in std_logic;       -- Clock and control signals
        mem_out : out std_logic_vector(15 downto 0)    -- Memory output
    );
end entity;

architecture struct of Memory is

    -- Define memory array with 32 words, each 16 bits wide
    type regarray is array(31 downto 0) of std_logic_vector(15 downto 0);
    signal Memory : regarray := (
        0  => "0000000001010000", -- ADD
        2  => "0010000001010000", -- SUB
        4  => "0011000001010000", -- MUL
        6  => "0001000001000100", -- ADI
        8  => "0100000000010000", -- AND
        10  => "0101010001000000", -- ORA
        12 => "0110000001010000", -- IMP
        14  => "1000000000000111", -- LHI
        16  => "1001000000000100", -- LLI
        18  => "1010000110001110", -- LW
        20 => "1110000000001110", -- J
        22 => "1100100110000010", -- BEQ
        24 => "1111000001000000", -- JLR
        26 => "1101000000000011", -- JAL
        28 => "1011000001000101", -- SW
        others => x"0000"         -- Default value for uninitialized memory
    );

begin

    -- Synchronous memory read process
    memory_read: process(clk)
    begin
        if rising_edge(clk) then
				 if to_integer(unsigned(add)) < 32 then -- Address bounds check
					  mem_out <= Memory(to_integer(unsigned(add)));
				 else
					  mem_out <= (others => 'X'); -- Invalid address indication
				 end if;
        end if;
    end process;

    -- Synchronous memory write process
    memory_write: process(clk)
    begin
        if rising_edge(clk) then
            if mem_write = '1' then
                if to_integer(unsigned(add)) < 32 then -- Address bounds check
                    Memory(to_integer(unsigned(add))) <= mem_in;
                end if;
            end if;
        end if;
    end process;

end struct;
