library verilog;
use verilog.vl_types.all;
entity vio_async_in96 is
    port(
        control         : in     vl_logic_vector(35 downto 0);
        async_in        : in     vl_logic_vector(95 downto 0)
    );
end vio_async_in96;
