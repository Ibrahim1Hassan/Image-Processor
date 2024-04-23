// --------------------------------------------------------------------
// Copyright (c) 2010 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	DE2-115 LTM picture viewer
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author                    :| Mod. Date :| Changes Made:
//   V1.0 :| Ben N. Huang              :| 06/09/10  :| Initial Revision
//   V1.1 :| Dee Zeng                  :| 03/14/11  :| Update to Q10.1Sp1
// --------------------------------------------------------------------

module DE2_115_LTM_Pic(

	//////// CLOCK //////////
	OSC_50,
	NETCLK_25,

	//////// Sma //////////
	SMA_CLKIN,
	SMA_CLKOUT,

	//////// LED //////////
	LEDG,
	LEDR,

	//////// KEY //////////
	KEY,

	//////// SW //////////
	SW,

	//////// SEG7 //////////
	HEX0_D,
	HEX1_D,
	HEX2_D,
	HEX3_D,
	HEX4_D,
	HEX5_D,
	HEX6_D,
	HEX7_D,

	//////// LCD //////////
	LCD_BLON,
	LCD_DATA,
	LCD_EN,
	LCD_ON,
	LCD_RS,
	LCD_RW,

	//////// RS232 //////////
	UART_CTS,
	UART_RTS,
	UART_RXD,
	UART_TXD,

	//////// PS2 //////////
	PS2_KBCLK,
	PS2_KBDAT,
	PS2_MSCLK,
	PS2_MSDAT,

	//////// SDCARD //////////
	SD_CLK,
	SD_CMD,
	SD_DAT,
	SD_WP_n,

	//////// VGA //////////
	VGA_B,
	VGA_BLANK_n,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_n,
	VGA_VS,

	//////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	//////// I2C for EEPROM //////////
	EEP_I2C_SCL,
	EEP_I2C_SDA,

	//////// I2C for Audio and Tv-Decode //////////
	I2C_SCL,
	I2C_SDA,

	//////// Ethernet 0 //////////
	NET0_GTX_CLK,
	NET0_INT_n,
	NET0_MDC,
	NET0_MDIO,
	NET0_RESET_n,
	NET0_RX_CLK,
	NET0_RX_COL,
	NET0_RX_CRS,
	NET0_RX_DATA,
	NET0_RX_DV,
	NET0_RX_ER,
	NET0_TX_CLK,
	NET0_TX_DATA,
	NET0_TX_EN,
	NET0_TX_ER,
	NET0_LINK100,

	//////// Ethernet 1 //////////
	NET1_GTX_CLK,
	NET1_INT_n,
	NET1_MDC,
	NET1_MDIO,
	NET1_RESET_n,
	NET1_RX_CLK,
	NET1_RX_COL,
	NET1_RX_CRS,
	NET1_RX_DATA,
	NET1_RX_DV,
	NET1_RX_ER,
	NET1_TX_CLK,
	NET1_TX_DATA,
	NET1_TX_EN,
	NET1_TX_ER,
	NET1_LINK100,

	//////// TV Decoder //////////
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_n,
	TD_VS,

    /////// USB OTG controller
    OTG_DATA,
    OTG_A,
    OTG_CS_n,
    OTG_WE_n,
    OTG_OE_n,
    OTG_INT,
    OTG_RESET_n,
    OTG_DREQ,
    OTG_DACK_n,
    OTG_FSPEED,
    OTG_LSPEED,
	//////// IR Receiver //////////
	IRDA_RXD,

	//////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_n,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_n,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_n,
	DRAM_WE_n,

	//////// SRAM //////////
	SRAM_ADDR,
	SRAM_CE_n,
	SRAM_DQ,
	SRAM_LB_n,
	SRAM_OE_n,
	SRAM_UB_n,
	SRAM_WE_n,

	//////// Flash //////////
	FLASH_ADDR,
	FLASH_CE_n,
	FLASH_DQ,
	FLASH_OE_n,
	FLASH_RESET_n,
	FLASH_RY,
	FLASH_WE_n,
	FLASH_WP_n,

	//////// GPIO //////////
	GPIO_DATA,

	//////// HSMC (LVDS) //////////
//	HSMC_CLKIN_n1,
//	HSMC_CLKIN_n2,
	HSMC_CLKIN_p1,
	HSMC_CLKIN_p2,
	HSMC_CLKIN0,
//	HSMC_CLKOUT_n1,
//	HSMC_CLKOUT_n2,
	HSMC_CLKOUT_p1,
	HSMC_CLKOUT_p2,
	HSMC_CLKOUT0,
	HSMC_D,
//	HSMC_RX_D_n,
	HSMC_RX_D_p,
//	HSMC_TX_D_n,
	HSMC_TX_D_p,
    //////// EXTEND IO //////////
    EXT_IO	
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input		   	  [2:0]		OSC_50;
input		        		  		NETCLK_25;

//////////// Sma //////////
input		          			SMA_CLKIN;
output		          		SMA_CLKOUT;

//////////// LED //////////
output		  		[8:0]		LEDG;
output		  		[17:0]	LEDR;

//////////// KEY //////////
input		    		 [3:0]	KEY;

//////////// SW //////////
input		    		[17:0]	SW;

//////////// SEG7 //////////
output		     [6:0]		HEX0_D;
output		     [6:0]		HEX1_D;
output		     [6:0]		HEX2_D;
output		     [6:0]		HEX3_D;
output		     [6:0]		HEX4_D;
output		     [6:0]		HEX5_D;
output		     [6:0]		HEX6_D;
output		     [6:0]		HEX7_D;

//////////// LCD //////////
output		          		LCD_BLON;
inout		     		[7:0]		LCD_DATA;
output		          		LCD_EN;
output		          		LCD_ON;
output		          		LCD_RS;
output		          		LCD_RW;

//////////// RS232 //////////
output		          		UART_CTS;
input		          			UART_RTS;
input		          			UART_RXD;
output		          		UART_TXD;

//////////// PS2 //////////
inout		          			PS2_KBCLK;
inout		          			PS2_KBDAT;
inout		          			PS2_MSCLK;
inout		          			PS2_MSDAT;

//////////// SDCARD //////////
output		          		SD_CLK;
inout		          			SD_CMD;
inout		     		[3:0]		SD_DAT;
input		          			SD_WP_n;

//////////// VGA //////////
output		     [7:0]		VGA_B;
output		          		VGA_BLANK_n;
output		          		VGA_CLK;
output		     [7:0]		VGA_G;
output		          		VGA_HS;
output		     [7:0]		VGA_R;
output		          		VGA_SYNC_n;
output		          		VGA_VS;

//////////// Audio //////////
input		          			AUD_ADCDAT;
inout		          			AUD_ADCLRCK;
inout		          			AUD_BCLK;
output		          		AUD_DACDAT;
inout		          			AUD_DACLRCK;
output		          		AUD_XCK;

//////////// I2C for EEPROM //////////
output		          		EEP_I2C_SCL;
inout		          			EEP_I2C_SDA;

//////////// I2C for Audio and Tv-Decode //////////
output		          		I2C_SCL;
inout		          			I2C_SDA;

//////////// Ethernet 0 //////////
output		          		NET0_GTX_CLK;
input		          			NET0_INT_n;
output		          		NET0_MDC;
input		          			NET0_MDIO;
output		          		NET0_RESET_n;
input		          			NET0_RX_CLK;
input		          			NET0_RX_COL;
input		          			NET0_RX_CRS;
input		     		[3:0]		NET0_RX_DATA;
input		          			NET0_RX_DV;
input		          			NET0_RX_ER;
input		          			NET0_TX_CLK;
output		     [3:0]		NET0_TX_DATA;
output		          		NET0_TX_EN;
output		          		NET0_TX_ER;
input		          			NET0_LINK100;

//////////// Ethernet 1 //////////
output		          		NET1_GTX_CLK;
input		          			NET1_INT_n;
output		          		NET1_MDC;
input		          			NET1_MDIO;
output		          		NET1_RESET_n;
input		          			NET1_RX_CLK;
input		          			NET1_RX_COL;
input		          			NET1_RX_CRS;
input		     		[3:0]		NET1_RX_DATA;
input		          			NET1_RX_DV;
input		          			NET1_RX_ER;
input		          			NET1_TX_CLK;
output		     [3:0]		NET1_TX_DATA;
output		          		NET1_TX_EN;
output		          		NET1_TX_ER;
input		          			NET1_LINK100;

//////////// TV Decoder 1 //////////
input		          			TD_CLK27;
input		     		[7:0]		TD_DATA;
input		          			TD_HS;
output		          		TD_RESET_n;
input		          			TD_VS;


//////////// USB OTG controller //////////
inout            [15:0]     OTG_DATA;
output           [1:0]      OTG_A;
output                      OTG_CS_n;
output                      OTG_WE_n;
output                      OTG_OE_n;
input            [1:0]      OTG_INT;
output                      OTG_RESET_n;
input            [1:0]      OTG_DREQ;
output           [1:0]      OTG_DACK_n;
inout                       OTG_FSPEED;
inout                       OTG_LSPEED;

//////////// IR Receiver //////////
input		          			IRDA_RXD;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_n;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_n;
inout		    	[31:0]		DRAM_DQ;
output		     [3:0]		DRAM_DQM;
output		          		DRAM_RAS_n;
output		          		DRAM_WE_n;

//////////// SRAM //////////
output		    [19:0]		SRAM_ADDR;
output		          		SRAM_CE_n;
inout		    	[15:0]		SRAM_DQ;
output		          		SRAM_LB_n;
output		          		SRAM_OE_n;
output		          		SRAM_UB_n;
output		          		SRAM_WE_n;

//////////// Flash //////////
output		    [22:0]		FLASH_ADDR;
output		          		FLASH_CE_n;
inout		    	 [7:0]		FLASH_DQ;
output		          		FLASH_OE_n;
output		          		FLASH_RESET_n;
input		          			FLASH_RY;
output		          		FLASH_WE_n;
output		          		FLASH_WP_n;

//////////// GPIO //////////
inout		    	[35:0]		GPIO_DATA;

//////////// HSMC (LVDS) //////////

//input		          		HSMC_CLKIN_n1;
//input		          		HSMC_CLKIN_n2;
input		          			HSMC_CLKIN_p1;
input		          			HSMC_CLKIN_p2;
input		          			HSMC_CLKIN0;
//output		          		HSMC_CLKOUT_n1;
//output		          		HSMC_CLKOUT_n2;
output		          		HSMC_CLKOUT_p1;
output		          		HSMC_CLKOUT_p2;
output		          		HSMC_CLKOUT0;
inout		     		[3:0]		HSMC_D;
//input		    [16:0]		HSMC_RX_D_n;
input		    	 [16:0]		HSMC_RX_D_p;
//output		    [16:0]		HSMC_TX_D_n;
output		    [16:0]		HSMC_TX_D_p;

//////// EXTEND IO //////////
inout		   	 [6:0]		EXT_IO;



//=======================================================
//  REG/WIRE declarations
//=======================================================



wire HEX0_DP;
wire HEX1_DP;
wire HEX2_DP;
wire HEX3_DP;
wire HEX4_DP;
wire HEX5_DP;
wire HEX6_DP;
wire HEX7_DP;
//

//=======================================================
//  Structural coding
//=======================================================
wire reset_n;

assign reset_n = 1'b1;
/////
wire [23:0] BGR_DATA;
wire NCLK,DEN,HD,VD;
wire [7:0] G_DATA,B_DATA,R_DATA;
//the lcd spi interface
wire scen,sdat,sclk,adc_sclk,adc_cs_n,adc_dout,adc_din,adc_pen_irq_n,ADC_DCLK;
/////
assign B_DATA = BGR_DATA[23:16];
assign G_DATA = BGR_DATA[15:8];
assign R_DATA = BGR_DATA[7:0];
assign GPIO_DATA[35] = sdat;
assign GPIO_DATA[34] = SCEN;
assign GPIO_DATA[33] = 1'b1;
assign GPIO_DATA[32:25] = R_DATA;
assign GPIO_DATA[24:17] = G_DATA;
assign GPIO_DATA[16:13] = B_DATA[7:4];
assign GPIO_DATA[12] = VD;
assign GPIO_DATA[11] = HD;
assign GPIO_DATA[10] = DEN;
assign GPIO_DATA[9] = NCLK;
assign GPIO_DATA[8] = B_DATA[0];
assign GPIO_DATA[7]  = B_DATA[1];
assign GPIO_DATA[6]  = B_DATA[2];
assign GPIO_DATA[5]  = B_DATA[3];
assign GPIO_DATA[4]  = ADC_DCLK;
assign GPIO_DATA[3]  = adc_din;
assign adc_busy      = GPIO_DATA[2];
assign adc_dout      = GPIO_DATA[1];
assign adc_pen_irq_n = GPIO_DATA[0];
/////
nios_simple nios_simple_ins(
                      // 1) global signals:
                       .clk_ext(OSC_50[0]),
                       .reset_n(reset_n),
                       //.altpll_25(),
                      // .altpll_io(),
                       .clk_sdram(DRAM_CLK),
                       //.clk_sdram(DRAM_CLK),
                       .clk_pixel(NCLK),
                       ////                      
                       .DEN_from_the_video_sync_generator     (DEN),
                       .HD_from_the_video_sync_generator      (HD),
                       .RGB_OUT_from_the_video_sync_generator (BGR_DATA),
                       .VD_from_the_video_sync_generator      (VD),
                      // the_sdram
                       .zs_addr_from_the_sdram(DRAM_ADDR),
                       .zs_ba_from_the_sdram(DRAM_BA),
                       .zs_cas_n_from_the_sdram(DRAM_CAS_n),
                       .zs_cke_from_the_sdram(DRAM_CKE),
                       .zs_cs_n_from_the_sdram(DRAM_CS_n),
                       .zs_dq_to_and_from_the_sdram(DRAM_DQ),
                       .zs_dqm_from_the_sdram(DRAM_DQM),
                       .zs_ras_n_from_the_sdram(DRAM_RAS_n),
                       .zs_we_n_from_the_sdram(DRAM_WE_n),
                      // the_sd_card_controller
                       .spi_clk_from_the_sd_card_controller      (SD_CLK),
                       .spi_cs_n_from_the_sd_card_controller     (SD_DAT[3]),
                       .spi_data_in_to_the_sd_card_controller    (SD_DAT[0]),
                       .spi_data_out_from_the_sd_card_controller (SD_CMD),
                       // the lcd spi interface
                       .bidir_port_to_and_from_the_lcd_i2c_sda   (sdat),
                       .out_port_from_the_lcd_i2c_en             (scen),
                       .out_port_from_the_lcd_i2c_scl            (sclk),
                       ////cfi flash
                       .tri_state_bridge_flash_address           (FLASH_ADDR),
                       .tri_state_bridge_flash_data              (FLASH_DQ),
                       .write_n_to_the_cfi_flash                 (FLASH_WE_n),
                       .read_n_to_the_cfi_flash                  (FLASH_OE_n),
                       .select_n_to_the_cfi_flash                (FLASH_CE_n),
                       ////touch panel interface
                       .MISO_to_the_touch_panel_spi              (adc_dout),
                       .MOSI_from_the_touch_panel_spi            (adc_din),
                       .SCLK_from_the_touch_panel_spi            (adc_sclk),
                       .SS_n_from_the_touch_panel_spi            (adc_cs_n),
                       .in_port_to_the_touch_panel_pen_irq_n     (adc_pen_irq_n),
                       .in_port_to_the_touch_panel_busy          (adc_busy),
                       ////SRAM
                       .SRAM_ADDR_from_the_sram                  (SRAM_ADDR),
                       .SRAM_CE_n_from_the_sram                  (SRAM_CE_n),
                       .SRAM_DQ_to_and_from_the_sram             (SRAM_DQ),
                       .SRAM_LB_n_from_the_sram                  (SRAM_LB_n),
                       .SRAM_OE_n_from_the_sram                  (SRAM_OE_n),
                       .SRAM_UB_n_from_the_sram                  (SRAM_UB_n),
                       .SRAM_WE_n_from_the_sram                  (SRAM_WE_n)
                    );
assign ADC_DCLK = (adc_cs_n?(scen?1'bz:sclk):adc_sclk);
assign SCEN     = ~adc_cs_n;

// Flash Config
assign	FLASH_RESET_n = reset_n;
assign	FLASH_WP_n = 1'b1;
//	FLASH_RY,

///////////////////////////////////////////
// LCD config
assign LCD_BLON = 0; // not supported
assign LCD_ON = 1'b1; // alwasy on


///////////////////////////////////////////
// GPIO
//assign GPIO_DATA[17:0] = (io_dir)?GPIO_DATA[35:18]:18'hz;
//
///////////////////////////////////////////
// HSMC
//assign HSMC_D[1:0] = (io_dir)?HSMC_D[3:2]:2'hz;
//assign HSMC_D[3:2] = (io_dir)?HSMC_D[1:0]:2'hz;

assign HSMC_TX_D_p = HSMC_RX_D_p;
//assign HSMC_TX_D_n = HSMC_RX_D_n;

//assign HSMC_CLKOUT_n1 = HSMC_CLKIN_n1;
//assign HSMC_CLKOUT_n2 = HSMC_CLKIN_n2;
assign HSMC_CLKOUT_p1 = HSMC_CLKIN_p1;
assign HSMC_CLKOUT_p2 = HSMC_CLKIN_p2;
assign HSMC_CLKOUT0 = HSMC_CLKIN0;

///////////////////////////////////////////
// VGA
assign VGA_BLANK_n = 1'b1;
assign VGA_SYNC_n = 1'b1;


///////////////////////////////////////////
// NET
assign NET0_GTX_CLK = NET0_INT_n;
//assign NET0_GTX_CLK = NET0_MDIO;
assign NET0_MDC = NET0_RX_COL;
assign NET0_RESET_n = NET0_RX_CRS;
//assign NET0_RX_CLK = NET0_RX_DV;
assign NET0_TX_DATA = NET0_RX_DATA;
assign NET0_TX_EN = NET0_RX_ER;
assign NET0_TX_ER = NET0_TX_CLK;

assign NET1_GTX_CLK = NET1_INT_n;
//assign NET1_GTX_CLK = NET1_MDIO;
assign NET1_MDC = NET1_RX_COL;
assign NET1_RESET_n = NET1_RX_CRS;
//assign NET1_RX_CLK = NET1_RX_DV;
assign NET1_TX_DATA = NET1_RX_DATA;
assign NET1_TX_EN = NET1_RX_ER;
assign NET1_TX_ER = NET1_TX_CLK;

//assign ?? = {NET0_MDIO, NET0_RX_CLK, NET0_RX_DV};
//assign ?? = {NET1_MDIO, NET1_RX_CLK, NET1_RX_DV};

///////////////////////////////////////////
// USB OTG
//input            [1:0]      OTG_DREQ;
//output           [1:0]      OTG_DACK_n;
//inout                       OTG_FSPEED;
//inout                       OTG_LSPEED;                       
assign OTG_DACK_n = OTG_DREQ;
assign OTG_FSPEED = 1'b1;
assign OTG_LSPEED = 1'b0;

///////////////////////////////////////////
// TV
assign TD_RESET_n = TD_VS;
assign action = FLASH_RY & TD_HS & TD_CLK27 & (TD_DATA == 8'hff);

///////////////////////////////////////////
// ps2
assign PS2_KBCLK = PS2_KBDAT;
assign PS2_MSCLK = PS2_MSDAT;

endmodule

