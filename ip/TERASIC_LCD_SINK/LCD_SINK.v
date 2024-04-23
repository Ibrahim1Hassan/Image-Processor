
//`include ".\lcd_timing_controller.v"
//`include ".\lcd_fifo.v"

module LCD_SINK(
        // global Signals
        clk,
        reset,
        
		// avalon MM-Slave
		cs_in,
		address_in,
		read_in,
		readdata_out,
		write_in,
		writedata_in,        
		
		// avalong s1 ST-SINK(streaming) interface
		ready_out,
		valid_in,
		data_in,  // pass RGB data
		sop_in,  // start of papacket
		eop_in,  // end of packet // Required by Avaon-ST spec.  Unused in this core.
		empty_in,  // Required by Avaon-ST spec.  Unused in this core.
		
		// LCD export interface
		lcd_clk_external,
		lcd_hd,
		lcd_vd,
		lcd_de,
		lcd_data,
		//lcd_g,
		//lcd_b,
		lcd_test_pattern
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/
parameter SYMBOLS_PER_BEAT   = 3; 
parameter BITS_PER_SYMBOL    = 8;
parameter READY_LATENCY      = 0; 
parameter MAX_CHANNEL        = 0;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/
`define LCD_WIDTH	800
`define LCD_HEIGHT  480

`define REG_CMD	    0


parameter STATE_IDLE    		=0;
parameter STATE_RESET			=1;
parameter STATE_STREAMING 		=2;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
        // global signal
input							clk;
input							reset;

		// avalon MM-Slave
input								cs_in;
input		 [2:0]					address_in;
input								read_in;
output	reg [15:0]					readdata_out;
input								write_in;
input		[15:0]					writedata_in;		
		
		// avalong s1 ST-SINK(streaming) interface
output	 						ready_out;
input							valid_in;
input	[23:0]					data_in;
input							sop_in;
input							eop_in;
input	 [1:0]					empty_in;

		
		// LCD export interface
input			lcd_clk_external;
output	reg		lcd_hd;
output	reg		lcd_vd;
output	reg		lcd_de;
output	[7:0]	lcd_data;
//output	[7:0]	lcd_g;
//output	[7:0]	lcd_b;
input			lcd_test_pattern;


/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/
// stream-in
reg								latched_valid_in;								
reg		[23:0]					latched_data_in;

// fifo
wire							fifo_empty;
wire							fifo_full;
reg								fifo_write;
wire							fifo_read;
wire 	[23:0]					fifo_readdata;
reg 	[23:0]					fifo_writedata;
wire 	[9:0]					fifo_wrusedw;
wire							fifo_write_clk;
reg 	[9:0]					fifo_data_num;

reg		[1:0]                   streaming_state;
wire							system_reset;
reg		[3:0]					reset_count_down;
reg								display_frame_start;
reg		[31:0]					lcd_beat;
reg								display_streaming_data;
reg								resync_request;
reg								streaming_to_fifo;
reg								streamimg_from_fifo;

//  wire for LCD Timing Controller
wire			lcdctrl_hd;
wire			lcdctrl_vd;
wire			lcdctrl_de;
wire	[10:0]	lcdctrl_x;
wire	[9:0]	lcdctrl_y;

// latched data fo lcd display
reg 	[23:0]	display_data;



/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential logic                              *
 *****************************************************************************/
 
//===== Avalon MM Slave ====
always @(negedge clk) 
begin
	if (reset)
		resync_request <= 1'b0;
	else if (resync_request && streaming_state == STATE_RESET)
		resync_request <= 1'b0;
	else if (cs_in && write_in && address_in == `REG_CMD)
		resync_request <= 1'b1;
			
end 

//////////////////////////////////////////
//    streaming sync /////////////////////
//////////////////////////////////////////
// streaming_to_fifo 
always @(posedge clk) 
begin
	if (reset || resync_request)
		streaming_to_fifo <= 1'b0;
	else if  (valid_in & ready_out & eop_in)		
		streaming_to_fifo <= 1'b1;
end	

// streamimg_from_fifo 
always @(posedge lcd_clk) 
begin
	if (reset || (streaming_state == STATE_IDLE))
		streamimg_from_fifo <= 1'b0;
	else if  (lcdctrl_y == 0 && streaming_to_fifo)		
		streamimg_from_fifo <= 1'b1;
end	


// lcd beat
always @(posedge lcd_clk) 
begin
	if (reset)
		lcd_beat <= 0;
	else
		lcd_beat <= lcd_beat + 1;
end	
	

// state update 
always @(posedge lcd_clk) 
begin
	if (reset || (resync_request && (streaming_state != STATE_IDLE)))
	begin
		streaming_state <= STATE_IDLE;
	end
	else if (streaming_state == STATE_IDLE)
	begin
		streaming_state <= STATE_RESET;
		reset_count_down <= 15;
	end
	else if (streaming_state == STATE_RESET)
	begin
		if (reset_count_down == 0)
			streaming_state <= STATE_STREAMING;
		else
			reset_count_down <= reset_count_down - 1;
	end
end
 

// display_streaming_data flag
always @(posedge lcd_clk) 
begin
	if (reset)
		display_streaming_data <= 1'b0;
	else if (streaming_state == STATE_STREAMING && !display_streaming_data)
	begin
		if (lcd_de && (lcdctrl_y == (`LCD_HEIGHT-1)) && (lcdctrl_x == (`LCD_WIDTH-1))) // lest point
			display_streaming_data <= 1'b1;
	end
end

//////////////////////////////////////////
//    streaming in ///////////////////////
//////////////////////////////////////////
// latch streaming-in data
always @(posedge clk) 
begin
	if (reset)
		latched_valid_in <= 1'b0;
	else if (valid_in && ready_out && streaming_to_fifo)
	begin
		latched_valid_in <= valid_in;
		latched_data_in <=  data_in;
	end
	else
	begin
		latched_valid_in <= 1'b0;
	end
	
end

// push latched streaming-in data to fifo
assign fifo_write_clk = clk;
always @(posedge fifo_write_clk) 
begin
	if (reset)
	begin
		fifo_write <= 1'b0;
		fifo_data_num <= 1'b0;
	end
	else
	begin
		fifo_write <= latched_valid_in;
		fifo_data_num <= fifo_wrusedw;
	end
	
end

// prepare writedata at falling edge
always @(negedge fifo_write_clk) 
begin
	fifo_writedata <= latched_data_in;
end



//////////////////////////////////////////
//    streaming out //////////////////////
//////////////////////////////////////////
// Retreive data from fifo-data according to lcd syncgenerator control siganl
always @(posedge lcd_clk) 
begin
	if (lcdctrl_de && (lcd_test_pattern || fifo_empty || !display_streaming_data))
	begin //===== start of vga_pixel_request
		if (lcdctrl_x == 0 || lcdctrl_y == 0 || lcdctrl_x == (`LCD_WIDTH-1) || lcdctrl_y == (`LCD_HEIGHT-1))
			display_data <= 24'hFFFFFF; //white;
		else if (lcdctrl_y < `LCD_HEIGHT/4)
			display_data <= (lcdctrl_x << 16)& 24'hFF0000; //red;
		else if (lcdctrl_y < `LCD_HEIGHT/2)
			display_data <=(lcdctrl_x << 8) & 24'h00FF00; //green;
		else if (lcdctrl_y < `LCD_HEIGHT*3/4)
			display_data <= lcdctrl_x & 24'h0000FF; //blue;
		else 
			display_data <= ((lcdctrl_x << 16)& 24'hFF0000) | ((lcdctrl_x << 8) & 24'h00FF00) | (lcdctrl_x & 24'h0000FF); //lcd_x & 24'hFF; //gra;
	end  //======= end of vga_pixel_request
	else if (lcdctrl_de)
	begin
		display_data <= fifo_readdata;
	end
end

always @(posedge lcd_clk)
begin
	lcd_de <= lcdctrl_de;
	lcd_hd <= lcdctrl_hd;
	lcd_vd <= lcdctrl_vd;
end


/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/
 /////modified by hdhuang here
reg lcd_clk;
reg [1:0] mux_cnt;
always@(negedge lcd_clk_external)
begin
  if (mux_cnt==2'b10)
      mux_cnt<=2'b00;
  else
     mux_cnt<=mux_cnt+2'b01;
end
/////////////////////////////////
always@(negedge lcd_clk_external)
begin
  if (mux_cnt==2'b10)
     lcd_clk<=1'b0;
  else
     lcd_clk<=1'b1;
end

assign lcd_data = mux_cnt[1]?display_data[23:16]:(mux_cnt[0]?display_data[15:8]:display_data[7:0]);
////
//assign	lcd_r	= display_data[7:0];
//assign	lcd_g	= display_data[15:8];
//assign	lcd_b	= display_data[23:16];
////end!!!!!!!!!!!!!!!!!!!!!!!!!!!

//assign ready_out = !fifo_full & start_streaming;
assign system_reset = ((streaming_state == STATE_RESET) && reset_count_down)?1'b1:1'b0;
//assign streaming  	=  (streaming_state == STATE_STREAMING)?1'b1:1'b0;

//assign ready_out 	= (streaming && (fifo_wrusedw < 128))?1'b1:1'b0;// & start_streaming;
assign ready_out 	= ((streaming_state != STATE_STREAMING) || (fifo_data_num < 128))?1'b1:1'b0;// & start_streaming;
//assign fifo_write 	= valid_in & ready_out & streaming_to_fifo;
assign fifo_read 	= (lcdctrl_de && !fifo_empty && streamimg_from_fifo)?1'b1:1'b0;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

lcd_timing_controller lcd_timing_controller_inst(
						.iCLK(lcd_clk), 				// LCD display clock
						.iRST_n(~system_reset), 		// systen reset
						//LCD SIDE
						.oHD(lcdctrl_hd),				// LCD Horizontal sync 
						.oVD(lcdctrl_vd),				// LCD Vertical sync 	
						.oDEN(lcdctrl_de),				// LCD Data Enable
						.oLCD_R(),				// LCD Red color data 
						.oLCD_G(),             // LCD Green color data  
						.oLCD_B(),             // LCD Blue color data  
						.oLCD_X(lcdctrl_x),             // X coordinate
						.oLCD_Y(lcdctrl_y),             // Y coordinate
						.iDISPLAY_MODE()
);


	
lcd_fifo lcd_fifo_inst(
	.aclr(system_reset),  // sync to wrclk
	// read
	.rdclk(lcd_clk),
	.rdreq(fifo_read),
	.q(fifo_readdata),
	.rdempty(fifo_empty),
	.rdusedw(),//fifo_rdusedw),
	// write
	.wrclk(fifo_write_clk),
	.wrreq(fifo_write),
	.data(fifo_writedata),
	.wrfull(fifo_full),
	.wrusedw(fifo_wrusedw)
	);	
	



endmodule




