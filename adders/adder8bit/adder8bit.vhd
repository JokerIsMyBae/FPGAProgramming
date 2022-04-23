library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder8bit is
  Port (A  : in STD_LOGIC_VECTOR (7 downto 0);
        B  : in STD_LOGIC_VECTOR (7 downto 0);
        Ci : in STD_LOGIC; --Ci wordt bediend met center button (BTNC)
        S  : out STD_LOGIC_VECTOR (7 downto 0);
        Co : out STD_LOGIC
  );
end adder8bit;

architecture Behavioral of adder8bit is
    
    signal carry : STD_LOGIC_VECTOR(8 downto 0);
    
begin

    
process(A,B,Ci,carry)
begin

    carry <= (0 => Ci, others => '0');

    for i in 0 to 7 loop
        S(i) <= (A(i) xor B(i)) xor carry(i);
        carry(i+1) <= (A(i) and B(i)) or ((A(i) xor B(i)) and carry(i));
    end loop;
    
    Co <= carry(8);
    
end process;
end Behavioral;
