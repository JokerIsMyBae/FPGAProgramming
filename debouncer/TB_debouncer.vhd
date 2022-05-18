library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_debouncer is
end TB_debouncer;

architecture Behavioral of TB_debouncer is

component debouncer
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           sw : in STD_LOGIC;
           led : out STD_LOGIC);
end component;

    signal clk : STD_LOGIC;
    signal clr : STD_LOGIC;
    signal sw : STD_LOGIC;
    signal led : STD_LOGIC;

begin

debounce : debouncer
    port map(clk => clk,
             clr => clr,
             sw => sw,
             led => led);

clock : process
begin
    clk <= '0';
    wait for 10ns;
    clk <= '1';
    wait for 10ns;
end process;

clear : process
begin
    clr <= '0';
    wait for 343ns;
    clr <= '1';
    wait for 97ns;
end process;

data : process
begin
    sw <= '0';
    wait for 100ns;
    sw <= '1';
    wait for 100ns;
end process;

end Behavioral;
