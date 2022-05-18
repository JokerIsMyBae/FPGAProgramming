library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity TB_BCDcounter is
end TB_BCDcounter;

architecture Behavioral of TB_BCDcounter is

component BCDcounter
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0);
           co : out STD_LOGIC);
end component;

    constant clk_period : time := 10ns;

    signal clk : STD_LOGIC;
    signal en : STD_LOGIC;
    signal clr : STD_LOGIC;
    signal q : STD_LOGIC_VECTOR(3 downto 0);
    signal co : STD_LOGIC;

begin

counter : BCDcounter
port map(clk => clk,
         en => en,
         clr => clr,
         q => q,
         co => co
);

clk_process : process
begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process;

enable : process
begin
    en <= '0';
    wait for 15ns;
    en <= '1'; 
    wait for 105ns;
end process;

clear : process
begin
    clr <= '0';
    wait for 127ns;
    clr <= '1';
    wait for 17ns;
end process;

end Behavioral;
