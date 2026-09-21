library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    generic (
        WIDTH : integer := 4
    );
    port (
        clk    : in std_logic;
        reset  : in std_logic;
        enable : in std_logic;
        count  : out std_logic_vector(3 downto 0)
    );
end entity counter;

architecture rtl of counter is
    signal count_s : std_logic_vector(3 downto 0) := (others => '0');
begin

    process(clk, reset)
    begin
        if reset = '1' then
            count_s <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                count_s <= std_logic_vector(unsigned(count_s) + 1);
            end if;
        end if;
    end process;

    count <= count_s;

end architecture rtl;
