library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR4bit is
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR(3 downto 0));
end SR4bit;

architecture Behavioral of SR4bit is

    signal sigQ : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin

process(clk,clr)
begin
    if clr = '1' then
        sigQ <= "0000";
    elsif rising_edge(clk) then
        sigQ(0) <= d;
        sigQ(3 downto 1) <= sigQ(2 downto 0);
    end if;
end process;

    q <= sigQ;
    
end Behavioral;
