library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_adder4bit is
end TB_adder4bit;

architecture Behavioral of TB_adder4bit is

component adder4bit
    port (A  : in STD_LOGIC_VECTOR (3 downto 0);
          B  : in STD_LOGIC_VECTOR (3 downto 0);
          Ci : in STD_LOGIC;
          S  : out STD_LOGIC_VECTOR (3 downto 0);
          Co : out STD_LOGIC
  );
end component;

    signal A : STD_LOGIC_VECTOR (3 downto 0);
    signal B : STD_LOGIC_VECTOR (3 downto 0);
    signal Ci : STD_LOGIC;
    signal S : STD_LOGIC_VECTOR (3 downto 0);
    signal Co : STD_LOGIC;
    
begin

add4bit : adder4bit
port map (A => A,
          B => B,
          Ci => Ci,
          S => S,
          Co => Co);

process
begin

    A <= "0000";
    B <= "0000";
    Ci <= '0';

    for i in 0 to 15 loop
        A <= std_logic_vector(to_unsigned(i,4));
        wait for 15ns;
        B <= std_logic_vector(to_unsigned(i,4));
        wait for 15ns;
    end loop;
    
    A <= "0000";
    B <= "0000";
    Ci <= '1';
    
    for i in 0 to 15 loop
        A <= std_logic_vector(to_unsigned(i,4));
        wait for 15ns;
        B <= std_logic_vector(to_unsigned(i,4));
        wait for 15ns;
    end loop;
    
end process;
end Behavioral;
