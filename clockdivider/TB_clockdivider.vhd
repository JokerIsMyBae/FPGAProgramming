library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_clockdivider is
end TB_clockdivider;

architecture Behavioral of TB_clockdivider is

component clockdivider
Port (clk : in STD_LOGIC;
      div : in STD_LOGIC_VECTOR(1 downto 0);
      slowclk : out STD_LOGIC);
end component;

    signal clk : STD_LOGIC;
    signal div : STD_LOGIC_VECTOR(1 downto 0);
    signal slowclk : STD_LOGIC;

begin

clkdiv : clockdivider
port map(clk => clk,
         div => div,
         slowclk => slowclk);

process
begin
    for i in 0 to 4 loop
        div <= std_logic_vector(to_unsigned(i,2));
        wait for 2000000us;
    end loop;
end process;

process
begin
    clk <= '0';
    wait for 10ns;
    clk <= '1';
    wait for 10ns;
end process;

end Behavioral;
