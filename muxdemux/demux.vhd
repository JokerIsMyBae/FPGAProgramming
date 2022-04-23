library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity demux is
    Port ( y : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end demux;

architecture Behavioral of demux is

begin

demux: process(y,a)
begin
    case (a) is
      when "00" =>
        z <= (0 => y, others => '0');
      when "01" =>
        z <= (1 => y, others => '0');
      when "10" =>
        z <= (2 => y, others => '0');
      when "11" =>
        z <= (3 => y, others => '0');
      when others =>
        z <= (others => '0');
   end case;
end process;

end Behavioral;
