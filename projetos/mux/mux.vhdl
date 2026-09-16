library ieee;
use ieee.std_logic_1164.all;

entity mux is
    generic (
        bus_size : integer := 8
    );
    port (
        sel : in std_logic;
        in0 : in std_logic_vector(bus_size - 1 downto 0);
        in1 : in std_logic_vector(bus_size - 1 downto 0);
        led : out std_logic_vector(bus_size - 1 downto 0)
    );
end entity mux;

architecture rtl of mux is
begin
    led <=  in0 when sel = '0'
            else in1 when sel = '1'
            else (others => 'U');
end architecture rtl;