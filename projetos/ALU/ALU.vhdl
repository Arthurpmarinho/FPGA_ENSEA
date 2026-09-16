library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
    generic (
        bus_size : integer := 8
    );
    port (
        sel : in std_logic_vector(2 downto 0);
        led : out std_logic_vector(bus_size - 1 downto 0);
        in0 : in std_logic_vector(bus_size - 1 downto 0);
        in1 : in std_logic_vector(bus_size - 1 downto 0)
    );
end entity ALU;

architecture rtl of ALU is
    signal result_logical : std_logic_vector(bus_size - 1 downto 0);
    signal result_arithmetic : std_logic_vector(bus_size - 1 downto 0);
begin

    uut_logical: entity work.ALU_LOGICAL
        generic map ( bus_size => bus_size)
        port map (
            in0 => in0,
            in1 => in1,
            sel => sel(1 downto 0),
            result => result_logical
        );

    uut_arithmetic: entity work.ALU_ARITHMETIC
        generic map ( bus_size => bus_size)
        port map (
            in0 => in0,
            in1 => in1,
            sel => sel(1 downto 0),
            result => result_arithmetic
        );

    led <=  result_logical when sel(2) = '0'
            else result_arithmetic when sel(2) = '1'
            else (others => 'U');

end architecture rtl;