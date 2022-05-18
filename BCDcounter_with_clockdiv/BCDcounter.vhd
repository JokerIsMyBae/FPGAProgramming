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
    
    signal sigq : unsigned(3 downto 0) := "0000"; 

begin

process(clk,clr,en)
begin
    if clr = '1' then
        sigq <= "0000";
    elsif rising_edge(clk) and en = '1' then
        if sigq = 9 then
            sigq <= "0000";
            co <= '1';
        else
            sigq <= sigq + 1;
            co <= '0';
        end if;
    end if;
end process;

    q <= std_logic_vector(sigq);

end Behavioral;
