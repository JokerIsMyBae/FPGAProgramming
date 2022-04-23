library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_encoder8to3 is
end TB_encoder8to3;

architecture Behavioral of TB_encoder8to3 is

component encoder8to3
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC_VECTOR (2 downto 0);
           valid : out STD_LOGIC);
end component;

    signal x : STD_LOGIC_VECTOR (7 downto 0);
    signal y : STD_LOGIC_VECTOR (2 downto 0);
    signal valid : STD_LOGIC;
    
begin

encoder : encoder8to3
port map ( x => x,
           y => y, 
           valid => valid
);

process
begin
    for i in 0 to 7 loop
        x <= (i => '1', others => '0');
        wait for 15ns;
    end loop;
end process;
end Behavioral;
