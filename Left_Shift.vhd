library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Left_Shift is
    port (
        input  :  in  std_logic_vector(15 downto 0);
        output : out std_logic_vector(15 downto 0)
    );
end Left_Shift;

architecture Behavioral of Left_Shift is
begin
    process(input)
    begin
        output <= input (14 downto 0) & '0'; -- Shift left by appending 0 at the end
    end process;
end Behavioral;