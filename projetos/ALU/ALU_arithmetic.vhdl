library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_arithmetic is
    generic (
        bus_size : integer := 8
    );
    port (
        in0 : in std_logic_vector(bus_size - 1 downto 0);
        in1 : in std_logic_vector(bus_size - 1 downto 0);
        sel : in std_logic_vector(1 downto 0);
        result : out std_logic_vector(bus_size - 1 downto 0)
    );
end entity ALU_arithmetic;

architecture rtl of ALU_arithmetic is
begin
    result <= std_logic_vector(unsigned(in0) + unsigned(in1)) when sel = "00"
            else std_logic_vector(unsigned(in0) - unsigned(in1)) when sel = "01"
            else std_logic_vector(resize(unsigned(in0) * unsigned(in1), bus_size)) when sel = "10"
            else std_logic_vector(unsigned(in0) / unsigned(in1)) when sel = "11"
            else (others => 'U');
    
end architecture rtl;
