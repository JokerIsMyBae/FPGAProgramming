library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_decoder_3to8 is
end TB_decoder_3to8;

architecture Behavioral of TB_decoder_3to8 is

component decoder_3to8
    port ( a : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

    signal a : STD_LOGIC_VECTOR (2 downto 0);
    signal y : STD_LOGIC_VECTOR (7 downto 0);

begin

decoder : decoder_3to8
port map (a => a, 
          y => y
);

process
begin
    for i in 0 to 7 loop
        a <= std_logic_vector(to_unsigned(i, 3));
        wait for 15ns;
    end loop;
end process;
end Behavioral;
