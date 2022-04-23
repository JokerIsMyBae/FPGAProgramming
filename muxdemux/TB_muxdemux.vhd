library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_muxdemux is
end TB_muxdemux;

architecture Behavioral of TB_muxdemux is

component muxdemux is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

    signal d : STD_LOGIC_VECTOR (3 downto 0);
    signal a : STD_LOGIC_VECTOR (1 downto 0);
    signal z : STD_LOGIC_VECTOR (3 downto 0);
    
begin

comp: muxdemux
port map (
    d => d,
    a => a,
    z => z
);

process
begin
    for i in 0 to 15 loop
        d <= std_logic_vector(to_unsigned(i,4));
        a <= std_logic_vector(to_unsigned(i,2));
        a <= "00";
        wait for 15ns;
        a <= "01";
        wait for 15ns;
        a <= "10";
        wait for 15ns;
        a <= "11";
        wait for 15ns;
    end loop;
end process;

end Behavioral;
