library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end entity mux_tb;

architecture sim of mux_tb is
    constant bus_size : integer := 8;

    signal sel : std_logic := '0';
    signal in0 : std_logic_vector(bus_size - 1 downto 0) := (others => '0');
    signal in1 : std_logic_vector(bus_size - 1 downto 0) := (others => '1');
    signal led : std_logic_vector(bus_size - 1 downto 0);
begin
    uut: entity work.mux
        generic map (
            bus_size => bus_size
        )
        port map (
            sel => sel,
            in0 => in0,
            in1 => in1,
            led => led
        );

    stim_proc: process
    begin
        in0 <= "10101010";
        in1 <= "01010101";

        sel <= '0';
        wait for 10 ns;
        assert led = in0
            report "Erro: quando sel = '0', led deveria receber in0"
            severity error;

        sel <= '1';
        wait for 10 ns;
        assert led = in1
            report "Erro: quando sel = '1', led deveria receber in1"
            severity error;

        wait;
    end process;
end architecture sim;
