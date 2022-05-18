library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debouncer is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           sw : in STD_LOGIC;
           led : out STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is

component SR4bit
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR(3 downto 0));
end component;    

    signal q : STD_LOGIC_VECTOR(3 downto 0);
    
begin

shiftreg : SR4bit
    port map(clk => clk,
             d => sw,
             clr => clr,
             q => q);

process(q)
begin
    if q = "1111" or q = "0000" then
        led <= '1';
    else
        led <= '0';
    end if;
end process;

end Behavioral;
