library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_mult4bit is
end TB_mult4bit;

architecture Behavioral of TB_mult4bit is

component mult4bit
  Port (A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        M : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;

    signal A : STD_LOGIC_VECTOR(3 downto 0);
    signal B : STD_LOGIC_VECTOR(3 downto 0);
    signal M : STD_LOGIC_VECTOR(7 downto 0);

begin

multiplier : mult4bit
port map(A => A,
         B => B,
         M => M
);

process
begin
    for i in 0 to 15 loop
        A <= std_logic_vector(to_unsigned(i,4));
        wait for 15ns;
        B <= std_logic_vector(to_unsigned(i,4));
        wait for 15ns;
    end loop;
end process;
end Behavioral;
