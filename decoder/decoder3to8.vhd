library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder_3to8 is
    Port ( a : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end decoder_3to8;

architecture Behavioral of decoder_3to8 is

begin

process(a)
    variable j : integer range 0 to 7 := to_integer(unsigned(a));
begin
    for i in 0 to 7 loop
        if i /= j then
            y(i) <= '0';
        else
            y(i) <= '1';
        end if;
    end loop;
end process;

end Behavioral;
