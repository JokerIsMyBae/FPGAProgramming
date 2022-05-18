library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_reg4bit is
end TB_reg4bit;

architecture Behavioral of TB_reg4bit is

component reg4bit
    port(clk : in STD_LOGIC;
         d : in STD_LOGIC_VECTOR(3 downto 0);
         clr : in STD_LOGIC;
         ld : in STD_LOGIC;
         q : out STD_LOGIC_VECTOR(3 downto 0)
);
end component;

    constant clk_period : time := 10ns;
    
    signal clk : STD_LOGIC;
    signal d : STD_LOGIC_VECTOR(3 downto 0);
    signal clr : STD_LOGIC;
    signal ld : STD_LOGIC;
    signal q : STD_LOGIC_VECTOR(3 downto 0);
    
begin

fourBitRegister : reg4bit
port map(clk => clk,
         d => d,
         clr => clr,
         ld => ld,
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
    for i in 0 to 15 loop
        d <= std_logic_vector(to_unsigned(i,4));
        wait for 15ns;
    end loop;
end process;

load : process
begin
    ld <= '0';
    wait for 45ns;
    ld <= '1';
    wait for 90ns;
end process;

clear : process
begin
    clr <= '0';
    wait for 72ns;
    clr <= '1';
    wait for 17ns;
end process;

end Behavioral;
