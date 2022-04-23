library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_BCDto7segm is
end TB_BCDto7segm;

architecture Behavioral of TB_BCDto7segm is

component BCDto7segm
Port (x : in std_logic_vector(3 downto 0);
          an_in : in std_logic_vector(3 downto 0);
          g_to_a : out std_logic_vector(6 downto 0);
          an : out std_logic_vector(3 downto 0));
end component;

    signal x : std_logic_vector(3 downto 0);
    signal an_in : std_logic_vector(3 downto 0);
    signal g_to_a : std_logic_vector(6 downto 0);
    signal an : std_logic_vector(3 downto 0);
    
begin

comp1 : BCDto7segm
port map (x => x,
          an_in => an_in,
          g_to_a => g_to_a,
          an => an
);

process
begin
    for i in 0 to 9 loop
        x <= std_logic_vector(to_unsigned(i, 4));
        wait for 15ns;
    end loop;
    an_in <= "0001";
    wait for 15ns;
    an_in <= "0010";
    wait for 15ns;
    an_in <= "0100";
    wait for 15ns;
    an_in <= "1000";
    wait for 15ns;
end process;
end Behavioral;
