library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sub4bit is
  Port (A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0); 
        Ci : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR(3 downto 0);
        Sign : out STD_LOGIC --minteken bij negatieve uitkomst
        );
end sub4bit;

architecture Behavioral of sub4bit is

component adder4bit
  Port (A  : in STD_LOGIC_VECTOR (3 downto 0);
        B  : in STD_LOGIC_VECTOR (3 downto 0);
        Ci : in STD_LOGIC;
        S  : out STD_LOGIC_VECTOR (3 downto 0);
        Co : out STD_LOGIC
  );
end component;

    signal sigB : STD_LOGIC_VECTOR(3 downto 0);
    signal sigS : STD_LOGIC_VECTOR(3 downto 0);
    signal sigCo : STD_LOGIC;
     
begin

adder : adder4bit
port map(A => A,
         B => sigB,
         Ci => Ci,
         S => sigS,
         Co => sigCo
);
    
process(A,B,Ci,sigS)
begin
    sigB <= std_logic_vector(unsigned(not(B))+1); --two's complement
    if B > A then
        S <= std_logic_vector(unsigned(not(sigS))+1);
        Sign <= '1';
    else
        S <= sigS;
        Sign <= '0';
    end if;
end process;

end Behavioral;
