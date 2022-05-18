library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity btnAsSw is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           rst : in STD_LOGIC;
           led : out STD_LOGIC);
end btnAsSw;

architecture Behavioral of btnAsSw is

    type state_type is (S1, S2, S3, S4);
    
    signal present_state : state_type := S1;
    signal next_state : state_type := S1;
    
begin

state_reg : process(clk, rst)
begin
    if rst = '1' then
        present_state <= S1;
    elsif rising_edge(clk) then 
        present_state <= next_state;
    end if;
end process;

ns_dec : process(present_state, btn)
begin
    case (present_state) is
      when S1 =>
         if btn = '1' then
            next_state <= S2;
         else
            next_state <= S1;
        end if;
      when S2 =>
         if btn = '0' then
            next_state <= S3;
         else
            next_state <= S2;
        end if;
      when S3 =>
         if btn = '1' then
            next_state <= S4;
         else
            next_state <= S3;
        end if;
      when S4 =>
         if btn = '0' then
            next_state <= S1;
         else
            next_state <= S4;
        end if;
      when others =>
         next_state <= S1;
   end case;
end process;

out_dec : process(present_state)
begin
    case (present_state) is
      when S1 | S4 =>
         led <= '0';
      when S2 | S3 =>
         led <= '1';
      when others =>
         led <= '0';
   end case;
end process;

end Behavioral;
