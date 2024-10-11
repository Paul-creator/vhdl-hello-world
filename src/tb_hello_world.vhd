library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_hello_world is
end tb_hello_world;

architecture Behavioral of tb_hello_world is
    -- Component Declaration
    component hello_world
        Port (
            clk : in STD_LOGIC;
            led : out STD_LOGIC
        );
    end component;

    -- Signals for Simulation
    signal clk : STD_LOGIC := '0';
    signal led : STD_LOGIC;

begin
    -- Instantiate the Design Under Test (DUT)
    DUT: hello_world Port Map (
        clk => clk,
        led => led
    );

    -- Clock Generation Process
    clk_process : process
    begin
        while True loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Monitor signal values during simulation
    monitor_process : process
    begin
        while True loop
            wait for 10 ns;
            assert False report "Time: " & TIME'image(NOW) & " | clk: " & STD_LOGIC'image(clk) & " | led: " & STD_LOGIC'image(led);
        end loop;
    end process;

    -- Simulation End Condition
    end_simulation : process
    begin
        wait for 100 ns; -- Run simulation for 100 ns
        assert False report "Simulation Ended" severity Note;
        wait;
    end process;
end Behavioral;
