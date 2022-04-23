library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxdemux is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end muxdemux;

architecture Behavioral of muxdemux is

    signal wire : STD_LOGIC;

component mux
port (
    d : in STD_LOGIC_VECTOR (3 downto 0);
    a : in STD_LOGIC_VECTOR (1 downto 0);
    z : out STD_LOGIC
);
end component;

component demux
Port ( 
    y : in STD_LOGIC;
    a : in STD_LOGIC_VECTOR (1 downto 0);
    z : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;

begin

mux41: mux
port map (
    d => d,
    a => a,
    z => wire);
    
demux14: demux
port map (
    y => wire,
    a => a,
    z => z);
    
end Behavioral;
