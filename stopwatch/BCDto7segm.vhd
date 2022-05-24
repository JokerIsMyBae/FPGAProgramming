library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCDto7segm is
    Port ( x : in std_logic_vector(3 downto 0);
           g_to_a : out std_logic_vector(6 downto 0));
end BCDto7segm;

architecture Behavioral of BCDto7segm is

type tSegm is array(0 to 9) of std_logic_vector(6 downto 0); --nieuwe type die array van std_logic_vectors bevat
    constant cSegm : tSegm := ("1000000", -- 0 --std_logic_vectors zijn de cijfers van 0 tot 9
                               "1111001", -- 1
                               "0100100", -- 2
                               "0110000", -- 3
                               "0011001", -- 4
                               "0010010", -- 5
                               "0000010", -- 6
                               "1111000", -- 7
                               "0000000", -- 8
                               "0010000"); -- 9

begin

process (x) --input in sensititvity list
begin
    if unsigned(x) < 10 then      		
        g_to_a <= cSegm(to_integer(unsigned(x))); --zet x (std_logic_vector) om naar int, om als index van cSegm te gebruiken
    else -- geef 'e' weer om te tonen dat er een error is, namelijk een getal groter dan 9
        g_to_a <= "0000110";
    end if;
end process;
end Behavioral;
