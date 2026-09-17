library ieee;
use ieee.std_logic_1164.all;

entity ffd is
	port (
		clk : in std_logic;
		d   : in std_logic;
		q   : out std_logic;
        enable : in std_logic;
        reset : in std_logic
	);
end entity ffd;
architecture rtl of ffd is
begin

    process(clk, reset)
    begin
        if reset = '1' then
            q <= '0';
        elsif rising_edge(clk) then
            if enable = '1' then
                q <= d;
            end if;
        end if;
    end process;

end architecture rtl;