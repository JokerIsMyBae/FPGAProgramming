library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mult4bit is
  Port (A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        M : out STD_LOGIC_VECTOR(7 downto 0)
        );
end mult4bit;

architecture Behavioral of mult4bit is

begin

    M <= std_logic_vector(to_unsigned(to_integer(unsigned(A))*to_integer(unsigned(B)),8));

end Behavioral;
