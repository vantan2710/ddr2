library verilog;
use verilog.vl_types.all;
entity ddr2_top is
    generic(
        BANK_WIDTH      : integer := 2;
        CKE_WIDTH       : integer := 1;
        CLK_WIDTH       : integer := 1;
        COL_WIDTH       : integer := 10;
        CS_NUM          : integer := 1;
        CS_BITS         : integer := 0;
        CS_WIDTH        : integer := 1;
        USE_DM_PORT     : integer := 1;
        DM_WIDTH        : integer := 9;
        DQ_WIDTH        : integer := 72;
        DQ_BITS         : integer := 7;
        DQ_PER_DQS      : integer := 8;
        DQS_WIDTH       : integer := 9;
        DQS_BITS        : integer := 4;
        HIGH_PERFORMANCE_MODE: string  := "TRUE";
        IODELAY_GRP     : string  := "IODELAY_MIG";
        ODT_WIDTH       : integer := 1;
        ROW_WIDTH       : integer := 14;
        APPDATA_WIDTH   : integer := 144;
        ADDITIVE_LAT    : integer := 0;
        BURST_LEN       : integer := 4;
        BURST_TYPE      : integer := 0;
        CAS_LAT         : integer := 5;
        ECC_ENABLE      : integer := 0;
        ODT_TYPE        : integer := 1;
        MULTI_BANK_EN   : integer := 1;
        TWO_T_TIME_EN   : integer := 0;
        REDUCE_DRV      : integer := 0;
        REG_ENABLE      : integer := 1;
        TREFI_NS        : integer := 7800;
        TRAS            : integer := 40000;
        TRCD            : integer := 15000;
        TRFC            : integer := 105000;
        TRP             : integer := 15000;
        TRTP            : integer := 7500;
        TWR             : integer := 15000;
        TWTR            : integer := 10000;
        CLK_PERIOD      : integer := 3000;
        SIM_ONLY        : integer := 0;
        DEBUG_EN        : integer := 0;
        FPGA_SPEED_GRADE: integer := 2
    );
    port(
        clk0            : in     vl_logic;
        clk90           : in     vl_logic;
        clkdiv0         : in     vl_logic;
        rst0            : in     vl_logic;
        rst90           : in     vl_logic;
        rstdiv0         : in     vl_logic;
        app_af_cmd      : in     vl_logic_vector(2 downto 0);
        app_af_addr     : in     vl_logic_vector(30 downto 0);
        app_af_wren     : in     vl_logic;
        app_wdf_wren    : in     vl_logic;
        app_wdf_data    : in     vl_logic_vector;
        app_wdf_mask_data: in     vl_logic_vector;
        app_af_afull    : out    vl_logic;
        app_wdf_afull   : out    vl_logic;
        rd_data_valid   : out    vl_logic;
        rd_data_fifo_out: out    vl_logic_vector;
        rd_ecc_error    : out    vl_logic_vector(1 downto 0);
        phy_init_done   : out    vl_logic;
        ddr2_ck         : out    vl_logic_vector;
        ddr2_ck_n       : out    vl_logic_vector;
        ddr2_a          : out    vl_logic_vector;
        ddr2_ba         : out    vl_logic_vector;
        ddr2_ras_n      : out    vl_logic;
        ddr2_cas_n      : out    vl_logic;
        ddr2_we_n       : out    vl_logic;
        ddr2_cs_n       : out    vl_logic_vector;
        ddr2_cke        : out    vl_logic_vector;
        ddr2_odt        : out    vl_logic_vector;
        ddr2_dm         : out    vl_logic_vector;
        ddr2_dqs        : inout  vl_logic_vector;
        ddr2_dqs_n      : inout  vl_logic_vector;
        ddr2_dq         : inout  vl_logic_vector;
        dbg_idel_up_all : in     vl_logic;
        dbg_idel_down_all: in     vl_logic;
        dbg_idel_up_dq  : in     vl_logic;
        dbg_idel_down_dq: in     vl_logic;
        dbg_idel_up_dqs : in     vl_logic;
        dbg_idel_down_dqs: in     vl_logic;
        dbg_idel_up_gate: in     vl_logic;
        dbg_idel_down_gate: in     vl_logic;
        dbg_sel_idel_dq : in     vl_logic_vector;
        dbg_sel_all_idel_dq: in     vl_logic;
        dbg_sel_idel_dqs: in     vl_logic_vector;
        dbg_sel_all_idel_dqs: in     vl_logic;
        dbg_sel_idel_gate: in     vl_logic_vector;
        dbg_sel_all_idel_gate: in     vl_logic;
        dbg_calib_done  : out    vl_logic_vector(3 downto 0);
        dbg_calib_err   : out    vl_logic_vector(3 downto 0);
        dbg_calib_dq_tap_cnt: out    vl_logic_vector;
        dbg_calib_dqs_tap_cnt: out    vl_logic_vector;
        dbg_calib_gate_tap_cnt: out    vl_logic_vector;
        dbg_calib_rd_data_sel: out    vl_logic_vector;
        dbg_calib_rden_dly: out    vl_logic_vector;
        dbg_calib_gate_dly: out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BANK_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of CKE_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of CLK_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of COL_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of CS_NUM : constant is 1;
    attribute mti_svvh_generic_type of CS_BITS : constant is 1;
    attribute mti_svvh_generic_type of CS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of USE_DM_PORT : constant is 1;
    attribute mti_svvh_generic_type of DM_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DQ_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DQ_BITS : constant is 1;
    attribute mti_svvh_generic_type of DQ_PER_DQS : constant is 1;
    attribute mti_svvh_generic_type of DQS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DQS_BITS : constant is 1;
    attribute mti_svvh_generic_type of HIGH_PERFORMANCE_MODE : constant is 1;
    attribute mti_svvh_generic_type of IODELAY_GRP : constant is 1;
    attribute mti_svvh_generic_type of ODT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ROW_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of APPDATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDITIVE_LAT : constant is 1;
    attribute mti_svvh_generic_type of BURST_LEN : constant is 1;
    attribute mti_svvh_generic_type of BURST_TYPE : constant is 1;
    attribute mti_svvh_generic_type of CAS_LAT : constant is 1;
    attribute mti_svvh_generic_type of ECC_ENABLE : constant is 1;
    attribute mti_svvh_generic_type of ODT_TYPE : constant is 1;
    attribute mti_svvh_generic_type of MULTI_BANK_EN : constant is 1;
    attribute mti_svvh_generic_type of TWO_T_TIME_EN : constant is 1;
    attribute mti_svvh_generic_type of REDUCE_DRV : constant is 1;
    attribute mti_svvh_generic_type of REG_ENABLE : constant is 1;
    attribute mti_svvh_generic_type of TREFI_NS : constant is 1;
    attribute mti_svvh_generic_type of TRAS : constant is 1;
    attribute mti_svvh_generic_type of TRCD : constant is 1;
    attribute mti_svvh_generic_type of TRFC : constant is 1;
    attribute mti_svvh_generic_type of TRP : constant is 1;
    attribute mti_svvh_generic_type of TRTP : constant is 1;
    attribute mti_svvh_generic_type of TWR : constant is 1;
    attribute mti_svvh_generic_type of TWTR : constant is 1;
    attribute mti_svvh_generic_type of CLK_PERIOD : constant is 1;
    attribute mti_svvh_generic_type of SIM_ONLY : constant is 1;
    attribute mti_svvh_generic_type of DEBUG_EN : constant is 1;
    attribute mti_svvh_generic_type of FPGA_SPEED_GRADE : constant is 1;
end ddr2_top;
