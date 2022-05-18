library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity TB_SR4bit is
end TB_SR4bit;

architecture Behavioral of TB_SR4bit is

component SR4bit
    Port (clk : in STD_LOGIC;
          d : in STD_LOGIC;
          clr : in STD_LOGIC;
          q : out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

    constant clk_period : time := 10ns;
    
    signal clk : STD_LOGIC;
    signal d : STD_LOGIC;
    signal clr : STD_LOGIC;
    signal q : STD_LOGIC_VECTOR(3 downto 0);
    
begin

shift_reg : SR4bit
port map(clk => clk,
         d => d,
         clr => clr,
         q => q
);

clk_process : process
begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process;

data : process
begin
    d <= '0';
    wait for 15ns;
    d <= '1'; 
    wait for 15ns;
end process;

clear : process
begin
    clr <= '0';
    wait for 72ns;
    clr <= '1';
    wait for 17ns;
end process;

end Behavioral;
