library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder4bit is
  Port (A  : in STD_LOGIC_VECTOR (3 downto 0);
        B  : in STD_LOGIC_VECTOR (3 downto 0);
        Ci : in STD_LOGIC;
        S  : out STD_LOGIC_VECTOR (3 downto 0);
        Co : out STD_LOGIC
  );
end adder4bit;

architecture Behavioral of adder4bit is
    
    signal carry : STD_LOGIC_VECTOR(4 downto 0);
    
begin

    
process(A,B,Ci,carry)
begin
    
    carry <= (0 => Ci, others => '0');

    for i in 0 to 3 loop
        S(i) <= (A(i) xor B(i)) xor carry(i);
        carry(i+1) <= (A(i) and B(i)) or ((A(i) xor B(i)) and carry(i));
    end loop;
    
    Co <= carry(4);
    
end process;
end Behavioral;