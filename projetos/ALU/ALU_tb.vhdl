library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_tb is
end entity ALU_tb;

architecture sim of ALU_tb is
    constant bus_size : integer := 8;

    signal sel : std_logic_vector(2 downto 0) := (others => '0');
    signal in0 : std_logic_vector(bus_size - 1 downto 0) := (others => '0');
    signal in1 : std_logic_vector(bus_size - 1 downto 0) := (others => '0');
    signal led : std_logic_vector(bus_size - 1 downto 0);
begin
    uut: entity work.ALU
        generic map (
            bus_size => bus_size
        )
        port map (
            sel => sel,
            led => led,
            in0 => in0,
            in1 => in1
        );

    stim_proc: process
    begin
        -- Caso 1: lógica - AND
        in0 <= std_logic_vector(to_unsigned(10, bus_size));
        in1 <= std_logic_vector(to_unsigned(12, bus_size));
        sel <= "000";
        wait for 10 ns;
        assert led = (in0 and in1)
            report "Erro no caso AND"
            severity error;

        -- Caso 2: lógica - OR
        sel <= "001";
        wait for 10 ns;
        assert led = (in0 or in1)
            report "Erro no caso OR"
            severity error;

        -- Caso 3: lógica - XOR
        sel <= "010";
        wait for 10 ns;
        assert led = (in0 xor in1)
            report "Erro no caso XOR"
            severity error;

        -- Caso 4: lógica - NOT in0
        sel <= "011";
        wait for 10 ns;
        assert led = (not in0)
            report "Erro no caso NOT"
            severity error;

        -- Caso 5: aritmética - soma
        in0 <= std_logic_vector(to_unsigned(20, bus_size));
        in1 <= std_logic_vector(to_unsigned(5, bus_size));
        sel <= "100";
        wait for 10 ns;
        assert led = std_logic_vector(unsigned(in0) + unsigned(in1))
            report "Erro no caso soma"
            severity error;

        -- Caso 6: aritmética - subtração
        sel <= "101";
        wait for 10 ns;
        assert led = std_logic_vector(unsigned(in0) - unsigned(in1))
            report "Erro no caso subtracao"
            severity error;

        -- Caso 7: aritmética - multiplicação
        sel <= "110";
        wait for 10 ns;
        assert led = std_logic_vector(unsigned(in0) * unsigned(in1))
            report "Erro no caso multiplicacao"
            severity error;

        -- Caso 8: aritmética - divisão
        in1 <= std_logic_vector(to_unsigned(2, bus_size));
        sel <= "111";
        wait for 10 ns;
        assert led = std_logic_vector(unsigned(in0) / unsigned(in1))
            report "Erro no caso divisao"
            severity error;

        wait;
    end process;
end architecture sim;
