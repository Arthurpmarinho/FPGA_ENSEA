library ieee;
use ieee.std_logic_1164.all;

entity fifo_tb is
end entity fifo_tb;

architecture sim of fifo_tb is
	signal clk      : std_logic := '0';
	signal reset    : std_logic := '1';
	signal enable   : std_logic := '0';
	signal data_in  : std_logic := '0';
	signal data_out : std_logic;
begin
	uut: entity work.fifo
		port map (
			clk      => clk,
			reset    => reset,
			enable   => enable,
			data_in  => data_in,
			data_out => data_out
		);

	process
	begin
		clk <= not clk;
		wait for 5 ns;
	end process;

	process
	begin
		reset <= '1';
		wait for 10 ns;

		reset <= '0';
		enable <= '1';
		data_in <= '1';
		wait for 40 ns;

		enable <= '0';
		data_in <= '0';
		wait for 10 ns;

		reset <= '1';
		wait for 10 ns;

		reset <= '0';
		wait;
	end process;

end architecture sim;
