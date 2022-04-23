library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity switchLED is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end switchLED;

architecture Behavioral of switchLED is

begin

led <= sw;

end Behavioral;
