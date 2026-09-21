library ieee;
use ieee.std_logic_1164.all;

entity counter_tb is
end entity counter_tb;

architecture sim of counter_tb is
	signal clk    : std_logic := '0';
	signal reset  : std_logic := '1';
	signal enable : std_logic := '0';
	signal count  : std_logic_vector(3 downto 0);
begin
	uut: entity work.counter
		generic map (
			WIDTH => 4
		)
		port map (
			clk    => clk,
			reset  => reset,
			enable => enable,
			count  => count
		);

	clk_process: process
	begin
			clk <= not clk;
            wait for 5 ns;
	end process;

	stim_process: process
	begin
		wait for 10 ns;
		reset <= '0';
		enable <= '1';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait for 1 ns;

		assert count = "0100"
			report "Erro: contador nao chegou a 4"
			severity error;

		enable <= '0';
		wait until rising_edge(clk);
		wait for 1 ns;

		assert count = "0100"
			report "Erro: contador mudou com enable desativado"
			severity error;

		reset <= '1';
		wait for 1 ns;

		assert count = "0000"
			report "Erro: reset nao zerou o contador"
			severity error;

		wait;
	end process;
end architecture sim;
