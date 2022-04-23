library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_adder8bit is
end TB_adder8bit;

architecture Behavioral of TB_adder8bit is

component adder8bit
    port (A  : in STD_LOGIC_VECTOR (7 downto 0);
          B  : in STD_LOGIC_VECTOR (7 downto 0);
          Ci : in STD_LOGIC; 
          S  : out STD_LOGIC_VECTOR (7 downto 0);
          Co : out STD_LOGIC
  );
end component;

    signal A : STD_LOGIC_VECTOR (7 downto 0);
    signal B : STD_LOGIC_VECTOR (7 downto 0);
    signal Ci : STD_LOGIC;
    signal S : STD_LOGIC_VECTOR (7 downto 0);
    signal Co : STD_LOGIC;
    
begin

add8bit : adder8bit
port map (A => A,
          B => B,
          Ci => Ci,
          S => S,
          Co => Co);

process
begin

    A <= "00000000";
    B <= "00000000";
    Ci <= '0';

    for i in 0 to 255 loop
        A <= std_logic_vector(to_unsigned(i,8));
        wait for 15ns;
        B <= std_logic_vector(to_unsigned(i,8));
        wait for 15ns;
    end loop;

    A <= "00000000";
    B <= "00000000";
    Ci <= '1';
    
    for i in 0 to 255 loop
        A <= std_logic_vector(to_unsigned(i,8));
        wait for 15ns;
        B <= std_logic_vector(to_unsigned(i,8));
        wait for 15ns;
    end loop;
    
end process;
end Behavioral;
