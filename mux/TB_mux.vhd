library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_mux is
end TB_mux;

architecture Behavioral of TB_mux is

component mux is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end component;

    signal d : STD_LOGIC_VECTOR (3 downto 0);
    signal a : STD_LOGIC_VECTOR (1 downto 0);
    signal z : STD_LOGIC;
    
begin

comp: mux
port map (
    d => d,
    a => a,
    z => z
);

process
begin
    for i in 0 to 3 loop
        a <= std_logic_vector(to_unsigned(i,2));
        d <= "0000";
        wait for 15ns;
        d <= "0001";
        wait for 15ns;
        d <= "0010";
        wait for 15ns;
        d <= "0100";
        wait for 15ns;
        d <= "1000";
        wait for 15ns;
    end loop;
end process;

end Behavioral;
