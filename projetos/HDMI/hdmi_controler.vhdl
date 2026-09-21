library ieee;
use ieee.std_logic_1164.all;

entity hdmi_controler is
    generic (
        h_res  : positive := 720;
        v_res  : positive := 480;
        h_sync : positive := 61;
        h_fp   : positive := 58;
        h_bp   : positive := 18;
        v_sync : positive := 5;
        v_fp   : positive := 30;
        v_bp   : positive := 9
    );
    port (
        -- clk e reset do sistema
        i_clk      : in std_logic;
        i_rst_n    : in std_logic;
        -- sinais de controle
        o_hdmi_hs  : out std_logic;
        o_h_sync   : out std_logic;
        o_hdmi_vs  : out std_logic;
        o_hdmi_de  : out std_logic;
        -- sinais para o circuito gerador de pixels
        o_pixel_en      : out std_logic;
        o_pixel_address : out natural range 0 to h_res * v_res - 1;
        o_x_counter     : out natural range 0 to h_res - 1;
        o_y_counter     : out natural range 0 to v_res - 1
    );
end entity hdmi_controler;

architecture rtl of hdmi_controler is

    constant h_start : natural := h_sync + h_fp;        -- 119
    constant h_end   : natural := h_start + h_res;      -- 839
    constant h_total : natural := h_end + h_bp;         -- 857

    constant v_start : natural := v_sync + v_fp;        -- 35
    constant v_end   : natural := v_start + v_res;      -- 515
    constant v_total : natural := v_end + v_bp;         -- 524

    signal r_h_count : natural range 0 to h_total := 0; -- 0 a 857
    signal r_h_active : std_logic := '0';

    signal r_v_count : natural range 0 to v_total := 0; -- 0 a 524
    signal r_v_active : std_logic := '0';

begin

    process(i_clk, i_rst_n)
    begin
        if i_rst_n = '0' then
            r_h_count <= 0;
            o_hdmi_hs <= '1';
            r_h_active <= '0';
        elsif rising_edge(i_clk) then
            if (r_h_count = h_total) then
                r_h_count <= 0;
            else
                r_h_count <= r_h_count + 1;
            end if;

            if (r_h_count >= h_sync) AND (r_h_count /= h_total) then
                o_hdmi_hs <= '1';
            else
                o_hdmi_hs <= '0';
            end if;

            if (r_h_count = h_start) then
                r_h_active <= '1';
            elsif (r_h_count = h_end) then
                r_h_active <= '0';
            end if;

        end if;
    end process;

end architecture rtl;
