library ieee;
use ieee.std_logic_1164.all;

entity ffd_tb is
end entity ffd_tb;

architecture sim of ffd_tb is
    signal clk      : std_logic := '0';
    signal d_s      : std_logic := '0';
    signal q_s      : std_logic;
    signal enable_s : std_logic := '0';
    signal reset_s  : std_logic := '1';
begin
	uut: entity work.ffd
		port map (
			clk    => clk,
			d      => d_s,
			q      => q_s,
			enable => enable_s,
			reset  => reset_s
		);

    process
begin
    clk <= not clk;
    wait for 5 ns;
end process;
    

    process
    begin
        reset_s <= '1';
        wait for 10 ns;
        reset_s <= '0';
        wait for 10 ns;
        enable_s <= '1';
        d_s <= '0';
        wait for 10 ns;
        d_s <= '1';
        wait for 10 ns;
        enable_s <= '0';
        d_s <= '0';
        wait for 10 ns;
        enable_s <= '1';
        d_s <= '1';
        wait for 10 ns;
        reset_s <= '1';
        enable_s <= '0';
        wait for 10 ns;
        reset_s <= '0';
        wait for 10 ns;
        d_s <= '1';
        wait for 10 ns;
        wait;
    end process;
end architecture sim;
