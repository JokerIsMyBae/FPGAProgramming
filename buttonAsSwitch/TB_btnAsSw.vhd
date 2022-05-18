library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;

entity TB_btnAsSw is
end TB_btnAsSw;

architecture Behavioral of TB_btnAsSw is

component btnAsSw
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           rst : in STD_LOGIC;
           led : out STD_LOGIC);
end component;

    signal clk : STD_LOGIC;
    signal btn : STD_LOGIC;
    signal rst : STD_LOGIC;
    signal led : STD_LOGIC;

begin

FSM : btnAsSw
port map(clk => clk,
         btn => btn,
         rst => rst,
         led => led);
         
    rst <= '0';
         
clock : process
begin
    clk <= '0';
    wait for 10ns;
    clk <= '1';
    wait for 10ns;
end process;

button : process
begin
    btn <= '0';
    wait for 12ns;
    btn <= '1';
    wait for 12 ns;
end process;

end Behavioral;
