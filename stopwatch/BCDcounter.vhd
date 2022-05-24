library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCDcounter is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0);
           co : out STD_LOGIC);
end BCDcounter;

architecture Behavioral of BCDcounter is
    
    signal sigq : unsigned(3 downto 0) := "0000"; --unsigned om bewerkingen zoals + 1 te kunnen uitvoeren

begin

process(clk,clr,en) --clock, asynchrone reset en enable in sensitivity list
begin
    if clr = '1' then --asynchrone reset
        sigq <= "0000";
    elsif rising_edge(clk) and en = '1' then --synchroon tellen tot 9 => terug nr 0
        if sigq = 9 then
            sigq <= "0000";
            co <= '0';
        elsif sigq = 8 then --For tens to count 1 as ones go to zero, carry out needs to be '1' one flank before ones go to zero
            sigq <= sigq + 1;
            co <= '1';
        else
            sigq <= sigq + 1;
            co <= '0';
        end if;
    end if;
end process;

    q <= std_logic_vector(sigq); --stuur teller naar output, zet unsigned om naar std_logic_vector

end Behavioral;
