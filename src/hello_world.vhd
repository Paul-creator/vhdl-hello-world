library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hello_world is
    Port (
        clk : in STD_LOGIC;
        led : out STD_LOGIC  -- 'out' is now fine since we will use an internal signal
    );
end hello_world;

architecture Behavioral of hello_world is
    signal led_internal : STD_LOGIC := '0';  -- Internal signal for LED state
begin
    process(clk)
    begin
        if rising_edge(clk) then
            led_internal <= not led_internal;  -- Toggle the internal signal
        end if;
    end process;

    led <= led_internal;  -- Assign the internal signal to the output port
end Behavioral;
