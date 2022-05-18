library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg4bit is
  Port (clk : in STD_LOGIC;
        d : in STD_LOGIC_VECTOR(3 downto 0);
        ld : in STD_LOGIC;
        clr : in STD_LOGIC;
        q : out STD_LOGIC_VECTOR(3 downto 0)
       );
end reg4bit;

architecture Behavioral of reg4bit is

begin

process(clk,clr)
begin
    if clr = '1' then
        q <= "0000";
    elsif rising_edge(clk) and ld = '1' then
        q <= d;
    end if;
end process;

end Behavioral;
