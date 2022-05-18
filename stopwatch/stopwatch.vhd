library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch is
    Port ( clk : in STD_LOGIC;
           start : in STD_LOGIC;
           rst : in STD_LOGIC;
           cath : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end stopwatch;

architecture Behavioral of stopwatch is

component clockdivider
    Port ( clk : in STD_LOGIC;
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

component mux
    Port ( d0 : in STD_LOGIC_VECTOR (3 downto 0);
           d1 : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC;
           z : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component BCDto7segm
    Port ( x : in std_logic_vector(3 downto 0);
           g_to_a : out std_logic_vector(6 downto 0));
end component;

    signal countOnes_out : STD_LOGIC_VECTOR(3 downto 0);
    signal countTens_out : STD_LOGIC_VECTOR(3 downto 0);
    signal en_tens : STD_LOGIC;
    signal clk1Hz : STD_LOGIC;
    signal clk100Hz : STD_LOGIC;
    signal Bin : STD_LOGIC_VECTOR(3 downto 0);
    
begin

divider1Hz : clockdivider
port map(clk => clk,
         div => "00",
         slowclk => clk1Hz);
         
divider100Hz : clockdivider
port map(clk => clk,
         div => "11",
         slowclk => clk100Hz);

countOnes : BCDcounter
port map(clk => clk1Hz,
         en => start,
         clr => rst,
         q => countOnes_out,
         co => en_tens);

countTens : BCDcounter
port map(clk => clk1Hz,
         en => en_tens,
         clr => rst,
         q => countTens_out,
         co => open);
         
quadmux : mux
port map(d0 => countOnes_out,
         d1 => countTens_out,
         a => clk100Hz,
         z => Bin);
         
segm7 : BCDto7segm
port map(x => Bin,
         g_to_a => cath);
    
    an(3 downto 2) <= "11";     
    an(1) <= not(clk100Hz);
    an(0) <= clk100Hz; 

end Behavioral;
