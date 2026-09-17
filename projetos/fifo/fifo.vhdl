library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo is
	port (
		clk      : in  std_logic;
		reset    : in  std_logic;
		enable   : in  std_logic;
		data_in  : in  std_logic;
		data_out : out std_logic
	);
end entity fifo;

architecture rtl of fifo is
	signal buffer_s : std_logic_vector(3 downto 0) := (others => '0');
begin

    process(clk, reset)
    begin
        if reset = '1' then
            buffer_s <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                buffer_s(0) <= data_in;
                buffer_s(1) <= buffer_s(0);
                buffer_s(2) <= buffer_s(1);
                buffer_s(3) <= buffer_s(2);
            end if;
        end if;
    end process;

    data_out <= std_logic(buffer_s(3));
end architecture rtl;
