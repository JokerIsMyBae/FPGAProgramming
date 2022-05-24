library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clockdivider is
    Port ( clk : in STD_LOGIC;
           div : in STD_LOGIC_VECTOR(1 downto 0);
           slowclk : out STD_LOGIC);
end clockdivider;

architecture Behavioral of clockdivider is

    signal base : integer range 0 to 50000000 := 50000000;
    signal i : integer range 0 to 50000000 := 0;
    signal sigClk : STD_LOGIC := '0';

begin

process(div) --input in sensitivity list
begin
    case (div) is --selecteer upper limit van teller, om van frequentie te veranderen
      when "00" =>
         base <= 50000000;
      when "01" =>
         base <= 25000000;
      when "10" =>
         base <= 5000000;
      when "11" =>
         base <= 500000;
      when others =>
         base <= 50000000;
   end case;
end process;

process(clk) --sequentieel proces, dus enkel clock (en asynchrone signalen) in sens. list
begin
    if rising_edge(clk) then --synchrone teller
        i <= i+1;
        if (i = base) then --bij upper limit inverteren we de tragere clock en beginnen we terug van 0 te tellen
            i <= 0;
            sigClk <= not sigClk;
        end if;
    end if;
end process;

    slowclk <= sigClk; --vertraagde clock naar output
    
end Behavioral;
