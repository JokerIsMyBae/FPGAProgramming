library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0);
           co : out STD_LOGIC;
           div : in STD_LOGIC_VECTOR(1 downto 0));
end top;

architecture Behavioral of top is

component clockdivider
    Port (  clk : in STD_LOGIC;
            div : in STD_LOGIC_VECTOR(1 downto 0);
            slowclk : out STD_LOGIC);
end component;

component BCDcounter
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0);
           co : out STD_LOGIC);
end component;

    signal slowclk : STD_LOGIC;

begin

clkdiv : clockdivider
    port map(clk => clk,
             div => div,
             slowclk => slowclk);

BCDcount : BCDcounter
    port map(clk => slowclk,
             en => en,
             clr => clr,
             q => q,
             co => co);

end Behavioral;
