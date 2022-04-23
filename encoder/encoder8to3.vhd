library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity encoder8to3 is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC_VECTOR (2 downto 0);
           valid : out STD_LOGIC);
end encoder8to3;

architecture Behavioral of encoder8to3 is

begin

process(x)
variable j : integer;
begin
    y <= "000";
    valid <= '0';
    for j in 7 downto 0 loop
        if x(j) = '1' then
            y <= std_logic_vector(to_unsigned(j,3));
            exit;
        end if;
    end loop;
    valid <= '1';
end process;

end Behavioral;
