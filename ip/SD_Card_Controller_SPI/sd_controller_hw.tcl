# TCL File Generated by Component Editor 10.0
# Thu Aug 12 13:53:03 CST 2010
# DO NOT MODIFY


# +-----------------------------------
# | 
# | sd_controller "SD Card Controller (SPI)" v8.0
# | Nate Knight 2010.08.12.13:53:03
# | 
# | 
# | E:/DE2_115_LTM_Pic/ip/SD_Card_Controller_SPI/sd_controller.v
# | 
# |    ./sd_controller.v syn
# |    ./sd_data_ram.v syn
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 10.0
# | 
package require -exact sopc 10.0
# | 
# +-----------------------------------

# +-----------------------------------
# | module sd_controller
# | 
set_module_property DESCRIPTION ""
set_module_property NAME sd_controller
set_module_property VERSION 8.0
set_module_property INTERNAL false
set_module_property GROUP "Memories and Memory Controllers/SD Card"
set_module_property AUTHOR "Nate Knight"
set_module_property DISPLAY_NAME "SD Card Controller (SPI)"
set_module_property TOP_LEVEL_HDL_FILE sd_controller.v
set_module_property TOP_LEVEL_HDL_MODULE sd_controller
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL TRUE
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file sd_controller.v SYNTHESIS
add_file sd_data_ram.v SYNTHESIS
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter IDLE INTEGER 0
set_parameter_property IDLE DEFAULT_VALUE 0
set_parameter_property IDLE DISPLAY_NAME IDLE
set_parameter_property IDLE TYPE INTEGER
set_parameter_property IDLE UNITS None
set_parameter_property IDLE AFFECTS_GENERATION false
set_parameter_property IDLE HDL_PARAMETER true
add_parameter SHIFT_OUT_CMD INTEGER 1
set_parameter_property SHIFT_OUT_CMD DEFAULT_VALUE 1
set_parameter_property SHIFT_OUT_CMD DISPLAY_NAME SHIFT_OUT_CMD
set_parameter_property SHIFT_OUT_CMD TYPE INTEGER
set_parameter_property SHIFT_OUT_CMD UNITS None
set_parameter_property SHIFT_OUT_CMD AFFECTS_GENERATION false
set_parameter_property SHIFT_OUT_CMD HDL_PARAMETER true
add_parameter WAIT_FOR_RSP_START INTEGER 2
set_parameter_property WAIT_FOR_RSP_START DEFAULT_VALUE 2
set_parameter_property WAIT_FOR_RSP_START DISPLAY_NAME WAIT_FOR_RSP_START
set_parameter_property WAIT_FOR_RSP_START TYPE INTEGER
set_parameter_property WAIT_FOR_RSP_START UNITS None
set_parameter_property WAIT_FOR_RSP_START AFFECTS_GENERATION false
set_parameter_property WAIT_FOR_RSP_START HDL_PARAMETER true
add_parameter SHIFT_IN_CMD_RSP INTEGER 3
set_parameter_property SHIFT_IN_CMD_RSP DEFAULT_VALUE 3
set_parameter_property SHIFT_IN_CMD_RSP DISPLAY_NAME SHIFT_IN_CMD_RSP
set_parameter_property SHIFT_IN_CMD_RSP TYPE INTEGER
set_parameter_property SHIFT_IN_CMD_RSP UNITS None
set_parameter_property SHIFT_IN_CMD_RSP AFFECTS_GENERATION false
set_parameter_property SHIFT_IN_CMD_RSP HDL_PARAMETER true
add_parameter WAIT_FOR_DATA_START INTEGER 4
set_parameter_property WAIT_FOR_DATA_START DEFAULT_VALUE 4
set_parameter_property WAIT_FOR_DATA_START DISPLAY_NAME WAIT_FOR_DATA_START
set_parameter_property WAIT_FOR_DATA_START TYPE INTEGER
set_parameter_property WAIT_FOR_DATA_START UNITS None
set_parameter_property WAIT_FOR_DATA_START AFFECTS_GENERATION false
set_parameter_property WAIT_FOR_DATA_START HDL_PARAMETER true
add_parameter SHIFT_IN_DATA INTEGER 5
set_parameter_property SHIFT_IN_DATA DEFAULT_VALUE 5
set_parameter_property SHIFT_IN_DATA DISPLAY_NAME SHIFT_IN_DATA
set_parameter_property SHIFT_IN_DATA TYPE INTEGER
set_parameter_property SHIFT_IN_DATA UNITS None
set_parameter_property SHIFT_IN_DATA AFFECTS_GENERATION false
set_parameter_property SHIFT_IN_DATA HDL_PARAMETER true
add_parameter SHIFT_IN_CRC16 INTEGER 6
set_parameter_property SHIFT_IN_CRC16 DEFAULT_VALUE 6
set_parameter_property SHIFT_IN_CRC16 DISPLAY_NAME SHIFT_IN_CRC16
set_parameter_property SHIFT_IN_CRC16 TYPE INTEGER
set_parameter_property SHIFT_IN_CRC16 UNITS None
set_parameter_property SHIFT_IN_CRC16 AFFECTS_GENERATION false
set_parameter_property SHIFT_IN_CRC16 HDL_PARAMETER true
add_parameter SHIFT_OUT_DATA_TOKEN INTEGER 7
set_parameter_property SHIFT_OUT_DATA_TOKEN DEFAULT_VALUE 7
set_parameter_property SHIFT_OUT_DATA_TOKEN DISPLAY_NAME SHIFT_OUT_DATA_TOKEN
set_parameter_property SHIFT_OUT_DATA_TOKEN TYPE INTEGER
set_parameter_property SHIFT_OUT_DATA_TOKEN UNITS None
set_parameter_property SHIFT_OUT_DATA_TOKEN AFFECTS_GENERATION false
set_parameter_property SHIFT_OUT_DATA_TOKEN HDL_PARAMETER true
add_parameter SHIFT_OUT_DATA INTEGER 8
set_parameter_property SHIFT_OUT_DATA DEFAULT_VALUE 8
set_parameter_property SHIFT_OUT_DATA DISPLAY_NAME SHIFT_OUT_DATA
set_parameter_property SHIFT_OUT_DATA TYPE INTEGER
set_parameter_property SHIFT_OUT_DATA UNITS None
set_parameter_property SHIFT_OUT_DATA AFFECTS_GENERATION false
set_parameter_property SHIFT_OUT_DATA HDL_PARAMETER true
add_parameter SHIFT_OUT_CRC16 INTEGER 9
set_parameter_property SHIFT_OUT_CRC16 DEFAULT_VALUE 9
set_parameter_property SHIFT_OUT_CRC16 DISPLAY_NAME SHIFT_OUT_CRC16
set_parameter_property SHIFT_OUT_CRC16 TYPE INTEGER
set_parameter_property SHIFT_OUT_CRC16 UNITS None
set_parameter_property SHIFT_OUT_CRC16 AFFECTS_GENERATION false
set_parameter_property SHIFT_OUT_CRC16 HDL_PARAMETER true
add_parameter SHIFT_IN_DATA_RSP INTEGER 10
set_parameter_property SHIFT_IN_DATA_RSP DEFAULT_VALUE 10
set_parameter_property SHIFT_IN_DATA_RSP DISPLAY_NAME SHIFT_IN_DATA_RSP
set_parameter_property SHIFT_IN_DATA_RSP TYPE INTEGER
set_parameter_property SHIFT_IN_DATA_RSP UNITS None
set_parameter_property SHIFT_IN_DATA_RSP AFFECTS_GENERATION false
set_parameter_property SHIFT_IN_DATA_RSP HDL_PARAMETER true
add_parameter DATA_BUSY INTEGER 11
set_parameter_property DATA_BUSY DEFAULT_VALUE 11
set_parameter_property DATA_BUSY DISPLAY_NAME DATA_BUSY
set_parameter_property DATA_BUSY TYPE INTEGER
set_parameter_property DATA_BUSY UNITS None
set_parameter_property DATA_BUSY AFFECTS_GENERATION false
set_parameter_property DATA_BUSY HDL_PARAMETER true
add_parameter ERROR_STATE INTEGER 12
set_parameter_property ERROR_STATE DEFAULT_VALUE 12
set_parameter_property ERROR_STATE DISPLAY_NAME ERROR_STATE
set_parameter_property ERROR_STATE TYPE INTEGER
set_parameter_property ERROR_STATE UNITS None
set_parameter_property ERROR_STATE AFFECTS_GENERATION false
set_parameter_property ERROR_STATE HDL_PARAMETER true
add_parameter WAIT INTEGER 13
set_parameter_property WAIT DEFAULT_VALUE 13
set_parameter_property WAIT DISPLAY_NAME WAIT
set_parameter_property WAIT TYPE INTEGER
set_parameter_property WAIT UNITS None
set_parameter_property WAIT AFFECTS_GENERATION false
set_parameter_property WAIT HDL_PARAMETER true
# | 
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point global_signals_clock
# | 
add_interface global_signals_clock clock end

set_interface_property global_signals_clock ENABLED true

add_interface_port global_signals_clock clk clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point global_signals_clock_reset
# | 
add_interface global_signals_clock_reset reset end
set_interface_property global_signals_clock_reset associatedClock global_signals_clock
set_interface_property global_signals_clock_reset synchronousEdges DEASSERT

set_interface_property global_signals_clock_reset ASSOCIATED_CLOCK global_signals_clock
set_interface_property global_signals_clock_reset ENABLED true

add_interface_port global_signals_clock_reset reset_n reset_n Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_slave
# | 
add_interface avalon_slave avalon end
set_interface_property avalon_slave addressAlignment DYNAMIC
set_interface_property avalon_slave associatedClock global_signals_clock
set_interface_property avalon_slave associatedReset global_signals_clock_reset
set_interface_property avalon_slave burstOnBurstBoundariesOnly false
set_interface_property avalon_slave explicitAddressSpan 0
set_interface_property avalon_slave holdTime 0
set_interface_property avalon_slave isMemoryDevice true
set_interface_property avalon_slave isNonVolatileStorage false
set_interface_property avalon_slave linewrapBursts false
set_interface_property avalon_slave maximumPendingReadTransactions 0
set_interface_property avalon_slave printableDevice false
set_interface_property avalon_slave readLatency 0
set_interface_property avalon_slave readWaitTime 1
set_interface_property avalon_slave setupTime 0
set_interface_property avalon_slave timingUnits Cycles
set_interface_property avalon_slave writeWaitStates 1
set_interface_property avalon_slave writeWaitTime 1

set_interface_property avalon_slave ASSOCIATED_CLOCK global_signals_clock
set_interface_property avalon_slave ENABLED true

add_interface_port avalon_slave avalon_slave_address address Input 8
add_interface_port avalon_slave avalon_slave_readdata readdata Output 32
add_interface_port avalon_slave avalon_slave_writedata writedata Input 32
add_interface_port avalon_slave avalon_slave_write write Input 1
add_interface_port avalon_slave avalon_slave_read read Input 1
add_interface_port avalon_slave avalon_slave_chipselect chipselect Input 1
add_interface_port avalon_slave avalon_slave_byteenable byteenable Input 4
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_slave_export
# | 
add_interface avalon_slave_export conduit end

set_interface_property avalon_slave_export ENABLED true

add_interface_port avalon_slave_export spi_data_out export Output 1
add_interface_port avalon_slave_export spi_data_in export Input 1
add_interface_port avalon_slave_export spi_cs_n export Output 1
add_interface_port avalon_slave_export spi_clk export Output 1
# | 
# +-----------------------------------
