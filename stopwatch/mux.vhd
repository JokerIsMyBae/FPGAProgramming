library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( d0 : in STD_LOGIC_VECTOR (3 downto 0);
           d1 : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC;
           z : out STD_LOGIC_VECTOR (3 downto 0));
end mux;

architecture Behavioral of mux is

begin

process (d0,d1,a)
begin
   case (a) is
      when '0' =>
        z <= d0;
      when '1' =>
        z <= d1;
       when others =>
        z <= "0000";
   end case;
end process;

end Behavioral;