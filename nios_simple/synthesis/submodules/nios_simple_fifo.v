//Legal Notice: (C)2024 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_simple_fifo_dual_clock_fifo (
                                          // inputs:
                                           aclr,
                                           data,
                                           rdclk,
                                           rdreq,
                                           wrclk,
                                           wrreq,

                                          // outputs:
                                           q,
                                           rdempty,
                                           wrempty,
                                           wrfull,
                                           wrusedw
                                        )
;

  output  [ 35: 0] q;
  output           rdempty;
  output           wrempty;
  output           wrfull;
  output  [  8: 0] wrusedw;
  input            aclr;
  input   [ 35: 0] data;
  input            rdclk;
  input            rdreq;
  input            wrclk;
  input            wrreq;

  wire             int_wrfull;
  wire    [ 35: 0] q;
  wire             rdempty;
  wire             wrempty;
  wire             wrfull;
  wire    [  8: 0] wrusedw;
  assign wrfull = (wrusedw >= 512-3) | int_wrfull;
  dcfifo dual_clock_fifo
    (
      .aclr (aclr),
      .data (data),
      .q (q),
      .rdclk (rdclk),
      .rdempty (rdempty),
      .rdreq (rdreq),
      .wrclk (wrclk),
      .wrempty (wrempty),
      .wrfull (int_wrfull),
      .wrreq (wrreq),
      .wrusedw (wrusedw)
    );

  defparam dual_clock_fifo.add_ram_output_register = "OFF",
           dual_clock_fifo.clocks_are_synchronized = "FALSE",
           dual_clock_fifo.intended_device_family = "CYCLONEIVE",
           dual_clock_fifo.lpm_numwords = 512,
           dual_clock_fifo.lpm_showahead = "OFF",
           dual_clock_fifo.lpm_type = "dcfifo",
           dual_clock_fifo.lpm_width = 36,
           dual_clock_fifo.lpm_widthu = 9,
           dual_clock_fifo.overflow_checking = "ON",
           dual_clock_fifo.underflow_checking = "ON",
           dual_clock_fifo.use_eab = "ON";


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_simple_fifo_dcfifo_with_controls (
                                               // inputs:
                                                data,
                                                rdclk,
                                                rdreq,
                                                wrclk,
                                                wrclk_control_slave_address,
                                                wrclk_control_slave_read,
                                                wrclk_control_slave_write,
                                                wrclk_control_slave_writedata,
                                                wrreq,
                                                wrreset_n,

                                               // outputs:
                                                q,
                                                rdempty,
                                                wrclk_control_slave_irq,
                                                wrclk_control_slave_readdata,
                                                wrfull,
                                                wrlevel
                                             )
;

  output  [ 35: 0] q;
  output           rdempty;
  output           wrclk_control_slave_irq;
  output  [ 31: 0] wrclk_control_slave_readdata;
  output           wrfull;
  output  [  9: 0] wrlevel;
  input   [ 35: 0] data;
  input            rdclk;
  input            rdreq;
  input            wrclk;
  input   [  2: 0] wrclk_control_slave_address;
  input            wrclk_control_slave_read;
  input            wrclk_control_slave_write;
  input   [ 31: 0] wrclk_control_slave_writedata;
  input            wrreq;
  input            wrreset_n;

  wire    [ 35: 0] q;
  wire             rdempty;
  reg              wrclk_control_slave_almostempty_n_reg;
  wire             wrclk_control_slave_almostempty_pulse;
  wire             wrclk_control_slave_almostempty_signal;
  reg     [  9: 0] wrclk_control_slave_almostempty_threshold_register;
  reg              wrclk_control_slave_almostfull_n_reg;
  wire             wrclk_control_slave_almostfull_pulse;
  wire             wrclk_control_slave_almostfull_signal;
  reg     [  9: 0] wrclk_control_slave_almostfull_threshold_register;
  reg              wrclk_control_slave_empty_n_reg;
  wire             wrclk_control_slave_empty_pulse;
  wire             wrclk_control_slave_empty_signal;
  reg              wrclk_control_slave_event_almostempty_q;
  wire             wrclk_control_slave_event_almostempty_signal;
  reg              wrclk_control_slave_event_almostfull_q;
  wire             wrclk_control_slave_event_almostfull_signal;
  reg              wrclk_control_slave_event_empty_q;
  wire             wrclk_control_slave_event_empty_signal;
  reg              wrclk_control_slave_event_full_q;
  wire             wrclk_control_slave_event_full_signal;
  reg              wrclk_control_slave_event_overflow_q;
  wire             wrclk_control_slave_event_overflow_signal;
  wire    [  5: 0] wrclk_control_slave_event_register;
  reg              wrclk_control_slave_event_underflow_q;
  wire             wrclk_control_slave_event_underflow_signal;
  reg              wrclk_control_slave_full_n_reg;
  wire             wrclk_control_slave_full_pulse;
  wire             wrclk_control_slave_full_signal;
  reg     [  5: 0] wrclk_control_slave_ienable_register;
  wire             wrclk_control_slave_irq;
  wire    [  9: 0] wrclk_control_slave_level_register;
  wire    [ 31: 0] wrclk_control_slave_read_mux;
  reg     [ 31: 0] wrclk_control_slave_readdata;
  reg              wrclk_control_slave_status_almostempty_q;
  wire             wrclk_control_slave_status_almostempty_signal;
  reg              wrclk_control_slave_status_almostfull_q;
  wire             wrclk_control_slave_status_almostfull_signal;
  reg              wrclk_control_slave_status_empty_q;
  wire             wrclk_control_slave_status_empty_signal;
  reg              wrclk_control_slave_status_full_q;
  wire             wrclk_control_slave_status_full_signal;
  reg              wrclk_control_slave_status_overflow_q;
  wire             wrclk_control_slave_status_overflow_signal;
  wire    [  5: 0] wrclk_control_slave_status_register;
  reg              wrclk_control_slave_status_underflow_q;
  wire             wrclk_control_slave_status_underflow_signal;
  wire    [  9: 0] wrclk_control_slave_threshold_writedata;
  wire             wrempty;
  wire             wrfull;
  wire    [  9: 0] wrlevel;
  wire             wroverflow;
  wire             wrreq_valid;
  wire             wrunderflow;
  wire    [  8: 0] wrusedw;
  //the_dcfifo, which is an e_instance
  nios_simple_fifo_dual_clock_fifo the_dcfifo
    (
      .aclr    (~wrreset_n),
      .data    (data),
      .q       (q),
      .rdclk   (rdclk),
      .rdempty (rdempty),
      .rdreq   (rdreq),
      .wrclk   (wrclk),
      .wrempty (wrempty),
      .wrfull  (wrfull),
      .wrreq   (wrreq_valid),
      .wrusedw (wrusedw)
    );

  assign wrlevel = {1'b0,
    wrusedw};

  assign wrreq_valid = wrreq & ~wrfull;
  assign wroverflow = wrreq & wrfull;
  assign wrunderflow = rdreq & wrempty;
  assign wrclk_control_slave_threshold_writedata = (wrclk_control_slave_writedata < 1) ? 1 :
    (wrclk_control_slave_writedata > 508) ? 508 :
    wrclk_control_slave_writedata[9 : 0];

  assign wrclk_control_slave_event_almostfull_signal = wrclk_control_slave_almostfull_pulse;
  assign wrclk_control_slave_event_almostempty_signal = wrclk_control_slave_almostempty_pulse;
  assign wrclk_control_slave_status_almostfull_signal = wrclk_control_slave_almostfull_signal;
  assign wrclk_control_slave_status_almostempty_signal = wrclk_control_slave_almostempty_signal;
  assign wrclk_control_slave_event_full_signal = wrclk_control_slave_full_pulse;
  assign wrclk_control_slave_event_empty_signal = wrclk_control_slave_empty_pulse;
  assign wrclk_control_slave_status_full_signal = wrclk_control_slave_full_signal;
  assign wrclk_control_slave_status_empty_signal = wrclk_control_slave_empty_signal;
  assign wrclk_control_slave_event_overflow_signal = wroverflow;
  assign wrclk_control_slave_event_underflow_signal = wrunderflow;
  assign wrclk_control_slave_status_overflow_signal = wroverflow;
  assign wrclk_control_slave_status_underflow_signal = wrunderflow;
  assign wrclk_control_slave_empty_signal = wrempty;
  assign wrclk_control_slave_empty_pulse = wrclk_control_slave_empty_signal & wrclk_control_slave_empty_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_empty_n_reg <= 0;
      else 
        wrclk_control_slave_empty_n_reg <= !wrclk_control_slave_empty_signal;
    end


  assign wrclk_control_slave_full_signal = wrfull;
  assign wrclk_control_slave_full_pulse = wrclk_control_slave_full_signal & wrclk_control_slave_full_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_full_n_reg <= 0;
      else 
        wrclk_control_slave_full_n_reg <= !wrclk_control_slave_full_signal;
    end


  assign wrclk_control_slave_almostempty_signal = wrlevel <= wrclk_control_slave_almostempty_threshold_register;
  assign wrclk_control_slave_almostempty_pulse = wrclk_control_slave_almostempty_signal & wrclk_control_slave_almostempty_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostempty_n_reg <= 0;
      else 
        wrclk_control_slave_almostempty_n_reg <= !wrclk_control_slave_almostempty_signal;
    end


  assign wrclk_control_slave_almostfull_signal = wrlevel >= wrclk_control_slave_almostfull_threshold_register;
  assign wrclk_control_slave_almostfull_pulse = wrclk_control_slave_almostfull_signal & wrclk_control_slave_almostfull_n_reg;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostfull_n_reg <= 0;
      else 
        wrclk_control_slave_almostfull_n_reg <= !wrclk_control_slave_almostfull_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostempty_threshold_register <= 1;
      else if ((wrclk_control_slave_address == 5) & wrclk_control_slave_write)
          wrclk_control_slave_almostempty_threshold_register <= wrclk_control_slave_threshold_writedata;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_almostfull_threshold_register <= 508;
      else if ((wrclk_control_slave_address == 4) & wrclk_control_slave_write)
          wrclk_control_slave_almostfull_threshold_register <= wrclk_control_slave_threshold_writedata;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_ienable_register <= 0;
      else if ((wrclk_control_slave_address == 3) & wrclk_control_slave_write)
          wrclk_control_slave_ienable_register <= wrclk_control_slave_writedata[5 : 0];
    end


  assign wrclk_control_slave_level_register = wrlevel;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_underflow_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[5])
          wrclk_control_slave_event_underflow_q <= 0;
      else if (wrclk_control_slave_event_underflow_signal)
          wrclk_control_slave_event_underflow_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_overflow_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[4])
          wrclk_control_slave_event_overflow_q <= 0;
      else if (wrclk_control_slave_event_overflow_signal)
          wrclk_control_slave_event_overflow_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_almostempty_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[3])
          wrclk_control_slave_event_almostempty_q <= 0;
      else if (wrclk_control_slave_event_almostempty_signal)
          wrclk_control_slave_event_almostempty_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_almostfull_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[2])
          wrclk_control_slave_event_almostfull_q <= 0;
      else if (wrclk_control_slave_event_almostfull_signal)
          wrclk_control_slave_event_almostfull_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_empty_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[1])
          wrclk_control_slave_event_empty_q <= 0;
      else if (wrclk_control_slave_event_empty_signal)
          wrclk_control_slave_event_empty_q <= -1;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_event_full_q <= 0;
      else if (wrclk_control_slave_write & 
                               (wrclk_control_slave_address == 2) &
                               wrclk_control_slave_writedata[0])
          wrclk_control_slave_event_full_q <= 0;
      else if (wrclk_control_slave_event_full_signal)
          wrclk_control_slave_event_full_q <= -1;
    end


  assign wrclk_control_slave_event_register = {wrclk_control_slave_event_underflow_q,
    wrclk_control_slave_event_overflow_q,
    wrclk_control_slave_event_almostempty_q,
    wrclk_control_slave_event_almostfull_q,
    wrclk_control_slave_event_empty_q,
    wrclk_control_slave_event_full_q};

  assign wrclk_control_slave_irq = | (wrclk_control_slave_event_register & wrclk_control_slave_ienable_register);
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_underflow_q <= 0;
      else 
        wrclk_control_slave_status_underflow_q <= wrclk_control_slave_status_underflow_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_overflow_q <= 0;
      else 
        wrclk_control_slave_status_overflow_q <= wrclk_control_slave_status_overflow_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_almostempty_q <= 0;
      else 
        wrclk_control_slave_status_almostempty_q <= wrclk_control_slave_status_almostempty_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_almostfull_q <= 0;
      else 
        wrclk_control_slave_status_almostfull_q <= wrclk_control_slave_status_almostfull_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_empty_q <= 0;
      else 
        wrclk_control_slave_status_empty_q <= wrclk_control_slave_status_empty_signal;
    end


  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_status_full_q <= 0;
      else 
        wrclk_control_slave_status_full_q <= wrclk_control_slave_status_full_signal;
    end


  assign wrclk_control_slave_status_register = {wrclk_control_slave_status_underflow_q,
    wrclk_control_slave_status_overflow_q,
    wrclk_control_slave_status_almostempty_q,
    wrclk_control_slave_status_almostfull_q,
    wrclk_control_slave_status_empty_q,
    wrclk_control_slave_status_full_q};

  assign wrclk_control_slave_read_mux = ({32 {(wrclk_control_slave_address == 0)}} & wrclk_control_slave_level_register) |
    ({32 {(wrclk_control_slave_address == 1)}} & wrclk_control_slave_status_register) |
    ({32 {(wrclk_control_slave_address == 2)}} & wrclk_control_slave_event_register) |
    ({32 {(wrclk_control_slave_address == 3)}} & wrclk_control_slave_ienable_register) |
    ({32 {(wrclk_control_slave_address == 4)}} & wrclk_control_slave_almostfull_threshold_register) |
    ({32 {(wrclk_control_slave_address == 5)}} & wrclk_control_slave_almostempty_threshold_register) |
    ({32 {(~((wrclk_control_slave_address == 0))) && (~((wrclk_control_slave_address == 1))) && (~((wrclk_control_slave_address == 2))) && (~((wrclk_control_slave_address == 3))) && (~((wrclk_control_slave_address == 4))) && (~((wrclk_control_slave_address == 5)))}} & wrclk_control_slave_level_register);

  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          wrclk_control_slave_readdata <= 0;
      else if (wrclk_control_slave_read)
          wrclk_control_slave_readdata <= wrclk_control_slave_read_mux;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_simple_fifo (
                          // inputs:
                           avalonst_sink_data,
                           avalonst_sink_empty,
                           avalonst_sink_endofpacket,
                           avalonst_sink_startofpacket,
                           avalonst_sink_valid,
                           avalonst_source_ready,
                           rdclock,
                           rdreset_n,
                           wrclk_control_slave_address,
                           wrclk_control_slave_read,
                           wrclk_control_slave_write,
                           wrclk_control_slave_writedata,
                           wrclock,
                           wrreset_n,

                          // outputs:
                           avalonst_sink_ready,
                           avalonst_source_data,
                           avalonst_source_empty,
                           avalonst_source_endofpacket,
                           avalonst_source_startofpacket,
                           avalonst_source_valid,
                           wrclk_control_slave_irq,
                           wrclk_control_slave_readdata
                        )
;

  output           avalonst_sink_ready;
  output  [ 31: 0] avalonst_source_data;
  output  [  1: 0] avalonst_source_empty;
  output           avalonst_source_endofpacket;
  output           avalonst_source_startofpacket;
  output           avalonst_source_valid;
  output           wrclk_control_slave_irq;
  output  [ 31: 0] wrclk_control_slave_readdata;
  input   [ 31: 0] avalonst_sink_data;
  input   [  1: 0] avalonst_sink_empty;
  input            avalonst_sink_endofpacket;
  input            avalonst_sink_startofpacket;
  input            avalonst_sink_valid;
  input            avalonst_source_ready;
  input            rdclock;
  input            rdreset_n;
  input   [  2: 0] wrclk_control_slave_address;
  input            wrclk_control_slave_read;
  input            wrclk_control_slave_write;
  input   [ 31: 0] wrclk_control_slave_writedata;
  input            wrclock;
  input            wrreset_n;

  wire             avalonst_sink_ready;
  wire    [ 35: 0] avalonst_sink_signals;
  wire    [ 31: 0] avalonst_source_data;
  wire    [  1: 0] avalonst_source_empty;
  wire             avalonst_source_endofpacket;
  wire    [ 35: 0] avalonst_source_signals;
  wire             avalonst_source_startofpacket;
  reg              avalonst_source_valid;
  wire    [ 35: 0] data;
  wire             no_stop_write;
  reg              no_stop_write_d1;
  wire    [ 35: 0] q;
  wire             rdclk;
  wire             rdempty;
  wire             rdreq;
  wire             rdreset_to_be_optimized;
  wire             ready_0;
  wire             ready_1;
  wire             ready_selector;
  wire             wrclk;
  wire             wrclk_control_slave_irq;
  wire    [ 31: 0] wrclk_control_slave_readdata;
  wire             wrfull;
  wire    [  9: 0] wrlevel;
  wire             wrreq;
  assign rdreset_to_be_optimized = rdreset_n;
  //the_dcfifo_with_controls, which is an e_instance
  nios_simple_fifo_dcfifo_with_controls the_dcfifo_with_controls
    (
      .data                          (data),
      .q                             (q),
      .rdclk                         (rdclk),
      .rdempty                       (rdempty),
      .rdreq                         (rdreq),
      .wrclk                         (wrclk),
      .wrclk_control_slave_address   (wrclk_control_slave_address),
      .wrclk_control_slave_irq       (wrclk_control_slave_irq),
      .wrclk_control_slave_read      (wrclk_control_slave_read),
      .wrclk_control_slave_readdata  (wrclk_control_slave_readdata),
      .wrclk_control_slave_write     (wrclk_control_slave_write),
      .wrclk_control_slave_writedata (wrclk_control_slave_writedata),
      .wrfull                        (wrfull),
      .wrlevel                       (wrlevel),
      .wrreq                         (wrreq),
      .wrreset_n                     (wrreset_n)
    );

  //in, which is an e_atlantic_slave
  //out, which is an e_atlantic_master
  assign avalonst_sink_signals = {avalonst_sink_startofpacket,
    avalonst_sink_endofpacket,
    avalonst_sink_empty,
    avalonst_sink_data};

  assign {avalonst_source_startofpacket,
avalonst_source_endofpacket,
avalonst_source_empty,
avalonst_source_data} = avalonst_source_signals;
  assign no_stop_write = (ready_selector & ready_1) | (!ready_selector & ready_0);
  assign wrreq = avalonst_sink_valid & no_stop_write_d1;
  assign ready_1 = !wrfull;
  assign ready_0 = !wrfull & !avalonst_sink_valid;
  assign ready_selector = wrlevel < 508;
  always @(posedge wrclk or negedge wrreset_n)
    begin
      if (wrreset_n == 0)
          no_stop_write_d1 <= 0;
      else 
        no_stop_write_d1 <= no_stop_write;
    end


  assign data = avalonst_sink_signals;
  assign avalonst_source_signals = q;
  assign wrclk = wrclock;
  assign rdclk = rdclock;
  assign avalonst_sink_ready = no_stop_write & no_stop_write_d1;
  always @(posedge rdclock or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          avalonst_source_valid <= 0;
      else 
        avalonst_source_valid <= avalonst_source_ready & !rdempty;
    end


  assign rdreq = avalonst_source_ready & !rdempty;
  //in_csr, which is an e_avalon_slave

endmodule

