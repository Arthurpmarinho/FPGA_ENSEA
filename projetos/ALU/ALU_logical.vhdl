library ieee;
use ieee.std_logic_1164.all;

entity ALU_logical is
    generic (
        bus_size : integer := 8
    );
    port (
        in0 : in std_logic_vector(bus_size - 1 downto 0);
        in1 : in std_logic_vector(bus_size - 1 downto 0);
        sel : in std_logic_vector(1 downto 0);
        result : out std_logic_vector(bus_size - 1 downto 0)
    );
end entity ALU_logical;

architecture rtl of ALU_logical is
begin

        result <= in0 AND in1 when sel = "00"
                else in0 OR in1 when sel = "01"
                else in0 XOR in1 when sel = "10"
                else NOT(in0) when sel = "11"
                else (others => 'U');
end architecture rtl;
