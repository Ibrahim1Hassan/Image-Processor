// sd_card_controller.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module sd_card_controller (
		input  wire        clk,                     //       global_signals_clock.clk
		input  wire        reset_n,                 // global_signals_clock_reset.reset_n
		input  wire [7:0]  avalon_slave_address,    //               avalon_slave.address
		output wire [31:0] avalon_slave_readdata,   //                           .readdata
		input  wire [31:0] avalon_slave_writedata,  //                           .writedata
		input  wire        avalon_slave_write,      //                           .write
		input  wire        avalon_slave_read,       //                           .read
		input  wire        avalon_slave_chipselect, //                           .chipselect
		input  wire [3:0]  avalon_slave_byteenable, //                           .byteenable
		output wire        spi_data_out,            //        avalon_slave_export.export
		input  wire        spi_data_in,             //                           .export
		output wire        spi_cs_n,                //                           .export
		output wire        spi_clk                  //                           .export
	);

	sd_controller #(
		.IDLE                 (0),
		.SHIFT_OUT_CMD        (1),
		.WAIT_FOR_RSP_START   (2),
		.SHIFT_IN_CMD_RSP     (3),
		.WAIT_FOR_DATA_START  (4),
		.SHIFT_IN_DATA        (5),
		.SHIFT_IN_CRC16       (6),
		.SHIFT_OUT_DATA_TOKEN (7),
		.SHIFT_OUT_DATA       (8),
		.SHIFT_OUT_CRC16      (9),
		.SHIFT_IN_DATA_RSP    (10),
		.DATA_BUSY            (11),
		.ERROR_STATE          (12),
		.WAIT                 (13)
	) sd_card_controller (
		.clk                     (clk),                     //       global_signals_clock.clk
		.reset_n                 (reset_n),                 // global_signals_clock_reset.reset_n
		.avalon_slave_address    (avalon_slave_address),    //               avalon_slave.address
		.avalon_slave_readdata   (avalon_slave_readdata),   //                           .readdata
		.avalon_slave_writedata  (avalon_slave_writedata),  //                           .writedata
		.avalon_slave_write      (avalon_slave_write),      //                           .write
		.avalon_slave_read       (avalon_slave_read),       //                           .read
		.avalon_slave_chipselect (avalon_slave_chipselect), //                           .chipselect
		.avalon_slave_byteenable (avalon_slave_byteenable), //                           .byteenable
		.spi_data_out            (spi_data_out),            //        avalon_slave_export.export
		.spi_data_in             (spi_data_in),             //                           .export
		.spi_cs_n                (spi_cs_n),                //                           .export
		.spi_clk                 (spi_clk)                  //                           .export
	);

endmodule
