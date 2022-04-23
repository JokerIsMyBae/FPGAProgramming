library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end mux;

architecture Behavioral of mux is

begin

mux: process (d,a)
begin
   case (a) is
      when "00" =>
        z <= d(0);
      when "01" =>
        z <= d(1);
      when "10" =>
        z <= d(2);
      when "11" =>
        z <= d(3);
      when others =>
        z <= d(0);
   end case;
end process;

end Behavioral;
