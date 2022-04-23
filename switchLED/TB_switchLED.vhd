library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_switchLED is
end TB_switchLED;

architecture Behavioral of TB_switchLED is

component switchLED is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

    signal sw : STD_LOGIC_VECTOR (3 downto 0);
    signal led : STD_LOGIC_VECTOR (3 downto 0);

begin

comp: switchled
port map (
    sw => sw,
    led => led
);

process
begin
    for i in 0 to 15 loop
        sw <= std_logic_vector(to_unsigned(i,4));
        wait for 15ns;
        sw <= (i => '1', others => '0');
    end loop;
end process;
end Behavioral;
