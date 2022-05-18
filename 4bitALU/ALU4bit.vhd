library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU4bit is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (3 downto 0);
           load : in STD_LOGIC;
           instruction : in STD_LOGIC_VECTOR (1 downto 0);
           data_out : out STD_LOGIC_VECTOR(3 downto 0);
           regdata_out : out STD_LOGIC_VECTOR(3 downto 0);
           cath : out STD_LOGIC_VECTOR(6 downto 0);
           an : out STD_LOGIC_VECTOR(3 downto 0));
end ALU4bit;

architecture Behavioral of ALU4bit is

component reg4bit
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR(3 downto 0);
           ld : in STD_LOGIC;
           clr : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component mux
    Port ( d0 : in STD_LOGIC_VECTOR (3 downto 0);
           d1 : in STD_LOGIC_VECTOR (3 downto 0);
           d2 : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component demux
    Port ( y : in STD_LOGIC_VECTOR(3 downto 0);
           a : in STD_LOGIC_VECTOR (1 downto 0);
           z0 : out STD_LOGIC_VECTOR (3 downto 0);
           z1 : out STD_LOGIC_VECTOR (3 downto 0);
           z2 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component adder4bit
    Port ( A  : in STD_LOGIC_VECTOR (3 downto 0);
           B  : in STD_LOGIC_VECTOR (3 downto 0);
           Ci : in STD_LOGIC;
           S  : out STD_LOGIC_VECTOR (3 downto 0);
           Co : out STD_LOGIC);
end component;

component sub4bit
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0); 
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 downto 0);
           Sign : out STD_LOGIC);
end component;

component mult4bit
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           M : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component BCDto7segm
    Port ( x : in std_logic_vector(3 downto 0);
           g_to_a : out std_logic_vector(6 downto 0);
           an : out std_logic_vector(3 downto 0));
end component;

    signal reg_out : STD_LOGIC_VECTOR(3 downto 0);
    signal z0_data : STD_LOGIC_VECTOR(3 downto 0);
    signal z1_data : STD_LOGIC_VECTOR(3 downto 0);
    signal z2_data : STD_LOGIC_VECTOR(3 downto 0);
    signal z0_reg : STD_LOGIC_VECTOR(3 downto 0);
    signal z1_reg : STD_LOGIC_VECTOR(3 downto 0);
    signal z2_reg : STD_LOGIC_VECTOR(3 downto 0);
    signal sum : STD_LOGIC_VECTOR(3 downto 0);
    signal diff : STD_LOGIC_VECTOR(3 downto 0);
    signal product : STD_LOGIC_VECTOR(7 downto 0);
    signal mux_out : STD_LOGIC_VECTOR(3 downto 0);
    
begin

reg : reg4bit
port map(clk => clk,
         d => data,
         ld => load,
         clr => clr,
         q => reg_out);

demux_data : demux
port map(y => data,
         a => instruction,
         z0 => z0_data,
         z1 => z1_data,
         z2 => z2_data);
 
demux_reg : demux
port map(y => reg_out,
         a => instruction,
         z0 => z0_reg,
         z1 => z1_reg,
         z2 => z2_reg);

adderALU : adder4bit
port map(A => z0_data,
         B => z0_reg,
         Ci => '0',
         S => sum,
         Co => open);

subtractor : sub4bit
port map(A => z1_data,
         B => z1_reg,
         Ci => '0',
         S => diff,
         Sign => open);
         
multiplier : mult4bit
port map(A => z2_data,
         B => z2_reg,
         M => product);

multiplexer : mux
port map(d0 => sum,
         d1 => diff,
         d2 => product(3 downto 0),
         a => instruction,
         z => mux_out);
         
seg7 : BCDto7segm
port map(x => mux_out,
         g_to_a => cath,
         an => an);

    data_out <= data;
    regdata_out <= reg_out;
         
end Behavioral;
