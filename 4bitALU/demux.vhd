library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux is
    Port ( y : in STD_LOGIC_VECTOR(3 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z0 : out STD_LOGIC_VECTOR (3 downto 0);
           z1 : out STD_LOGIC_VECTOR (3 downto 0);
           z2 : out STD_LOGIC_VECTOR (3 downto 0));
end demux;

architecture Behavioral of demux is

begin

demux: process(y,a)
begin
    case (a) is
      when "00" =>
        z0 <= y;
        z1 <= "0000";
        z2 <= "0000";
      when "01" =>
        z0 <= "0000";
        z1 <= y;
        z2 <= "0000";
      when "10" =>
        z0 <= "0000";
        z1 <= "0000";
        z2 <= y;
      when others =>
        z0 <= "0000";
        z1 <= "0000";
        z2 <= "0000";
   end case;
end process;

end Behavioral;
