//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
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

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                           cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 27: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] cpu_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 27: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 27: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[27 : 11] , 11'b0} == 28'ha410800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_data_master_read_data_valid_cpu_jtag_debug_module = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[27 : 11] , 11'b0} == 28'ha410800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (|cpu_instruction_master_read_data_valid_sdram_s1_shift_register))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sys_clk_timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                            // inputs:
                                                                             clk,
                                                                             data_in,
                                                                             reset_n,

                                                                            // outputs:
                                                                             data_out
                                                                          )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module touch_panel_pen_irq_n_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                                    // inputs:
                                                                                     clk,
                                                                                     data_in,
                                                                                     reset_n,

                                                                                    // outputs:
                                                                                     data_out
                                                                                  )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module touch_panel_spi_spi_control_port_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                                            // inputs:
                                                                                             clk,
                                                                                             data_in,
                                                                                             reset_n,

                                                                                            // outputs:
                                                                                             data_out
                                                                                          )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     cfi_flash_s1_wait_counter_eq_0,
                                     clk,
                                     clk_sys,
                                     clk_sys_reset_n,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable,
                                     cpu_data_master_byteenable_cfi_flash_s1,
                                     cpu_data_master_byteenable_sram_avalon_slave,
                                     cpu_data_master_granted_cfi_flash_s1,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_descriptor_mem_s1,
                                     cpu_data_master_granted_fifo_in_csr,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_nios_simple_clock_0_in,
                                     cpu_data_master_granted_peripheral_bridge_s1,
                                     cpu_data_master_granted_sdram_s1,
                                     cpu_data_master_granted_sgdma_pixel_csr,
                                     cpu_data_master_granted_sram_avalon_slave,
                                     cpu_data_master_granted_sysid_control_slave,
                                     cpu_data_master_qualified_request_cfi_flash_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_descriptor_mem_s1,
                                     cpu_data_master_qualified_request_fifo_in_csr,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_nios_simple_clock_0_in,
                                     cpu_data_master_qualified_request_peripheral_bridge_s1,
                                     cpu_data_master_qualified_request_sdram_s1,
                                     cpu_data_master_qualified_request_sgdma_pixel_csr,
                                     cpu_data_master_qualified_request_sram_avalon_slave,
                                     cpu_data_master_qualified_request_sysid_control_slave,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_cfi_flash_s1,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_descriptor_mem_s1,
                                     cpu_data_master_read_data_valid_fifo_in_csr,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_nios_simple_clock_0_in,
                                     cpu_data_master_read_data_valid_peripheral_bridge_s1,
                                     cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                     cpu_data_master_read_data_valid_sdram_s1,
                                     cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                     cpu_data_master_read_data_valid_sgdma_pixel_csr,
                                     cpu_data_master_read_data_valid_sram_avalon_slave,
                                     cpu_data_master_read_data_valid_sysid_control_slave,
                                     cpu_data_master_requests_cfi_flash_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_descriptor_mem_s1,
                                     cpu_data_master_requests_fifo_in_csr,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_nios_simple_clock_0_in,
                                     cpu_data_master_requests_peripheral_bridge_s1,
                                     cpu_data_master_requests_sdram_s1,
                                     cpu_data_master_requests_sgdma_pixel_csr,
                                     cpu_data_master_requests_sram_avalon_slave,
                                     cpu_data_master_requests_sysid_control_slave,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_descriptor_mem_s1_end_xfer,
                                     d1_fifo_in_csr_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_nios_simple_clock_0_in_end_xfer,
                                     d1_peripheral_bridge_s1_end_xfer,
                                     d1_sdram_s1_end_xfer,
                                     d1_sgdma_pixel_csr_end_xfer,
                                     d1_sram_avalon_slave_end_xfer,
                                     d1_sysid_control_slave_end_xfer,
                                     d1_tri_state_bridge_flash_avalon_slave_end_xfer,
                                     descriptor_mem_s1_readdata_from_sa,
                                     fifo_in_csr_irq_from_sa,
                                     fifo_in_csr_readdata_from_sa,
                                     incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     nios_simple_clock_0_in_readdata_from_sa,
                                     nios_simple_clock_0_in_waitrequest_from_sa,
                                     peripheral_bridge_s1_readdata_from_sa,
                                     peripheral_bridge_s1_waitrequest_from_sa,
                                     reset_n,
                                     sdram_s1_readdata_from_sa,
                                     sdram_s1_waitrequest_from_sa,
                                     sgdma_pixel_csr_irq_from_sa,
                                     sgdma_pixel_csr_readdata_from_sa,
                                     sram_avalon_slave_readdata_from_sa,
                                     sram_avalon_slave_wait_counter_eq_0,
                                     sys_clk_timer_s1_irq_from_sa,
                                     sysid_control_slave_readdata_from_sa,
                                     touch_panel_pen_irq_n_s1_irq_from_sa,
                                     touch_panel_spi_spi_control_port_irq_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_dbs_address,
                                     cpu_data_master_dbs_write_16,
                                     cpu_data_master_dbs_write_8,
                                     cpu_data_master_irq,
                                     cpu_data_master_latency_counter,
                                     cpu_data_master_readdata,
                                     cpu_data_master_readdatavalid,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 27: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [  7: 0] cpu_data_master_dbs_write_8;
  output  [ 31: 0] cpu_data_master_irq;
  output  [  1: 0] cpu_data_master_latency_counter;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_readdatavalid;
  output           cpu_data_master_waitrequest;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            clk;
  input            clk_sys;
  input            clk_sys_reset_n;
  input   [ 27: 0] cpu_data_master_address;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_byteenable_cfi_flash_s1;
  input   [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  input            cpu_data_master_granted_cfi_flash_s1;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_descriptor_mem_s1;
  input            cpu_data_master_granted_fifo_in_csr;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_nios_simple_clock_0_in;
  input            cpu_data_master_granted_peripheral_bridge_s1;
  input            cpu_data_master_granted_sdram_s1;
  input            cpu_data_master_granted_sgdma_pixel_csr;
  input            cpu_data_master_granted_sram_avalon_slave;
  input            cpu_data_master_granted_sysid_control_slave;
  input            cpu_data_master_qualified_request_cfi_flash_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_descriptor_mem_s1;
  input            cpu_data_master_qualified_request_fifo_in_csr;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_nios_simple_clock_0_in;
  input            cpu_data_master_qualified_request_peripheral_bridge_s1;
  input            cpu_data_master_qualified_request_sdram_s1;
  input            cpu_data_master_qualified_request_sgdma_pixel_csr;
  input            cpu_data_master_qualified_request_sram_avalon_slave;
  input            cpu_data_master_qualified_request_sysid_control_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cfi_flash_s1;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_descriptor_mem_s1;
  input            cpu_data_master_read_data_valid_fifo_in_csr;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_nios_simple_clock_0_in;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_read_data_valid_sgdma_pixel_csr;
  input            cpu_data_master_read_data_valid_sram_avalon_slave;
  input            cpu_data_master_read_data_valid_sysid_control_slave;
  input            cpu_data_master_requests_cfi_flash_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_descriptor_mem_s1;
  input            cpu_data_master_requests_fifo_in_csr;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_nios_simple_clock_0_in;
  input            cpu_data_master_requests_peripheral_bridge_s1;
  input            cpu_data_master_requests_sdram_s1;
  input            cpu_data_master_requests_sgdma_pixel_csr;
  input            cpu_data_master_requests_sram_avalon_slave;
  input            cpu_data_master_requests_sysid_control_slave;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_descriptor_mem_s1_end_xfer;
  input            d1_fifo_in_csr_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_nios_simple_clock_0_in_end_xfer;
  input            d1_peripheral_bridge_s1_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_sgdma_pixel_csr_end_xfer;
  input            d1_sram_avalon_slave_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  input   [ 31: 0] descriptor_mem_s1_readdata_from_sa;
  input            fifo_in_csr_irq_from_sa;
  input   [ 31: 0] fifo_in_csr_readdata_from_sa;
  input   [  7: 0] incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input   [ 31: 0] nios_simple_clock_0_in_readdata_from_sa;
  input            nios_simple_clock_0_in_waitrequest_from_sa;
  input   [ 31: 0] peripheral_bridge_s1_readdata_from_sa;
  input            peripheral_bridge_s1_waitrequest_from_sa;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input            sgdma_pixel_csr_irq_from_sa;
  input   [ 31: 0] sgdma_pixel_csr_readdata_from_sa;
  input   [ 15: 0] sram_avalon_slave_readdata_from_sa;
  input            sram_avalon_slave_wait_counter_eq_0;
  input            sys_clk_timer_s1_irq_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            touch_panel_pen_irq_n_s1_irq_from_sa;
  input            touch_panel_spi_spi_control_port_irq_from_sa;

  reg              active_and_waiting_last_time;
  wire             clk_sys_sys_clk_timer_s1_irq_from_sa;
  wire             clk_sys_touch_panel_pen_irq_n_s1_irq_from_sa;
  wire             clk_sys_touch_panel_spi_spi_control_port_irq_from_sa;
  reg     [ 27: 0] cpu_data_master_address_last_time;
  wire    [ 27: 0] cpu_data_master_address_to_slave;
  reg     [  3: 0] cpu_data_master_byteenable_last_time;
  reg     [  1: 0] cpu_data_master_dbs_address;
  wire    [  1: 0] cpu_data_master_dbs_increment;
  reg     [  1: 0] cpu_data_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_data_master_dbs_rdv_counter_inc;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_is_granted_some_slave;
  reg     [  1: 0] cpu_data_master_latency_counter;
  wire    [  1: 0] cpu_data_master_next_dbs_rdv_counter;
  reg              cpu_data_master_read_but_no_slave_selected;
  reg              cpu_data_master_read_last_time;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_run;
  wire             cpu_data_master_waitrequest;
  reg              cpu_data_master_write_last_time;
  reg     [ 31: 0] cpu_data_master_writedata_last_time;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_data_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_descriptor_mem_s1 | ~cpu_data_master_requests_descriptor_mem_s1) & (cpu_data_master_granted_descriptor_mem_s1 | ~cpu_data_master_qualified_request_descriptor_mem_s1) & ((~cpu_data_master_qualified_request_descriptor_mem_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_descriptor_mem_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_fifo_in_csr | ~cpu_data_master_requests_fifo_in_csr) & ((~cpu_data_master_qualified_request_fifo_in_csr | ~cpu_data_master_read | (1 & ~d1_fifo_in_csr_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_fifo_in_csr | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_nios_simple_clock_0_in | ~cpu_data_master_requests_nios_simple_clock_0_in);

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_data_master_qualified_request_nios_simple_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~nios_simple_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_nios_simple_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~nios_simple_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_peripheral_bridge_s1 | ~cpu_data_master_requests_peripheral_bridge_s1) & ((~cpu_data_master_qualified_request_peripheral_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~peripheral_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_peripheral_bridge_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~peripheral_bridge_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sdram_s1 | ~cpu_data_master_requests_sdram_s1) & (cpu_data_master_granted_sdram_s1 | ~cpu_data_master_qualified_request_sdram_s1) & ((~cpu_data_master_qualified_request_sdram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_sdram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sgdma_pixel_csr | ~cpu_data_master_requests_sgdma_pixel_csr) & ((~cpu_data_master_qualified_request_sgdma_pixel_csr | ~cpu_data_master_read | (1 & ~d1_sgdma_pixel_csr_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sgdma_pixel_csr | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sram_avalon_slave | (cpu_data_master_write & !cpu_data_master_byteenable_sram_avalon_slave & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_sram_avalon_slave) & (cpu_data_master_granted_sram_avalon_slave | ~cpu_data_master_qualified_request_sram_avalon_slave) & ((~cpu_data_master_qualified_request_sram_avalon_slave | ~cpu_data_master_read | (1 & ((sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sram_avalon_slave | ~cpu_data_master_write | (1 & ((sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1]) & cpu_data_master_write)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_requests_sysid_control_slave) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_read | (1 & ~d1_sysid_control_slave_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & ((cpu_data_master_qualified_request_cfi_flash_s1 | ((cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1 & cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0])) | ~cpu_data_master_requests_cfi_flash_s1)) & (cpu_data_master_granted_cfi_flash_s1 | ~cpu_data_master_qualified_request_cfi_flash_s1) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_read | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_write | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[27 : 0];

  //cpu_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_data_master_read_but_no_slave_selected <= cpu_data_master_read & cpu_data_master_run & ~cpu_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_data_master_is_granted_some_slave = cpu_data_master_granted_cpu_jtag_debug_module |
    cpu_data_master_granted_descriptor_mem_s1 |
    cpu_data_master_granted_fifo_in_csr |
    cpu_data_master_granted_jtag_uart_avalon_jtag_slave |
    cpu_data_master_granted_nios_simple_clock_0_in |
    cpu_data_master_granted_peripheral_bridge_s1 |
    cpu_data_master_granted_sdram_s1 |
    cpu_data_master_granted_sgdma_pixel_csr |
    cpu_data_master_granted_sram_avalon_slave |
    cpu_data_master_granted_sysid_control_slave |
    cpu_data_master_granted_cfi_flash_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_data_master_readdatavalid = cpu_data_master_read_data_valid_descriptor_mem_s1 |
    cpu_data_master_read_data_valid_peripheral_bridge_s1 |
    cpu_data_master_read_data_valid_sdram_s1 |
    (cpu_data_master_read_data_valid_cfi_flash_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_data_master_readdatavalid = cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_cpu_jtag_debug_module |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_fifo_in_csr |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_nios_simple_clock_0_in |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_sgdma_pixel_csr |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    (cpu_data_master_read_data_valid_sram_avalon_slave & dbs_counter_overflow) |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_sysid_control_slave |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid;

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~(cpu_data_master_qualified_request_cpu_jtag_debug_module & cpu_data_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_descriptor_mem_s1}} | descriptor_mem_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_fifo_in_csr & cpu_data_master_read)}} | fifo_in_csr_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave & cpu_data_master_read)}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_nios_simple_clock_0_in & cpu_data_master_read)}} | nios_simple_clock_0_in_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_peripheral_bridge_s1}} | peripheral_bridge_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_sdram_s1}} | sdram_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_sgdma_pixel_csr & cpu_data_master_read)}} | sgdma_pixel_csr_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_sram_avalon_slave & cpu_data_master_read)}} | {sram_avalon_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~(cpu_data_master_qualified_request_sysid_control_slave & cpu_data_master_read)}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_cfi_flash_s1}} | {incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_data_master_waitrequest = ~cpu_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_latency_counter <= 0;
      else 
        cpu_data_master_latency_counter <= p1_cpu_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_data_master_latency_counter = ((cpu_data_master_run & cpu_data_master_read))? latency_load_value :
    (cpu_data_master_latency_counter)? cpu_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({2 {cpu_data_master_requests_descriptor_mem_s1}} & 1) |
    ({2 {cpu_data_master_requests_cfi_flash_s1}} & 2);

  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    clk_sys_touch_panel_pen_irq_n_s1_irq_from_sa,
    clk_sys_touch_panel_spi_spi_control_port_irq_from_sa,
    clk_sys_sys_clk_timer_s1_irq_from_sa,
    jtag_uart_avalon_jtag_slave_irq_from_sa,
    fifo_in_csr_irq_from_sa,
    sgdma_pixel_csr_irq_from_sa};

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & cpu_data_master_requests_sram_avalon_slave & cpu_data_master_write & !cpu_data_master_byteenable_sram_avalon_slave)) |
    ((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read & 1 & 1 & ({sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer}))) |
    ((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_write & 1 & 1 & ({sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer}))) |
    (((~0) & cpu_data_master_requests_cfi_flash_s1 & cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1)) |
    ((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer}))) |
    ((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer})));

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = sram_avalon_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_data_master_dbs_write_16 = (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    cpu_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_data_master_dbs_increment = (cpu_data_master_requests_sram_avalon_slave)? 2 :
    (cpu_data_master_requests_cfi_flash_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_data_master_dbs_address + cpu_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_data_master_dbs_address <= next_dbs_address;
    end


  //sys_clk_timer_s1_irq_from_sa from clk_peripheral to clk_sys
  sys_clk_timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module sys_clk_timer_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (clk_sys),
      .data_in  (sys_clk_timer_s1_irq_from_sa),
      .data_out (clk_sys_sys_clk_timer_s1_irq_from_sa),
      .reset_n  (clk_sys_reset_n)
    );

  //touch_panel_pen_irq_n_s1_irq_from_sa from clk_peripheral to clk_sys
  touch_panel_pen_irq_n_s1_irq_from_sa_clock_crossing_cpu_data_master_module touch_panel_pen_irq_n_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (clk_sys),
      .data_in  (touch_panel_pen_irq_n_s1_irq_from_sa),
      .data_out (clk_sys_touch_panel_pen_irq_n_s1_irq_from_sa),
      .reset_n  (clk_sys_reset_n)
    );

  //touch_panel_spi_spi_control_port_irq_from_sa from clk_peripheral to clk_sys
  touch_panel_spi_spi_control_port_irq_from_sa_clock_crossing_cpu_data_master_module touch_panel_spi_spi_control_port_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (clk_sys),
      .data_in  (touch_panel_spi_spi_control_port_irq_from_sa),
      .data_out (clk_sys_touch_panel_spi_spi_control_port_irq_from_sa),
      .reset_n  (clk_sys_reset_n)
    );

  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end


  //mux write dbs 2, which is an e_mux
  assign cpu_data_master_dbs_write_8 = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_writedata[7 : 0] :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_writedata[15 : 8] :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_writedata[23 : 16] :
    cpu_data_master_writedata[31 : 24];

  //p1 dbs rdv counter, which is an e_assign
  assign cpu_data_master_next_dbs_rdv_counter = cpu_data_master_dbs_rdv_counter + cpu_data_master_dbs_rdv_counter_inc;

  //cpu_data_master_rdv_inc_mux, which is an e_mux
  assign cpu_data_master_dbs_rdv_counter_inc = 1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_data_master_read_data_valid_cfi_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_data_master_dbs_rdv_counter <= cpu_data_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_data_master_dbs_rdv_counter[1] & ~cpu_data_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_address_last_time <= 0;
      else 
        cpu_data_master_address_last_time <= cpu_data_master_address;
    end


  //cpu/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_data_master_waitrequest & (cpu_data_master_read | cpu_data_master_write);
    end


  //cpu_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_address != cpu_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_byteenable_last_time <= 0;
      else 
        cpu_data_master_byteenable_last_time <= cpu_data_master_byteenable;
    end


  //cpu_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_byteenable != cpu_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_last_time <= 0;
      else 
        cpu_data_master_read_last_time <= cpu_data_master_read;
    end


  //cpu_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_read != cpu_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_write_last_time <= 0;
      else 
        cpu_data_master_write_last_time <= cpu_data_master_write;
    end


  //cpu_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_write != cpu_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_writedata_last_time <= 0;
      else 
        cpu_data_master_writedata_last_time <= cpu_data_master_writedata;
    end


  //cpu_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_writedata != cpu_data_master_writedata_last_time) & cpu_data_master_write)
        begin
          $write("%0d ns: cpu_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            cfi_flash_s1_wait_counter_eq_0,
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cfi_flash_s1,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_sdram_s1,
                                            cpu_instruction_master_granted_sram_avalon_slave,
                                            cpu_instruction_master_qualified_request_cfi_flash_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_sdram_s1,
                                            cpu_instruction_master_qualified_request_sram_avalon_slave,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_sdram_s1,
                                            cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                                            cpu_instruction_master_read_data_valid_sram_avalon_slave,
                                            cpu_instruction_master_requests_cfi_flash_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_sdram_s1,
                                            cpu_instruction_master_requests_sram_avalon_slave,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_sdram_s1_end_xfer,
                                            d1_sram_avalon_slave_end_xfer,
                                            d1_tri_state_bridge_flash_avalon_slave_end_xfer,
                                            incoming_tri_state_bridge_flash_data,
                                            reset_n,
                                            sdram_s1_readdata_from_sa,
                                            sdram_s1_waitrequest_from_sa,
                                            sram_avalon_slave_readdata_from_sa,
                                            sram_avalon_slave_wait_counter_eq_0,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 27: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output  [  1: 0] cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            clk;
  input   [ 27: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cfi_flash_s1;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_sdram_s1;
  input            cpu_instruction_master_granted_sram_avalon_slave;
  input            cpu_instruction_master_qualified_request_cfi_flash_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_sdram_s1;
  input            cpu_instruction_master_qualified_request_sram_avalon_slave;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cfi_flash_s1;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_sdram_s1;
  input            cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_instruction_master_read_data_valid_sram_avalon_slave;
  input            cpu_instruction_master_requests_cfi_flash_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_sdram_s1;
  input            cpu_instruction_master_requests_sram_avalon_slave;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_sram_avalon_slave_end_xfer;
  input            d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  input   [  7: 0] incoming_tri_state_bridge_flash_data;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input   [ 15: 0] sram_avalon_slave_readdata_from_sa;
  input            sram_avalon_slave_wait_counter_eq_0;

  reg              active_and_waiting_last_time;
  reg     [ 27: 0] cpu_instruction_master_address_last_time;
  wire    [ 27: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg     [  1: 0] cpu_instruction_master_latency_counter;
  wire    [  1: 0] cpu_instruction_master_next_dbs_rdv_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_instruction_master_qualified_request_sdram_s1 | ~cpu_instruction_master_requests_sdram_s1) & (cpu_instruction_master_granted_sdram_s1 | ~cpu_instruction_master_qualified_request_sdram_s1) & ((~cpu_instruction_master_qualified_request_sdram_s1 | ~(cpu_instruction_master_read) | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_instruction_master_read)))) & 1 & (cpu_instruction_master_qualified_request_sram_avalon_slave | ~cpu_instruction_master_requests_sram_avalon_slave) & (cpu_instruction_master_granted_sram_avalon_slave | ~cpu_instruction_master_qualified_request_sram_avalon_slave) & ((~cpu_instruction_master_qualified_request_sram_avalon_slave | ~cpu_instruction_master_read | (1 & ((sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer)) & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_instruction_master_qualified_request_cfi_flash_s1 | ~cpu_instruction_master_requests_cfi_flash_s1) & (cpu_instruction_master_granted_cfi_flash_s1 | ~cpu_instruction_master_qualified_request_cfi_flash_s1) & ((~cpu_instruction_master_qualified_request_cfi_flash_s1 | ~cpu_instruction_master_read | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer)) & (cpu_instruction_master_dbs_address[1] & cpu_instruction_master_dbs_address[0]) & cpu_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[27 : 0];

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_sdram_s1 |
    cpu_instruction_master_granted_sram_avalon_slave |
    cpu_instruction_master_granted_cfi_flash_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_sdram_s1 |
    (cpu_instruction_master_read_data_valid_cfi_flash_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    (cpu_instruction_master_read_data_valid_sram_avalon_slave & dbs_counter_overflow) |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_sdram_s1}} | sdram_s1_readdata_from_sa) &
    ({32 {~(cpu_instruction_master_qualified_request_sram_avalon_slave & cpu_instruction_master_read)}} | {sram_avalon_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_instruction_master_read_data_valid_cfi_flash_s1}} | {incoming_tri_state_bridge_flash_data[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else 
        cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {2 {cpu_instruction_master_requests_cfi_flash_s1}} & 2;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = sram_avalon_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_instruction_master_dbs_increment = (cpu_instruction_master_requests_sram_avalon_slave)? 2 :
    (cpu_instruction_master_requests_cfi_flash_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_instruction_master_dbs_address + cpu_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = ((cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read & 1 & 1 & ({sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer}))) |
    ((cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer})));

  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = incoming_tri_state_bridge_flash_data;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = incoming_tri_state_bridge_flash_data;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = incoming_tri_state_bridge_flash_data;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_instruction_master_next_dbs_rdv_counter = cpu_instruction_master_dbs_rdv_counter + cpu_instruction_master_dbs_rdv_counter_inc;

  //cpu_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_instruction_master_dbs_rdv_counter_inc = 1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_instruction_master_read_data_valid_cfi_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_instruction_master_dbs_rdv_counter <= cpu_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_instruction_master_dbs_rdv_counter[1] & ~cpu_instruction_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module descriptor_mem_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_byteenable,
                                       cpu_data_master_latency_counter,
                                       cpu_data_master_read,
                                       cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                       cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                       cpu_data_master_write,
                                       cpu_data_master_writedata,
                                       descriptor_mem_s1_readdata,
                                       reset_n,
                                       sgdma_pixel_descriptor_read_address_to_slave,
                                       sgdma_pixel_descriptor_read_latency_counter,
                                       sgdma_pixel_descriptor_read_read,
                                       sgdma_pixel_descriptor_write_address_to_slave,
                                       sgdma_pixel_descriptor_write_write,
                                       sgdma_pixel_descriptor_write_writedata,

                                      // outputs:
                                       cpu_data_master_granted_descriptor_mem_s1,
                                       cpu_data_master_qualified_request_descriptor_mem_s1,
                                       cpu_data_master_read_data_valid_descriptor_mem_s1,
                                       cpu_data_master_requests_descriptor_mem_s1,
                                       d1_descriptor_mem_s1_end_xfer,
                                       descriptor_mem_s1_address,
                                       descriptor_mem_s1_byteenable,
                                       descriptor_mem_s1_chipselect,
                                       descriptor_mem_s1_clken,
                                       descriptor_mem_s1_readdata_from_sa,
                                       descriptor_mem_s1_reset,
                                       descriptor_mem_s1_write,
                                       descriptor_mem_s1_writedata,
                                       sgdma_pixel_descriptor_read_granted_descriptor_mem_s1,
                                       sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1,
                                       sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1,
                                       sgdma_pixel_descriptor_read_requests_descriptor_mem_s1,
                                       sgdma_pixel_descriptor_write_granted_descriptor_mem_s1,
                                       sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1,
                                       sgdma_pixel_descriptor_write_requests_descriptor_mem_s1
                                    )
;

  output           cpu_data_master_granted_descriptor_mem_s1;
  output           cpu_data_master_qualified_request_descriptor_mem_s1;
  output           cpu_data_master_read_data_valid_descriptor_mem_s1;
  output           cpu_data_master_requests_descriptor_mem_s1;
  output           d1_descriptor_mem_s1_end_xfer;
  output  [ 13: 0] descriptor_mem_s1_address;
  output  [  3: 0] descriptor_mem_s1_byteenable;
  output           descriptor_mem_s1_chipselect;
  output           descriptor_mem_s1_clken;
  output  [ 31: 0] descriptor_mem_s1_readdata_from_sa;
  output           descriptor_mem_s1_reset;
  output           descriptor_mem_s1_write;
  output  [ 31: 0] descriptor_mem_s1_writedata;
  output           sgdma_pixel_descriptor_read_granted_descriptor_mem_s1;
  output           sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1;
  output           sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1;
  output           sgdma_pixel_descriptor_read_requests_descriptor_mem_s1;
  output           sgdma_pixel_descriptor_write_granted_descriptor_mem_s1;
  output           sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1;
  output           sgdma_pixel_descriptor_write_requests_descriptor_mem_s1;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] descriptor_mem_s1_readdata;
  input            reset_n;
  input   [ 31: 0] sgdma_pixel_descriptor_read_address_to_slave;
  input            sgdma_pixel_descriptor_read_latency_counter;
  input            sgdma_pixel_descriptor_read_read;
  input   [ 31: 0] sgdma_pixel_descriptor_write_address_to_slave;
  input            sgdma_pixel_descriptor_write_write;
  input   [ 31: 0] sgdma_pixel_descriptor_write_writedata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_descriptor_mem_s1;
  wire             cpu_data_master_qualified_request_descriptor_mem_s1;
  wire             cpu_data_master_read_data_valid_descriptor_mem_s1;
  reg              cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register;
  wire             cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register_in;
  wire             cpu_data_master_requests_descriptor_mem_s1;
  wire             cpu_data_master_saved_grant_descriptor_mem_s1;
  reg              d1_descriptor_mem_s1_end_xfer;
  reg              d1_reasons_to_wait;
  wire    [ 13: 0] descriptor_mem_s1_address;
  wire             descriptor_mem_s1_allgrants;
  wire             descriptor_mem_s1_allow_new_arb_cycle;
  wire             descriptor_mem_s1_any_bursting_master_saved_grant;
  wire             descriptor_mem_s1_any_continuerequest;
  reg     [  2: 0] descriptor_mem_s1_arb_addend;
  wire             descriptor_mem_s1_arb_counter_enable;
  reg     [  3: 0] descriptor_mem_s1_arb_share_counter;
  wire    [  3: 0] descriptor_mem_s1_arb_share_counter_next_value;
  wire    [  3: 0] descriptor_mem_s1_arb_share_set_values;
  wire    [  2: 0] descriptor_mem_s1_arb_winner;
  wire             descriptor_mem_s1_arbitration_holdoff_internal;
  wire             descriptor_mem_s1_beginbursttransfer_internal;
  wire             descriptor_mem_s1_begins_xfer;
  wire    [  3: 0] descriptor_mem_s1_byteenable;
  wire             descriptor_mem_s1_chipselect;
  wire    [  5: 0] descriptor_mem_s1_chosen_master_double_vector;
  wire    [  2: 0] descriptor_mem_s1_chosen_master_rot_left;
  wire             descriptor_mem_s1_clken;
  wire             descriptor_mem_s1_end_xfer;
  wire             descriptor_mem_s1_firsttransfer;
  wire    [  2: 0] descriptor_mem_s1_grant_vector;
  wire             descriptor_mem_s1_in_a_read_cycle;
  wire             descriptor_mem_s1_in_a_write_cycle;
  wire    [  2: 0] descriptor_mem_s1_master_qreq_vector;
  wire             descriptor_mem_s1_non_bursting_master_requests;
  wire    [ 31: 0] descriptor_mem_s1_readdata_from_sa;
  reg              descriptor_mem_s1_reg_firsttransfer;
  wire             descriptor_mem_s1_reset;
  reg     [  2: 0] descriptor_mem_s1_saved_chosen_master_vector;
  reg              descriptor_mem_s1_slavearbiterlockenable;
  wire             descriptor_mem_s1_slavearbiterlockenable2;
  wire             descriptor_mem_s1_unreg_firsttransfer;
  wire             descriptor_mem_s1_waits_for_read;
  wire             descriptor_mem_s1_waits_for_write;
  wire             descriptor_mem_s1_write;
  wire    [ 31: 0] descriptor_mem_s1_writedata;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_descriptor_mem_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_descriptor_mem_s1;
  reg              last_cycle_sgdma_pixel_descriptor_read_granted_slave_descriptor_mem_s1;
  reg              last_cycle_sgdma_pixel_descriptor_write_granted_slave_descriptor_mem_s1;
  wire             p1_cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register;
  wire             p1_sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register;
  wire             sgdma_pixel_descriptor_read_arbiterlock;
  wire             sgdma_pixel_descriptor_read_arbiterlock2;
  wire             sgdma_pixel_descriptor_read_continuerequest;
  wire             sgdma_pixel_descriptor_read_granted_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1;
  reg              sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register;
  wire             sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register_in;
  wire             sgdma_pixel_descriptor_read_requests_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_read_saved_grant_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_write_arbiterlock;
  wire             sgdma_pixel_descriptor_write_arbiterlock2;
  wire             sgdma_pixel_descriptor_write_continuerequest;
  wire             sgdma_pixel_descriptor_write_granted_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_write_requests_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_write_saved_grant_descriptor_mem_s1;
  wire    [ 27: 0] shifted_address_to_descriptor_mem_s1_from_cpu_data_master;
  wire    [ 31: 0] shifted_address_to_descriptor_mem_s1_from_sgdma_pixel_descriptor_read;
  wire    [ 31: 0] shifted_address_to_descriptor_mem_s1_from_sgdma_pixel_descriptor_write;
  wire             wait_for_descriptor_mem_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~descriptor_mem_s1_end_xfer;
    end


  assign descriptor_mem_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_descriptor_mem_s1 | sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1 | sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1));
  //assign descriptor_mem_s1_readdata_from_sa = descriptor_mem_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign descriptor_mem_s1_readdata_from_sa = descriptor_mem_s1_readdata;

  assign cpu_data_master_requests_descriptor_mem_s1 = ({cpu_data_master_address_to_slave[27 : 16] , 16'b0} == 28'ha400000) & (cpu_data_master_read | cpu_data_master_write);
  //descriptor_mem_s1_arb_share_counter set values, which is an e_mux
  assign descriptor_mem_s1_arb_share_set_values = (sgdma_pixel_descriptor_read_granted_descriptor_mem_s1)? 10 :
    (sgdma_pixel_descriptor_write_granted_descriptor_mem_s1)? 10 :
    (sgdma_pixel_descriptor_read_granted_descriptor_mem_s1)? 10 :
    (sgdma_pixel_descriptor_write_granted_descriptor_mem_s1)? 10 :
    (sgdma_pixel_descriptor_read_granted_descriptor_mem_s1)? 10 :
    (sgdma_pixel_descriptor_write_granted_descriptor_mem_s1)? 10 :
    1;

  //descriptor_mem_s1_non_bursting_master_requests mux, which is an e_mux
  assign descriptor_mem_s1_non_bursting_master_requests = cpu_data_master_requests_descriptor_mem_s1 |
    sgdma_pixel_descriptor_read_requests_descriptor_mem_s1 |
    sgdma_pixel_descriptor_write_requests_descriptor_mem_s1 |
    cpu_data_master_requests_descriptor_mem_s1 |
    sgdma_pixel_descriptor_read_requests_descriptor_mem_s1 |
    sgdma_pixel_descriptor_write_requests_descriptor_mem_s1 |
    cpu_data_master_requests_descriptor_mem_s1 |
    sgdma_pixel_descriptor_read_requests_descriptor_mem_s1 |
    sgdma_pixel_descriptor_write_requests_descriptor_mem_s1;

  //descriptor_mem_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign descriptor_mem_s1_any_bursting_master_saved_grant = 0;

  //descriptor_mem_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign descriptor_mem_s1_arb_share_counter_next_value = descriptor_mem_s1_firsttransfer ? (descriptor_mem_s1_arb_share_set_values - 1) : |descriptor_mem_s1_arb_share_counter ? (descriptor_mem_s1_arb_share_counter - 1) : 0;

  //descriptor_mem_s1_allgrants all slave grants, which is an e_mux
  assign descriptor_mem_s1_allgrants = (|descriptor_mem_s1_grant_vector) |
    (|descriptor_mem_s1_grant_vector) |
    (|descriptor_mem_s1_grant_vector) |
    (|descriptor_mem_s1_grant_vector) |
    (|descriptor_mem_s1_grant_vector) |
    (|descriptor_mem_s1_grant_vector) |
    (|descriptor_mem_s1_grant_vector) |
    (|descriptor_mem_s1_grant_vector) |
    (|descriptor_mem_s1_grant_vector);

  //descriptor_mem_s1_end_xfer assignment, which is an e_assign
  assign descriptor_mem_s1_end_xfer = ~(descriptor_mem_s1_waits_for_read | descriptor_mem_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_descriptor_mem_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_descriptor_mem_s1 = descriptor_mem_s1_end_xfer & (~descriptor_mem_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //descriptor_mem_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign descriptor_mem_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_descriptor_mem_s1 & descriptor_mem_s1_allgrants) | (end_xfer_arb_share_counter_term_descriptor_mem_s1 & ~descriptor_mem_s1_non_bursting_master_requests);

  //descriptor_mem_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          descriptor_mem_s1_arb_share_counter <= 0;
      else if (descriptor_mem_s1_arb_counter_enable)
          descriptor_mem_s1_arb_share_counter <= descriptor_mem_s1_arb_share_counter_next_value;
    end


  //descriptor_mem_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          descriptor_mem_s1_slavearbiterlockenable <= 0;
      else if ((|descriptor_mem_s1_master_qreq_vector & end_xfer_arb_share_counter_term_descriptor_mem_s1) | (end_xfer_arb_share_counter_term_descriptor_mem_s1 & ~descriptor_mem_s1_non_bursting_master_requests))
          descriptor_mem_s1_slavearbiterlockenable <= |descriptor_mem_s1_arb_share_counter_next_value;
    end


  //cpu/data_master descriptor_mem/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = descriptor_mem_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //descriptor_mem_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign descriptor_mem_s1_slavearbiterlockenable2 = |descriptor_mem_s1_arb_share_counter_next_value;

  //cpu/data_master descriptor_mem/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = descriptor_mem_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sgdma_pixel/descriptor_read descriptor_mem/s1 arbiterlock, which is an e_assign
  assign sgdma_pixel_descriptor_read_arbiterlock = descriptor_mem_s1_slavearbiterlockenable & sgdma_pixel_descriptor_read_continuerequest;

  //sgdma_pixel/descriptor_read descriptor_mem/s1 arbiterlock2, which is an e_assign
  assign sgdma_pixel_descriptor_read_arbiterlock2 = descriptor_mem_s1_slavearbiterlockenable2 & sgdma_pixel_descriptor_read_continuerequest;

  //sgdma_pixel/descriptor_read granted descriptor_mem/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_pixel_descriptor_read_granted_slave_descriptor_mem_s1 <= 0;
      else 
        last_cycle_sgdma_pixel_descriptor_read_granted_slave_descriptor_mem_s1 <= sgdma_pixel_descriptor_read_saved_grant_descriptor_mem_s1 ? 1 : (descriptor_mem_s1_arbitration_holdoff_internal | ~sgdma_pixel_descriptor_read_requests_descriptor_mem_s1) ? 0 : last_cycle_sgdma_pixel_descriptor_read_granted_slave_descriptor_mem_s1;
    end


  //sgdma_pixel_descriptor_read_continuerequest continued request, which is an e_mux
  assign sgdma_pixel_descriptor_read_continuerequest = (last_cycle_sgdma_pixel_descriptor_read_granted_slave_descriptor_mem_s1 & sgdma_pixel_descriptor_read_requests_descriptor_mem_s1) |
    (last_cycle_sgdma_pixel_descriptor_read_granted_slave_descriptor_mem_s1 & sgdma_pixel_descriptor_read_requests_descriptor_mem_s1);

  //descriptor_mem_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign descriptor_mem_s1_any_continuerequest = sgdma_pixel_descriptor_read_continuerequest |
    sgdma_pixel_descriptor_write_continuerequest |
    cpu_data_master_continuerequest |
    sgdma_pixel_descriptor_write_continuerequest |
    cpu_data_master_continuerequest |
    sgdma_pixel_descriptor_read_continuerequest;

  //sgdma_pixel/descriptor_write descriptor_mem/s1 arbiterlock, which is an e_assign
  assign sgdma_pixel_descriptor_write_arbiterlock = descriptor_mem_s1_slavearbiterlockenable & sgdma_pixel_descriptor_write_continuerequest;

  //sgdma_pixel/descriptor_write descriptor_mem/s1 arbiterlock2, which is an e_assign
  assign sgdma_pixel_descriptor_write_arbiterlock2 = descriptor_mem_s1_slavearbiterlockenable2 & sgdma_pixel_descriptor_write_continuerequest;

  //sgdma_pixel/descriptor_write granted descriptor_mem/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_pixel_descriptor_write_granted_slave_descriptor_mem_s1 <= 0;
      else 
        last_cycle_sgdma_pixel_descriptor_write_granted_slave_descriptor_mem_s1 <= sgdma_pixel_descriptor_write_saved_grant_descriptor_mem_s1 ? 1 : (descriptor_mem_s1_arbitration_holdoff_internal | ~sgdma_pixel_descriptor_write_requests_descriptor_mem_s1) ? 0 : last_cycle_sgdma_pixel_descriptor_write_granted_slave_descriptor_mem_s1;
    end


  //sgdma_pixel_descriptor_write_continuerequest continued request, which is an e_mux
  assign sgdma_pixel_descriptor_write_continuerequest = (last_cycle_sgdma_pixel_descriptor_write_granted_slave_descriptor_mem_s1 & sgdma_pixel_descriptor_write_requests_descriptor_mem_s1) |
    (last_cycle_sgdma_pixel_descriptor_write_granted_slave_descriptor_mem_s1 & sgdma_pixel_descriptor_write_requests_descriptor_mem_s1);

  assign cpu_data_master_qualified_request_descriptor_mem_s1 = cpu_data_master_requests_descriptor_mem_s1 & ~((cpu_data_master_read & ((1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | sgdma_pixel_descriptor_read_arbiterlock | sgdma_pixel_descriptor_write_arbiterlock);
  //cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register_in = cpu_data_master_granted_descriptor_mem_s1 & cpu_data_master_read & ~descriptor_mem_s1_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register = {cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register, cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register_in};

  //cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register <= p1_cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_descriptor_mem_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_descriptor_mem_s1 = cpu_data_master_read_data_valid_descriptor_mem_s1_shift_register;

  //descriptor_mem_s1_writedata mux, which is an e_mux
  assign descriptor_mem_s1_writedata = (cpu_data_master_granted_descriptor_mem_s1)? cpu_data_master_writedata :
    sgdma_pixel_descriptor_write_writedata;

  //mux descriptor_mem_s1_clken, which is an e_mux
  assign descriptor_mem_s1_clken = 1'b1;

  assign sgdma_pixel_descriptor_read_requests_descriptor_mem_s1 = (({sgdma_pixel_descriptor_read_address_to_slave[31 : 16] , 16'b0} == 32'ha400000) & (sgdma_pixel_descriptor_read_read)) & sgdma_pixel_descriptor_read_read;
  //cpu/data_master granted descriptor_mem/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_descriptor_mem_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_descriptor_mem_s1 <= cpu_data_master_saved_grant_descriptor_mem_s1 ? 1 : (descriptor_mem_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_descriptor_mem_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_descriptor_mem_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = (last_cycle_cpu_data_master_granted_slave_descriptor_mem_s1 & cpu_data_master_requests_descriptor_mem_s1) |
    (last_cycle_cpu_data_master_granted_slave_descriptor_mem_s1 & cpu_data_master_requests_descriptor_mem_s1);

  assign sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1 = sgdma_pixel_descriptor_read_requests_descriptor_mem_s1 & ~(cpu_data_master_arbiterlock | sgdma_pixel_descriptor_write_arbiterlock);
  //sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register_in = sgdma_pixel_descriptor_read_granted_descriptor_mem_s1 & sgdma_pixel_descriptor_read_read & ~descriptor_mem_s1_waits_for_read;

  //shift register p1 sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register = {sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register, sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register_in};

  //sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register <= 0;
      else 
        sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register <= p1_sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register;
    end


  //local readdatavalid sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1, which is an e_mux
  assign sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1 = sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1_shift_register;

  assign sgdma_pixel_descriptor_write_requests_descriptor_mem_s1 = (({sgdma_pixel_descriptor_write_address_to_slave[31 : 16] , 16'b0} == 32'ha400000) & (sgdma_pixel_descriptor_write_write)) & sgdma_pixel_descriptor_write_write;
  assign sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1 = sgdma_pixel_descriptor_write_requests_descriptor_mem_s1 & ~(cpu_data_master_arbiterlock | sgdma_pixel_descriptor_read_arbiterlock);
  //allow new arb cycle for descriptor_mem/s1, which is an e_assign
  assign descriptor_mem_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~sgdma_pixel_descriptor_read_arbiterlock & ~sgdma_pixel_descriptor_write_arbiterlock;

  //sgdma_pixel/descriptor_write assignment into master qualified-requests vector for descriptor_mem/s1, which is an e_assign
  assign descriptor_mem_s1_master_qreq_vector[0] = sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1;

  //sgdma_pixel/descriptor_write grant descriptor_mem/s1, which is an e_assign
  assign sgdma_pixel_descriptor_write_granted_descriptor_mem_s1 = descriptor_mem_s1_grant_vector[0];

  //sgdma_pixel/descriptor_write saved-grant descriptor_mem/s1, which is an e_assign
  assign sgdma_pixel_descriptor_write_saved_grant_descriptor_mem_s1 = descriptor_mem_s1_arb_winner[0] && sgdma_pixel_descriptor_write_requests_descriptor_mem_s1;

  //sgdma_pixel/descriptor_read assignment into master qualified-requests vector for descriptor_mem/s1, which is an e_assign
  assign descriptor_mem_s1_master_qreq_vector[1] = sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1;

  //sgdma_pixel/descriptor_read grant descriptor_mem/s1, which is an e_assign
  assign sgdma_pixel_descriptor_read_granted_descriptor_mem_s1 = descriptor_mem_s1_grant_vector[1];

  //sgdma_pixel/descriptor_read saved-grant descriptor_mem/s1, which is an e_assign
  assign sgdma_pixel_descriptor_read_saved_grant_descriptor_mem_s1 = descriptor_mem_s1_arb_winner[1] && sgdma_pixel_descriptor_read_requests_descriptor_mem_s1;

  //cpu/data_master assignment into master qualified-requests vector for descriptor_mem/s1, which is an e_assign
  assign descriptor_mem_s1_master_qreq_vector[2] = cpu_data_master_qualified_request_descriptor_mem_s1;

  //cpu/data_master grant descriptor_mem/s1, which is an e_assign
  assign cpu_data_master_granted_descriptor_mem_s1 = descriptor_mem_s1_grant_vector[2];

  //cpu/data_master saved-grant descriptor_mem/s1, which is an e_assign
  assign cpu_data_master_saved_grant_descriptor_mem_s1 = descriptor_mem_s1_arb_winner[2] && cpu_data_master_requests_descriptor_mem_s1;

  //descriptor_mem/s1 chosen-master double-vector, which is an e_assign
  assign descriptor_mem_s1_chosen_master_double_vector = {descriptor_mem_s1_master_qreq_vector, descriptor_mem_s1_master_qreq_vector} & ({~descriptor_mem_s1_master_qreq_vector, ~descriptor_mem_s1_master_qreq_vector} + descriptor_mem_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign descriptor_mem_s1_arb_winner = (descriptor_mem_s1_allow_new_arb_cycle & | descriptor_mem_s1_grant_vector) ? descriptor_mem_s1_grant_vector : descriptor_mem_s1_saved_chosen_master_vector;

  //saved descriptor_mem_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          descriptor_mem_s1_saved_chosen_master_vector <= 0;
      else if (descriptor_mem_s1_allow_new_arb_cycle)
          descriptor_mem_s1_saved_chosen_master_vector <= |descriptor_mem_s1_grant_vector ? descriptor_mem_s1_grant_vector : descriptor_mem_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign descriptor_mem_s1_grant_vector = {(descriptor_mem_s1_chosen_master_double_vector[2] | descriptor_mem_s1_chosen_master_double_vector[5]),
    (descriptor_mem_s1_chosen_master_double_vector[1] | descriptor_mem_s1_chosen_master_double_vector[4]),
    (descriptor_mem_s1_chosen_master_double_vector[0] | descriptor_mem_s1_chosen_master_double_vector[3])};

  //descriptor_mem/s1 chosen master rotated left, which is an e_assign
  assign descriptor_mem_s1_chosen_master_rot_left = (descriptor_mem_s1_arb_winner << 1) ? (descriptor_mem_s1_arb_winner << 1) : 1;

  //descriptor_mem/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          descriptor_mem_s1_arb_addend <= 1;
      else if (|descriptor_mem_s1_grant_vector)
          descriptor_mem_s1_arb_addend <= descriptor_mem_s1_end_xfer? descriptor_mem_s1_chosen_master_rot_left : descriptor_mem_s1_grant_vector;
    end


  //~descriptor_mem_s1_reset assignment, which is an e_assign
  assign descriptor_mem_s1_reset = ~reset_n;

  assign descriptor_mem_s1_chipselect = cpu_data_master_granted_descriptor_mem_s1 | sgdma_pixel_descriptor_read_granted_descriptor_mem_s1 | sgdma_pixel_descriptor_write_granted_descriptor_mem_s1;
  //descriptor_mem_s1_firsttransfer first transaction, which is an e_assign
  assign descriptor_mem_s1_firsttransfer = descriptor_mem_s1_begins_xfer ? descriptor_mem_s1_unreg_firsttransfer : descriptor_mem_s1_reg_firsttransfer;

  //descriptor_mem_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign descriptor_mem_s1_unreg_firsttransfer = ~(descriptor_mem_s1_slavearbiterlockenable & descriptor_mem_s1_any_continuerequest);

  //descriptor_mem_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          descriptor_mem_s1_reg_firsttransfer <= 1'b1;
      else if (descriptor_mem_s1_begins_xfer)
          descriptor_mem_s1_reg_firsttransfer <= descriptor_mem_s1_unreg_firsttransfer;
    end


  //descriptor_mem_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign descriptor_mem_s1_beginbursttransfer_internal = descriptor_mem_s1_begins_xfer;

  //descriptor_mem_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign descriptor_mem_s1_arbitration_holdoff_internal = descriptor_mem_s1_begins_xfer & descriptor_mem_s1_firsttransfer;

  //descriptor_mem_s1_write assignment, which is an e_mux
  assign descriptor_mem_s1_write = (cpu_data_master_granted_descriptor_mem_s1 & cpu_data_master_write) | (sgdma_pixel_descriptor_write_granted_descriptor_mem_s1 & sgdma_pixel_descriptor_write_write);

  assign shifted_address_to_descriptor_mem_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //descriptor_mem_s1_address mux, which is an e_mux
  assign descriptor_mem_s1_address = (cpu_data_master_granted_descriptor_mem_s1)? (shifted_address_to_descriptor_mem_s1_from_cpu_data_master >> 2) :
    (sgdma_pixel_descriptor_read_granted_descriptor_mem_s1)? (shifted_address_to_descriptor_mem_s1_from_sgdma_pixel_descriptor_read >> 2) :
    (shifted_address_to_descriptor_mem_s1_from_sgdma_pixel_descriptor_write >> 2);

  assign shifted_address_to_descriptor_mem_s1_from_sgdma_pixel_descriptor_read = sgdma_pixel_descriptor_read_address_to_slave;
  assign shifted_address_to_descriptor_mem_s1_from_sgdma_pixel_descriptor_write = sgdma_pixel_descriptor_write_address_to_slave;
  //d1_descriptor_mem_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_descriptor_mem_s1_end_xfer <= 1;
      else 
        d1_descriptor_mem_s1_end_xfer <= descriptor_mem_s1_end_xfer;
    end


  //descriptor_mem_s1_waits_for_read in a cycle, which is an e_mux
  assign descriptor_mem_s1_waits_for_read = descriptor_mem_s1_in_a_read_cycle & 0;

  //descriptor_mem_s1_in_a_read_cycle assignment, which is an e_assign
  assign descriptor_mem_s1_in_a_read_cycle = (cpu_data_master_granted_descriptor_mem_s1 & cpu_data_master_read) | (sgdma_pixel_descriptor_read_granted_descriptor_mem_s1 & sgdma_pixel_descriptor_read_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = descriptor_mem_s1_in_a_read_cycle;

  //descriptor_mem_s1_waits_for_write in a cycle, which is an e_mux
  assign descriptor_mem_s1_waits_for_write = descriptor_mem_s1_in_a_write_cycle & 0;

  //descriptor_mem_s1_in_a_write_cycle assignment, which is an e_assign
  assign descriptor_mem_s1_in_a_write_cycle = (cpu_data_master_granted_descriptor_mem_s1 & cpu_data_master_write) | (sgdma_pixel_descriptor_write_granted_descriptor_mem_s1 & sgdma_pixel_descriptor_write_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = descriptor_mem_s1_in_a_write_cycle;

  assign wait_for_descriptor_mem_s1_counter = 0;
  //descriptor_mem_s1_byteenable byte enable port mux, which is an e_mux
  assign descriptor_mem_s1_byteenable = (cpu_data_master_granted_descriptor_mem_s1)? cpu_data_master_byteenable :
    (sgdma_pixel_descriptor_write_granted_descriptor_mem_s1)? {4 {1'b1}} :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //descriptor_mem/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_descriptor_mem_s1 + sgdma_pixel_descriptor_read_granted_descriptor_mem_s1 + sgdma_pixel_descriptor_write_granted_descriptor_mem_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_descriptor_mem_s1 + sgdma_pixel_descriptor_read_saved_grant_descriptor_mem_s1 + sgdma_pixel_descriptor_write_saved_grant_descriptor_mem_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module fifo_in_arbitrator (
                            // inputs:
                             clk,
                             fifo_in_ready,
                             reset_n,
                             timing_adapter_out_data,
                             timing_adapter_out_empty,
                             timing_adapter_out_endofpacket,
                             timing_adapter_out_startofpacket,
                             timing_adapter_out_valid,

                            // outputs:
                             fifo_in_data,
                             fifo_in_empty,
                             fifo_in_endofpacket,
                             fifo_in_ready_from_sa,
                             fifo_in_reset_n,
                             fifo_in_startofpacket,
                             fifo_in_valid
                          )
;

  output  [ 31: 0] fifo_in_data;
  output  [  1: 0] fifo_in_empty;
  output           fifo_in_endofpacket;
  output           fifo_in_ready_from_sa;
  output           fifo_in_reset_n;
  output           fifo_in_startofpacket;
  output           fifo_in_valid;
  input            clk;
  input            fifo_in_ready;
  input            reset_n;
  input   [ 31: 0] timing_adapter_out_data;
  input   [  1: 0] timing_adapter_out_empty;
  input            timing_adapter_out_endofpacket;
  input            timing_adapter_out_startofpacket;
  input            timing_adapter_out_valid;

  wire    [ 31: 0] fifo_in_data;
  wire    [  1: 0] fifo_in_empty;
  wire             fifo_in_endofpacket;
  wire             fifo_in_ready_from_sa;
  wire             fifo_in_reset_n;
  wire             fifo_in_startofpacket;
  wire             fifo_in_valid;
  //mux fifo_in_data, which is an e_mux
  assign fifo_in_data = timing_adapter_out_data;

  //mux fifo_in_empty, which is an e_mux
  assign fifo_in_empty = timing_adapter_out_empty;

  //mux fifo_in_endofpacket, which is an e_mux
  assign fifo_in_endofpacket = timing_adapter_out_endofpacket;

  //assign fifo_in_ready_from_sa = fifo_in_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign fifo_in_ready_from_sa = fifo_in_ready;

  //mux fifo_in_startofpacket, which is an e_mux
  assign fifo_in_startofpacket = timing_adapter_out_startofpacket;

  //mux fifo_in_valid, which is an e_mux
  assign fifo_in_valid = timing_adapter_out_valid;

  //fifo_in_reset_n assignment, which is an e_assign
  assign fifo_in_reset_n = reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module fifo_in_csr_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_data_master_address_to_slave,
                                 cpu_data_master_latency_counter,
                                 cpu_data_master_read,
                                 cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                 cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                 cpu_data_master_write,
                                 cpu_data_master_writedata,
                                 fifo_in_csr_irq,
                                 fifo_in_csr_readdata,
                                 reset_n,

                                // outputs:
                                 cpu_data_master_granted_fifo_in_csr,
                                 cpu_data_master_qualified_request_fifo_in_csr,
                                 cpu_data_master_read_data_valid_fifo_in_csr,
                                 cpu_data_master_requests_fifo_in_csr,
                                 d1_fifo_in_csr_end_xfer,
                                 fifo_in_csr_address,
                                 fifo_in_csr_irq_from_sa,
                                 fifo_in_csr_read,
                                 fifo_in_csr_readdata_from_sa,
                                 fifo_in_csr_write,
                                 fifo_in_csr_writedata
                              )
;

  output           cpu_data_master_granted_fifo_in_csr;
  output           cpu_data_master_qualified_request_fifo_in_csr;
  output           cpu_data_master_read_data_valid_fifo_in_csr;
  output           cpu_data_master_requests_fifo_in_csr;
  output           d1_fifo_in_csr_end_xfer;
  output  [  2: 0] fifo_in_csr_address;
  output           fifo_in_csr_irq_from_sa;
  output           fifo_in_csr_read;
  output  [ 31: 0] fifo_in_csr_readdata_from_sa;
  output           fifo_in_csr_write;
  output  [ 31: 0] fifo_in_csr_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            fifo_in_csr_irq;
  input   [ 31: 0] fifo_in_csr_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_fifo_in_csr;
  wire             cpu_data_master_qualified_request_fifo_in_csr;
  wire             cpu_data_master_read_data_valid_fifo_in_csr;
  wire             cpu_data_master_requests_fifo_in_csr;
  wire             cpu_data_master_saved_grant_fifo_in_csr;
  reg              d1_fifo_in_csr_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_fifo_in_csr;
  wire    [  2: 0] fifo_in_csr_address;
  wire             fifo_in_csr_allgrants;
  wire             fifo_in_csr_allow_new_arb_cycle;
  wire             fifo_in_csr_any_bursting_master_saved_grant;
  wire             fifo_in_csr_any_continuerequest;
  wire             fifo_in_csr_arb_counter_enable;
  reg     [  2: 0] fifo_in_csr_arb_share_counter;
  wire    [  2: 0] fifo_in_csr_arb_share_counter_next_value;
  wire    [  2: 0] fifo_in_csr_arb_share_set_values;
  wire             fifo_in_csr_beginbursttransfer_internal;
  wire             fifo_in_csr_begins_xfer;
  wire             fifo_in_csr_end_xfer;
  wire             fifo_in_csr_firsttransfer;
  wire             fifo_in_csr_grant_vector;
  wire             fifo_in_csr_in_a_read_cycle;
  wire             fifo_in_csr_in_a_write_cycle;
  wire             fifo_in_csr_irq_from_sa;
  wire             fifo_in_csr_master_qreq_vector;
  wire             fifo_in_csr_non_bursting_master_requests;
  wire             fifo_in_csr_read;
  wire    [ 31: 0] fifo_in_csr_readdata_from_sa;
  reg              fifo_in_csr_reg_firsttransfer;
  reg              fifo_in_csr_slavearbiterlockenable;
  wire             fifo_in_csr_slavearbiterlockenable2;
  wire             fifo_in_csr_unreg_firsttransfer;
  wire             fifo_in_csr_waits_for_read;
  wire             fifo_in_csr_waits_for_write;
  wire             fifo_in_csr_write;
  wire    [ 31: 0] fifo_in_csr_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_fifo_in_csr_from_cpu_data_master;
  wire             wait_for_fifo_in_csr_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~fifo_in_csr_end_xfer;
    end


  assign fifo_in_csr_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_fifo_in_csr));
  //assign fifo_in_csr_readdata_from_sa = fifo_in_csr_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign fifo_in_csr_readdata_from_sa = fifo_in_csr_readdata;

  assign cpu_data_master_requests_fifo_in_csr = ({cpu_data_master_address_to_slave[27 : 5] , 5'b0} == 28'ha411040) & (cpu_data_master_read | cpu_data_master_write);
  //fifo_in_csr_arb_share_counter set values, which is an e_mux
  assign fifo_in_csr_arb_share_set_values = 1;

  //fifo_in_csr_non_bursting_master_requests mux, which is an e_mux
  assign fifo_in_csr_non_bursting_master_requests = cpu_data_master_requests_fifo_in_csr;

  //fifo_in_csr_any_bursting_master_saved_grant mux, which is an e_mux
  assign fifo_in_csr_any_bursting_master_saved_grant = 0;

  //fifo_in_csr_arb_share_counter_next_value assignment, which is an e_assign
  assign fifo_in_csr_arb_share_counter_next_value = fifo_in_csr_firsttransfer ? (fifo_in_csr_arb_share_set_values - 1) : |fifo_in_csr_arb_share_counter ? (fifo_in_csr_arb_share_counter - 1) : 0;

  //fifo_in_csr_allgrants all slave grants, which is an e_mux
  assign fifo_in_csr_allgrants = |fifo_in_csr_grant_vector;

  //fifo_in_csr_end_xfer assignment, which is an e_assign
  assign fifo_in_csr_end_xfer = ~(fifo_in_csr_waits_for_read | fifo_in_csr_waits_for_write);

  //end_xfer_arb_share_counter_term_fifo_in_csr arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_fifo_in_csr = fifo_in_csr_end_xfer & (~fifo_in_csr_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //fifo_in_csr_arb_share_counter arbitration counter enable, which is an e_assign
  assign fifo_in_csr_arb_counter_enable = (end_xfer_arb_share_counter_term_fifo_in_csr & fifo_in_csr_allgrants) | (end_xfer_arb_share_counter_term_fifo_in_csr & ~fifo_in_csr_non_bursting_master_requests);

  //fifo_in_csr_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_in_csr_arb_share_counter <= 0;
      else if (fifo_in_csr_arb_counter_enable)
          fifo_in_csr_arb_share_counter <= fifo_in_csr_arb_share_counter_next_value;
    end


  //fifo_in_csr_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_in_csr_slavearbiterlockenable <= 0;
      else if ((|fifo_in_csr_master_qreq_vector & end_xfer_arb_share_counter_term_fifo_in_csr) | (end_xfer_arb_share_counter_term_fifo_in_csr & ~fifo_in_csr_non_bursting_master_requests))
          fifo_in_csr_slavearbiterlockenable <= |fifo_in_csr_arb_share_counter_next_value;
    end


  //cpu/data_master fifo/in_csr arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = fifo_in_csr_slavearbiterlockenable & cpu_data_master_continuerequest;

  //fifo_in_csr_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign fifo_in_csr_slavearbiterlockenable2 = |fifo_in_csr_arb_share_counter_next_value;

  //cpu/data_master fifo/in_csr arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = fifo_in_csr_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //fifo_in_csr_any_continuerequest at least one master continues requesting, which is an e_assign
  assign fifo_in_csr_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_fifo_in_csr = cpu_data_master_requests_fifo_in_csr & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_fifo_in_csr, which is an e_mux
  assign cpu_data_master_read_data_valid_fifo_in_csr = cpu_data_master_granted_fifo_in_csr & cpu_data_master_read & ~fifo_in_csr_waits_for_read;

  //fifo_in_csr_writedata mux, which is an e_mux
  assign fifo_in_csr_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_fifo_in_csr = cpu_data_master_qualified_request_fifo_in_csr;

  //cpu/data_master saved-grant fifo/in_csr, which is an e_assign
  assign cpu_data_master_saved_grant_fifo_in_csr = cpu_data_master_requests_fifo_in_csr;

  //allow new arb cycle for fifo/in_csr, which is an e_assign
  assign fifo_in_csr_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign fifo_in_csr_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign fifo_in_csr_master_qreq_vector = 1;

  //fifo_in_csr_firsttransfer first transaction, which is an e_assign
  assign fifo_in_csr_firsttransfer = fifo_in_csr_begins_xfer ? fifo_in_csr_unreg_firsttransfer : fifo_in_csr_reg_firsttransfer;

  //fifo_in_csr_unreg_firsttransfer first transaction, which is an e_assign
  assign fifo_in_csr_unreg_firsttransfer = ~(fifo_in_csr_slavearbiterlockenable & fifo_in_csr_any_continuerequest);

  //fifo_in_csr_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_in_csr_reg_firsttransfer <= 1'b1;
      else if (fifo_in_csr_begins_xfer)
          fifo_in_csr_reg_firsttransfer <= fifo_in_csr_unreg_firsttransfer;
    end


  //fifo_in_csr_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign fifo_in_csr_beginbursttransfer_internal = fifo_in_csr_begins_xfer;

  //fifo_in_csr_read assignment, which is an e_mux
  assign fifo_in_csr_read = cpu_data_master_granted_fifo_in_csr & cpu_data_master_read;

  //fifo_in_csr_write assignment, which is an e_mux
  assign fifo_in_csr_write = cpu_data_master_granted_fifo_in_csr & cpu_data_master_write;

  assign shifted_address_to_fifo_in_csr_from_cpu_data_master = cpu_data_master_address_to_slave;
  //fifo_in_csr_address mux, which is an e_mux
  assign fifo_in_csr_address = shifted_address_to_fifo_in_csr_from_cpu_data_master >> 2;

  //d1_fifo_in_csr_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_fifo_in_csr_end_xfer <= 1;
      else 
        d1_fifo_in_csr_end_xfer <= fifo_in_csr_end_xfer;
    end


  //fifo_in_csr_waits_for_read in a cycle, which is an e_mux
  assign fifo_in_csr_waits_for_read = fifo_in_csr_in_a_read_cycle & fifo_in_csr_begins_xfer;

  //fifo_in_csr_in_a_read_cycle assignment, which is an e_assign
  assign fifo_in_csr_in_a_read_cycle = cpu_data_master_granted_fifo_in_csr & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = fifo_in_csr_in_a_read_cycle;

  //fifo_in_csr_waits_for_write in a cycle, which is an e_mux
  assign fifo_in_csr_waits_for_write = fifo_in_csr_in_a_write_cycle & 0;

  //fifo_in_csr_in_a_write_cycle assignment, which is an e_assign
  assign fifo_in_csr_in_a_write_cycle = cpu_data_master_granted_fifo_in_csr & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = fifo_in_csr_in_a_write_cycle;

  assign wait_for_fifo_in_csr_counter = 0;
  //assign fifo_in_csr_irq_from_sa = fifo_in_csr_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign fifo_in_csr_irq_from_sa = fifo_in_csr_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //fifo/in_csr enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module fifo_out_arbitrator (
                             // inputs:
                              clk,
                              fifo_out_data,
                              fifo_out_empty,
                              fifo_out_endofpacket,
                              fifo_out_startofpacket,
                              fifo_out_valid,
                              fifo_to_pixel_converter_in_ready_from_sa,
                              reset_n,

                             // outputs:
                              fifo_out_ready,
                              fifo_out_reset_n
                           )
;

  output           fifo_out_ready;
  output           fifo_out_reset_n;
  input            clk;
  input   [ 31: 0] fifo_out_data;
  input   [  1: 0] fifo_out_empty;
  input            fifo_out_endofpacket;
  input            fifo_out_startofpacket;
  input            fifo_out_valid;
  input            fifo_to_pixel_converter_in_ready_from_sa;
  input            reset_n;

  wire             fifo_out_ready;
  wire             fifo_out_reset_n;
  //fifo_out_reset_n assignment, which is an e_assign
  assign fifo_out_reset_n = reset_n;

  //mux fifo_out_ready, which is an e_mux
  assign fifo_out_ready = fifo_to_pixel_converter_in_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module fifo_to_pixel_converter_in_arbitrator (
                                               // inputs:
                                                clk,
                                                fifo_out_data,
                                                fifo_out_empty,
                                                fifo_out_endofpacket,
                                                fifo_out_startofpacket,
                                                fifo_out_valid,
                                                fifo_to_pixel_converter_in_ready,
                                                reset_n,

                                               // outputs:
                                                fifo_to_pixel_converter_in_data,
                                                fifo_to_pixel_converter_in_empty,
                                                fifo_to_pixel_converter_in_endofpacket,
                                                fifo_to_pixel_converter_in_ready_from_sa,
                                                fifo_to_pixel_converter_in_reset_n,
                                                fifo_to_pixel_converter_in_startofpacket,
                                                fifo_to_pixel_converter_in_valid
                                             )
;

  output  [ 31: 0] fifo_to_pixel_converter_in_data;
  output  [  1: 0] fifo_to_pixel_converter_in_empty;
  output           fifo_to_pixel_converter_in_endofpacket;
  output           fifo_to_pixel_converter_in_ready_from_sa;
  output           fifo_to_pixel_converter_in_reset_n;
  output           fifo_to_pixel_converter_in_startofpacket;
  output           fifo_to_pixel_converter_in_valid;
  input            clk;
  input   [ 31: 0] fifo_out_data;
  input   [  1: 0] fifo_out_empty;
  input            fifo_out_endofpacket;
  input            fifo_out_startofpacket;
  input            fifo_out_valid;
  input            fifo_to_pixel_converter_in_ready;
  input            reset_n;

  wire    [ 31: 0] fifo_to_pixel_converter_in_data;
  wire    [  1: 0] fifo_to_pixel_converter_in_empty;
  wire             fifo_to_pixel_converter_in_endofpacket;
  wire             fifo_to_pixel_converter_in_ready_from_sa;
  wire             fifo_to_pixel_converter_in_reset_n;
  wire             fifo_to_pixel_converter_in_startofpacket;
  wire             fifo_to_pixel_converter_in_valid;
  //mux fifo_to_pixel_converter_in_data, which is an e_mux
  assign fifo_to_pixel_converter_in_data = fifo_out_data;

  //mux fifo_to_pixel_converter_in_empty, which is an e_mux
  assign fifo_to_pixel_converter_in_empty = fifo_out_empty;

  //mux fifo_to_pixel_converter_in_endofpacket, which is an e_mux
  assign fifo_to_pixel_converter_in_endofpacket = fifo_out_endofpacket;

  //assign fifo_to_pixel_converter_in_ready_from_sa = fifo_to_pixel_converter_in_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign fifo_to_pixel_converter_in_ready_from_sa = fifo_to_pixel_converter_in_ready;

  //mux fifo_to_pixel_converter_in_startofpacket, which is an e_mux
  assign fifo_to_pixel_converter_in_startofpacket = fifo_out_startofpacket;

  //mux fifo_to_pixel_converter_in_valid, which is an e_mux
  assign fifo_to_pixel_converter_in_valid = fifo_out_valid;

  //fifo_to_pixel_converter_in_reset_n assignment, which is an e_assign
  assign fifo_to_pixel_converter_in_reset_n = reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module fifo_to_pixel_converter_out_arbitrator (
                                                // inputs:
                                                 clk,
                                                 fifo_to_pixel_converter_out_data,
                                                 fifo_to_pixel_converter_out_empty,
                                                 fifo_to_pixel_converter_out_endofpacket,
                                                 fifo_to_pixel_converter_out_startofpacket,
                                                 fifo_to_pixel_converter_out_valid,
                                                 pixel_converter_in_ready_from_sa,
                                                 reset_n,

                                                // outputs:
                                                 fifo_to_pixel_converter_out_ready
                                              )
;

  output           fifo_to_pixel_converter_out_ready;
  input            clk;
  input   [ 31: 0] fifo_to_pixel_converter_out_data;
  input   [  1: 0] fifo_to_pixel_converter_out_empty;
  input            fifo_to_pixel_converter_out_endofpacket;
  input            fifo_to_pixel_converter_out_startofpacket;
  input            fifo_to_pixel_converter_out_valid;
  input            pixel_converter_in_ready_from_sa;
  input            reset_n;

  wire             fifo_to_pixel_converter_out_ready;
  //mux fifo_to_pixel_converter_out_ready, which is an e_mux
  assign fifo_to_pixel_converter_out_ready = pixel_converter_in_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_latency_counter,
                                                 cpu_data_master_read,
                                                 cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                                 cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                                 cpu_data_master_write,
                                                 cpu_data_master_writedata,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,

                                                // outputs:
                                                 cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata
                                              )
;

  output           cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 27: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[27 : 3] , 3'b0} == 28'ha411070) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read & ~jtag_uart_avalon_jtag_slave_waits_for_read;

  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_i2c_en_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   lcd_i2c_en_s1_readdata,
                                   peripheral_bridge_m1_address_to_slave,
                                   peripheral_bridge_m1_latency_counter,
                                   peripheral_bridge_m1_nativeaddress,
                                   peripheral_bridge_m1_read,
                                   peripheral_bridge_m1_write,
                                   peripheral_bridge_m1_writedata,
                                   reset_n,

                                  // outputs:
                                   d1_lcd_i2c_en_s1_end_xfer,
                                   lcd_i2c_en_s1_address,
                                   lcd_i2c_en_s1_chipselect,
                                   lcd_i2c_en_s1_readdata_from_sa,
                                   lcd_i2c_en_s1_reset_n,
                                   lcd_i2c_en_s1_write_n,
                                   lcd_i2c_en_s1_writedata,
                                   peripheral_bridge_m1_granted_lcd_i2c_en_s1,
                                   peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1,
                                   peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1,
                                   peripheral_bridge_m1_requests_lcd_i2c_en_s1
                                )
;

  output           d1_lcd_i2c_en_s1_end_xfer;
  output  [  1: 0] lcd_i2c_en_s1_address;
  output           lcd_i2c_en_s1_chipselect;
  output           lcd_i2c_en_s1_readdata_from_sa;
  output           lcd_i2c_en_s1_reset_n;
  output           lcd_i2c_en_s1_write_n;
  output           lcd_i2c_en_s1_writedata;
  output           peripheral_bridge_m1_granted_lcd_i2c_en_s1;
  output           peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1;
  output           peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1;
  output           peripheral_bridge_m1_requests_lcd_i2c_en_s1;
  input            clk;
  input            lcd_i2c_en_s1_readdata;
  input   [ 10: 0] peripheral_bridge_m1_address_to_slave;
  input            peripheral_bridge_m1_latency_counter;
  input   [  8: 0] peripheral_bridge_m1_nativeaddress;
  input            peripheral_bridge_m1_read;
  input            peripheral_bridge_m1_write;
  input   [ 31: 0] peripheral_bridge_m1_writedata;
  input            reset_n;

  reg              d1_lcd_i2c_en_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_i2c_en_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_i2c_en_s1_address;
  wire             lcd_i2c_en_s1_allgrants;
  wire             lcd_i2c_en_s1_allow_new_arb_cycle;
  wire             lcd_i2c_en_s1_any_bursting_master_saved_grant;
  wire             lcd_i2c_en_s1_any_continuerequest;
  wire             lcd_i2c_en_s1_arb_counter_enable;
  reg              lcd_i2c_en_s1_arb_share_counter;
  wire             lcd_i2c_en_s1_arb_share_counter_next_value;
  wire             lcd_i2c_en_s1_arb_share_set_values;
  wire             lcd_i2c_en_s1_beginbursttransfer_internal;
  wire             lcd_i2c_en_s1_begins_xfer;
  wire             lcd_i2c_en_s1_chipselect;
  wire             lcd_i2c_en_s1_end_xfer;
  wire             lcd_i2c_en_s1_firsttransfer;
  wire             lcd_i2c_en_s1_grant_vector;
  wire             lcd_i2c_en_s1_in_a_read_cycle;
  wire             lcd_i2c_en_s1_in_a_write_cycle;
  wire             lcd_i2c_en_s1_master_qreq_vector;
  wire             lcd_i2c_en_s1_non_bursting_master_requests;
  wire             lcd_i2c_en_s1_readdata_from_sa;
  reg              lcd_i2c_en_s1_reg_firsttransfer;
  wire             lcd_i2c_en_s1_reset_n;
  reg              lcd_i2c_en_s1_slavearbiterlockenable;
  wire             lcd_i2c_en_s1_slavearbiterlockenable2;
  wire             lcd_i2c_en_s1_unreg_firsttransfer;
  wire             lcd_i2c_en_s1_waits_for_read;
  wire             lcd_i2c_en_s1_waits_for_write;
  wire             lcd_i2c_en_s1_write_n;
  wire             lcd_i2c_en_s1_writedata;
  wire             peripheral_bridge_m1_arbiterlock;
  wire             peripheral_bridge_m1_arbiterlock2;
  wire             peripheral_bridge_m1_continuerequest;
  wire             peripheral_bridge_m1_granted_lcd_i2c_en_s1;
  wire             peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1;
  wire             peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1;
  wire             peripheral_bridge_m1_requests_lcd_i2c_en_s1;
  wire             peripheral_bridge_m1_saved_grant_lcd_i2c_en_s1;
  wire             wait_for_lcd_i2c_en_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_i2c_en_s1_end_xfer;
    end


  assign lcd_i2c_en_s1_begins_xfer = ~d1_reasons_to_wait & ((peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1));
  //assign lcd_i2c_en_s1_readdata_from_sa = lcd_i2c_en_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_i2c_en_s1_readdata_from_sa = lcd_i2c_en_s1_readdata;

  assign peripheral_bridge_m1_requests_lcd_i2c_en_s1 = ({peripheral_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h450) & (peripheral_bridge_m1_read | peripheral_bridge_m1_write);
  //lcd_i2c_en_s1_arb_share_counter set values, which is an e_mux
  assign lcd_i2c_en_s1_arb_share_set_values = 1;

  //lcd_i2c_en_s1_non_bursting_master_requests mux, which is an e_mux
  assign lcd_i2c_en_s1_non_bursting_master_requests = peripheral_bridge_m1_requests_lcd_i2c_en_s1;

  //lcd_i2c_en_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_i2c_en_s1_any_bursting_master_saved_grant = 0;

  //lcd_i2c_en_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_i2c_en_s1_arb_share_counter_next_value = lcd_i2c_en_s1_firsttransfer ? (lcd_i2c_en_s1_arb_share_set_values - 1) : |lcd_i2c_en_s1_arb_share_counter ? (lcd_i2c_en_s1_arb_share_counter - 1) : 0;

  //lcd_i2c_en_s1_allgrants all slave grants, which is an e_mux
  assign lcd_i2c_en_s1_allgrants = |lcd_i2c_en_s1_grant_vector;

  //lcd_i2c_en_s1_end_xfer assignment, which is an e_assign
  assign lcd_i2c_en_s1_end_xfer = ~(lcd_i2c_en_s1_waits_for_read | lcd_i2c_en_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_i2c_en_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_i2c_en_s1 = lcd_i2c_en_s1_end_xfer & (~lcd_i2c_en_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_i2c_en_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_i2c_en_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_i2c_en_s1 & lcd_i2c_en_s1_allgrants) | (end_xfer_arb_share_counter_term_lcd_i2c_en_s1 & ~lcd_i2c_en_s1_non_bursting_master_requests);

  //lcd_i2c_en_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_i2c_en_s1_arb_share_counter <= 0;
      else if (lcd_i2c_en_s1_arb_counter_enable)
          lcd_i2c_en_s1_arb_share_counter <= lcd_i2c_en_s1_arb_share_counter_next_value;
    end


  //lcd_i2c_en_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_i2c_en_s1_slavearbiterlockenable <= 0;
      else if ((|lcd_i2c_en_s1_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_i2c_en_s1) | (end_xfer_arb_share_counter_term_lcd_i2c_en_s1 & ~lcd_i2c_en_s1_non_bursting_master_requests))
          lcd_i2c_en_s1_slavearbiterlockenable <= |lcd_i2c_en_s1_arb_share_counter_next_value;
    end


  //peripheral_bridge/m1 lcd_i2c_en/s1 arbiterlock, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock = lcd_i2c_en_s1_slavearbiterlockenable & peripheral_bridge_m1_continuerequest;

  //lcd_i2c_en_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_i2c_en_s1_slavearbiterlockenable2 = |lcd_i2c_en_s1_arb_share_counter_next_value;

  //peripheral_bridge/m1 lcd_i2c_en/s1 arbiterlock2, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock2 = lcd_i2c_en_s1_slavearbiterlockenable2 & peripheral_bridge_m1_continuerequest;

  //lcd_i2c_en_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_i2c_en_s1_any_continuerequest = 1;

  //peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign peripheral_bridge_m1_continuerequest = 1;

  assign peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1 = peripheral_bridge_m1_requests_lcd_i2c_en_s1 & ~((peripheral_bridge_m1_read & ((peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1, which is an e_mux
  assign peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1 = peripheral_bridge_m1_granted_lcd_i2c_en_s1 & peripheral_bridge_m1_read & ~lcd_i2c_en_s1_waits_for_read;

  //lcd_i2c_en_s1_writedata mux, which is an e_mux
  assign lcd_i2c_en_s1_writedata = peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign peripheral_bridge_m1_granted_lcd_i2c_en_s1 = peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1;

  //peripheral_bridge/m1 saved-grant lcd_i2c_en/s1, which is an e_assign
  assign peripheral_bridge_m1_saved_grant_lcd_i2c_en_s1 = peripheral_bridge_m1_requests_lcd_i2c_en_s1;

  //allow new arb cycle for lcd_i2c_en/s1, which is an e_assign
  assign lcd_i2c_en_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_i2c_en_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_i2c_en_s1_master_qreq_vector = 1;

  //lcd_i2c_en_s1_reset_n assignment, which is an e_assign
  assign lcd_i2c_en_s1_reset_n = reset_n;

  assign lcd_i2c_en_s1_chipselect = peripheral_bridge_m1_granted_lcd_i2c_en_s1;
  //lcd_i2c_en_s1_firsttransfer first transaction, which is an e_assign
  assign lcd_i2c_en_s1_firsttransfer = lcd_i2c_en_s1_begins_xfer ? lcd_i2c_en_s1_unreg_firsttransfer : lcd_i2c_en_s1_reg_firsttransfer;

  //lcd_i2c_en_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_i2c_en_s1_unreg_firsttransfer = ~(lcd_i2c_en_s1_slavearbiterlockenable & lcd_i2c_en_s1_any_continuerequest);

  //lcd_i2c_en_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_i2c_en_s1_reg_firsttransfer <= 1'b1;
      else if (lcd_i2c_en_s1_begins_xfer)
          lcd_i2c_en_s1_reg_firsttransfer <= lcd_i2c_en_s1_unreg_firsttransfer;
    end


  //lcd_i2c_en_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_i2c_en_s1_beginbursttransfer_internal = lcd_i2c_en_s1_begins_xfer;

  //~lcd_i2c_en_s1_write_n assignment, which is an e_mux
  assign lcd_i2c_en_s1_write_n = ~(peripheral_bridge_m1_granted_lcd_i2c_en_s1 & peripheral_bridge_m1_write);

  //lcd_i2c_en_s1_address mux, which is an e_mux
  assign lcd_i2c_en_s1_address = peripheral_bridge_m1_nativeaddress;

  //d1_lcd_i2c_en_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_i2c_en_s1_end_xfer <= 1;
      else 
        d1_lcd_i2c_en_s1_end_xfer <= lcd_i2c_en_s1_end_xfer;
    end


  //lcd_i2c_en_s1_waits_for_read in a cycle, which is an e_mux
  assign lcd_i2c_en_s1_waits_for_read = lcd_i2c_en_s1_in_a_read_cycle & lcd_i2c_en_s1_begins_xfer;

  //lcd_i2c_en_s1_in_a_read_cycle assignment, which is an e_assign
  assign lcd_i2c_en_s1_in_a_read_cycle = peripheral_bridge_m1_granted_lcd_i2c_en_s1 & peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_i2c_en_s1_in_a_read_cycle;

  //lcd_i2c_en_s1_waits_for_write in a cycle, which is an e_mux
  assign lcd_i2c_en_s1_waits_for_write = lcd_i2c_en_s1_in_a_write_cycle & 0;

  //lcd_i2c_en_s1_in_a_write_cycle assignment, which is an e_assign
  assign lcd_i2c_en_s1_in_a_write_cycle = peripheral_bridge_m1_granted_lcd_i2c_en_s1 & peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_i2c_en_s1_in_a_write_cycle;

  assign wait_for_lcd_i2c_en_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_i2c_en/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_i2c_scl_s1_arbitrator (
                                   // inputs:
                                    clk,
                                    lcd_i2c_scl_s1_readdata,
                                    peripheral_bridge_m1_address_to_slave,
                                    peripheral_bridge_m1_latency_counter,
                                    peripheral_bridge_m1_nativeaddress,
                                    peripheral_bridge_m1_read,
                                    peripheral_bridge_m1_write,
                                    peripheral_bridge_m1_writedata,
                                    reset_n,

                                   // outputs:
                                    d1_lcd_i2c_scl_s1_end_xfer,
                                    lcd_i2c_scl_s1_address,
                                    lcd_i2c_scl_s1_chipselect,
                                    lcd_i2c_scl_s1_readdata_from_sa,
                                    lcd_i2c_scl_s1_reset_n,
                                    lcd_i2c_scl_s1_write_n,
                                    lcd_i2c_scl_s1_writedata,
                                    peripheral_bridge_m1_granted_lcd_i2c_scl_s1,
                                    peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1,
                                    peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1,
                                    peripheral_bridge_m1_requests_lcd_i2c_scl_s1
                                 )
;

  output           d1_lcd_i2c_scl_s1_end_xfer;
  output  [  1: 0] lcd_i2c_scl_s1_address;
  output           lcd_i2c_scl_s1_chipselect;
  output           lcd_i2c_scl_s1_readdata_from_sa;
  output           lcd_i2c_scl_s1_reset_n;
  output           lcd_i2c_scl_s1_write_n;
  output           lcd_i2c_scl_s1_writedata;
  output           peripheral_bridge_m1_granted_lcd_i2c_scl_s1;
  output           peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1;
  output           peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1;
  output           peripheral_bridge_m1_requests_lcd_i2c_scl_s1;
  input            clk;
  input            lcd_i2c_scl_s1_readdata;
  input   [ 10: 0] peripheral_bridge_m1_address_to_slave;
  input            peripheral_bridge_m1_latency_counter;
  input   [  8: 0] peripheral_bridge_m1_nativeaddress;
  input            peripheral_bridge_m1_read;
  input            peripheral_bridge_m1_write;
  input   [ 31: 0] peripheral_bridge_m1_writedata;
  input            reset_n;

  reg              d1_lcd_i2c_scl_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_i2c_scl_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_i2c_scl_s1_address;
  wire             lcd_i2c_scl_s1_allgrants;
  wire             lcd_i2c_scl_s1_allow_new_arb_cycle;
  wire             lcd_i2c_scl_s1_any_bursting_master_saved_grant;
  wire             lcd_i2c_scl_s1_any_continuerequest;
  wire             lcd_i2c_scl_s1_arb_counter_enable;
  reg              lcd_i2c_scl_s1_arb_share_counter;
  wire             lcd_i2c_scl_s1_arb_share_counter_next_value;
  wire             lcd_i2c_scl_s1_arb_share_set_values;
  wire             lcd_i2c_scl_s1_beginbursttransfer_internal;
  wire             lcd_i2c_scl_s1_begins_xfer;
  wire             lcd_i2c_scl_s1_chipselect;
  wire             lcd_i2c_scl_s1_end_xfer;
  wire             lcd_i2c_scl_s1_firsttransfer;
  wire             lcd_i2c_scl_s1_grant_vector;
  wire             lcd_i2c_scl_s1_in_a_read_cycle;
  wire             lcd_i2c_scl_s1_in_a_write_cycle;
  wire             lcd_i2c_scl_s1_master_qreq_vector;
  wire             lcd_i2c_scl_s1_non_bursting_master_requests;
  wire             lcd_i2c_scl_s1_readdata_from_sa;
  reg              lcd_i2c_scl_s1_reg_firsttransfer;
  wire             lcd_i2c_scl_s1_reset_n;
  reg              lcd_i2c_scl_s1_slavearbiterlockenable;
  wire             lcd_i2c_scl_s1_slavearbiterlockenable2;
  wire             lcd_i2c_scl_s1_unreg_firsttransfer;
  wire             lcd_i2c_scl_s1_waits_for_read;
  wire             lcd_i2c_scl_s1_waits_for_write;
  wire             lcd_i2c_scl_s1_write_n;
  wire             lcd_i2c_scl_s1_writedata;
  wire             peripheral_bridge_m1_arbiterlock;
  wire             peripheral_bridge_m1_arbiterlock2;
  wire             peripheral_bridge_m1_continuerequest;
  wire             peripheral_bridge_m1_granted_lcd_i2c_scl_s1;
  wire             peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1;
  wire             peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1;
  wire             peripheral_bridge_m1_requests_lcd_i2c_scl_s1;
  wire             peripheral_bridge_m1_saved_grant_lcd_i2c_scl_s1;
  wire             wait_for_lcd_i2c_scl_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_i2c_scl_s1_end_xfer;
    end


  assign lcd_i2c_scl_s1_begins_xfer = ~d1_reasons_to_wait & ((peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1));
  //assign lcd_i2c_scl_s1_readdata_from_sa = lcd_i2c_scl_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_i2c_scl_s1_readdata_from_sa = lcd_i2c_scl_s1_readdata;

  assign peripheral_bridge_m1_requests_lcd_i2c_scl_s1 = ({peripheral_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h440) & (peripheral_bridge_m1_read | peripheral_bridge_m1_write);
  //lcd_i2c_scl_s1_arb_share_counter set values, which is an e_mux
  assign lcd_i2c_scl_s1_arb_share_set_values = 1;

  //lcd_i2c_scl_s1_non_bursting_master_requests mux, which is an e_mux
  assign lcd_i2c_scl_s1_non_bursting_master_requests = peripheral_bridge_m1_requests_lcd_i2c_scl_s1;

  //lcd_i2c_scl_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_i2c_scl_s1_any_bursting_master_saved_grant = 0;

  //lcd_i2c_scl_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_i2c_scl_s1_arb_share_counter_next_value = lcd_i2c_scl_s1_firsttransfer ? (lcd_i2c_scl_s1_arb_share_set_values - 1) : |lcd_i2c_scl_s1_arb_share_counter ? (lcd_i2c_scl_s1_arb_share_counter - 1) : 0;

  //lcd_i2c_scl_s1_allgrants all slave grants, which is an e_mux
  assign lcd_i2c_scl_s1_allgrants = |lcd_i2c_scl_s1_grant_vector;

  //lcd_i2c_scl_s1_end_xfer assignment, which is an e_assign
  assign lcd_i2c_scl_s1_end_xfer = ~(lcd_i2c_scl_s1_waits_for_read | lcd_i2c_scl_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_i2c_scl_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_i2c_scl_s1 = lcd_i2c_scl_s1_end_xfer & (~lcd_i2c_scl_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_i2c_scl_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_i2c_scl_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_i2c_scl_s1 & lcd_i2c_scl_s1_allgrants) | (end_xfer_arb_share_counter_term_lcd_i2c_scl_s1 & ~lcd_i2c_scl_s1_non_bursting_master_requests);

  //lcd_i2c_scl_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_i2c_scl_s1_arb_share_counter <= 0;
      else if (lcd_i2c_scl_s1_arb_counter_enable)
          lcd_i2c_scl_s1_arb_share_counter <= lcd_i2c_scl_s1_arb_share_counter_next_value;
    end


  //lcd_i2c_scl_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_i2c_scl_s1_slavearbiterlockenable <= 0;
      else if ((|lcd_i2c_scl_s1_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_i2c_scl_s1) | (end_xfer_arb_share_counter_term_lcd_i2c_scl_s1 & ~lcd_i2c_scl_s1_non_bursting_master_requests))
          lcd_i2c_scl_s1_slavearbiterlockenable <= |lcd_i2c_scl_s1_arb_share_counter_next_value;
    end


  //peripheral_bridge/m1 lcd_i2c_scl/s1 arbiterlock, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock = lcd_i2c_scl_s1_slavearbiterlockenable & peripheral_bridge_m1_continuerequest;

  //lcd_i2c_scl_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_i2c_scl_s1_slavearbiterlockenable2 = |lcd_i2c_scl_s1_arb_share_counter_next_value;

  //peripheral_bridge/m1 lcd_i2c_scl/s1 arbiterlock2, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock2 = lcd_i2c_scl_s1_slavearbiterlockenable2 & peripheral_bridge_m1_continuerequest;

  //lcd_i2c_scl_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_i2c_scl_s1_any_continuerequest = 1;

  //peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign peripheral_bridge_m1_continuerequest = 1;

  assign peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1 = peripheral_bridge_m1_requests_lcd_i2c_scl_s1 & ~((peripheral_bridge_m1_read & ((peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1, which is an e_mux
  assign peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1 = peripheral_bridge_m1_granted_lcd_i2c_scl_s1 & peripheral_bridge_m1_read & ~lcd_i2c_scl_s1_waits_for_read;

  //lcd_i2c_scl_s1_writedata mux, which is an e_mux
  assign lcd_i2c_scl_s1_writedata = peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign peripheral_bridge_m1_granted_lcd_i2c_scl_s1 = peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1;

  //peripheral_bridge/m1 saved-grant lcd_i2c_scl/s1, which is an e_assign
  assign peripheral_bridge_m1_saved_grant_lcd_i2c_scl_s1 = peripheral_bridge_m1_requests_lcd_i2c_scl_s1;

  //allow new arb cycle for lcd_i2c_scl/s1, which is an e_assign
  assign lcd_i2c_scl_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_i2c_scl_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_i2c_scl_s1_master_qreq_vector = 1;

  //lcd_i2c_scl_s1_reset_n assignment, which is an e_assign
  assign lcd_i2c_scl_s1_reset_n = reset_n;

  assign lcd_i2c_scl_s1_chipselect = peripheral_bridge_m1_granted_lcd_i2c_scl_s1;
  //lcd_i2c_scl_s1_firsttransfer first transaction, which is an e_assign
  assign lcd_i2c_scl_s1_firsttransfer = lcd_i2c_scl_s1_begins_xfer ? lcd_i2c_scl_s1_unreg_firsttransfer : lcd_i2c_scl_s1_reg_firsttransfer;

  //lcd_i2c_scl_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_i2c_scl_s1_unreg_firsttransfer = ~(lcd_i2c_scl_s1_slavearbiterlockenable & lcd_i2c_scl_s1_any_continuerequest);

  //lcd_i2c_scl_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_i2c_scl_s1_reg_firsttransfer <= 1'b1;
      else if (lcd_i2c_scl_s1_begins_xfer)
          lcd_i2c_scl_s1_reg_firsttransfer <= lcd_i2c_scl_s1_unreg_firsttransfer;
    end


  //lcd_i2c_scl_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_i2c_scl_s1_beginbursttransfer_internal = lcd_i2c_scl_s1_begins_xfer;

  //~lcd_i2c_scl_s1_write_n assignment, which is an e_mux
  assign lcd_i2c_scl_s1_write_n = ~(peripheral_bridge_m1_granted_lcd_i2c_scl_s1 & peripheral_bridge_m1_write);

  //lcd_i2c_scl_s1_address mux, which is an e_mux
  assign lcd_i2c_scl_s1_address = peripheral_bridge_m1_nativeaddress;

  //d1_lcd_i2c_scl_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_i2c_scl_s1_end_xfer <= 1;
      else 
        d1_lcd_i2c_scl_s1_end_xfer <= lcd_i2c_scl_s1_end_xfer;
    end


  //lcd_i2c_scl_s1_waits_for_read in a cycle, which is an e_mux
  assign lcd_i2c_scl_s1_waits_for_read = lcd_i2c_scl_s1_in_a_read_cycle & lcd_i2c_scl_s1_begins_xfer;

  //lcd_i2c_scl_s1_in_a_read_cycle assignment, which is an e_assign
  assign lcd_i2c_scl_s1_in_a_read_cycle = peripheral_bridge_m1_granted_lcd_i2c_scl_s1 & peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_i2c_scl_s1_in_a_read_cycle;

  //lcd_i2c_scl_s1_waits_for_write in a cycle, which is an e_mux
  assign lcd_i2c_scl_s1_waits_for_write = lcd_i2c_scl_s1_in_a_write_cycle & 0;

  //lcd_i2c_scl_s1_in_a_write_cycle assignment, which is an e_assign
  assign lcd_i2c_scl_s1_in_a_write_cycle = peripheral_bridge_m1_granted_lcd_i2c_scl_s1 & peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_i2c_scl_s1_in_a_write_cycle;

  assign wait_for_lcd_i2c_scl_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_i2c_scl/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_i2c_sda_s1_arbitrator (
                                   // inputs:
                                    clk,
                                    lcd_i2c_sda_s1_readdata,
                                    peripheral_bridge_m1_address_to_slave,
                                    peripheral_bridge_m1_latency_counter,
                                    peripheral_bridge_m1_nativeaddress,
                                    peripheral_bridge_m1_read,
                                    peripheral_bridge_m1_write,
                                    peripheral_bridge_m1_writedata,
                                    reset_n,

                                   // outputs:
                                    d1_lcd_i2c_sda_s1_end_xfer,
                                    lcd_i2c_sda_s1_address,
                                    lcd_i2c_sda_s1_chipselect,
                                    lcd_i2c_sda_s1_readdata_from_sa,
                                    lcd_i2c_sda_s1_reset_n,
                                    lcd_i2c_sda_s1_write_n,
                                    lcd_i2c_sda_s1_writedata,
                                    peripheral_bridge_m1_granted_lcd_i2c_sda_s1,
                                    peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1,
                                    peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1,
                                    peripheral_bridge_m1_requests_lcd_i2c_sda_s1
                                 )
;

  output           d1_lcd_i2c_sda_s1_end_xfer;
  output  [  1: 0] lcd_i2c_sda_s1_address;
  output           lcd_i2c_sda_s1_chipselect;
  output           lcd_i2c_sda_s1_readdata_from_sa;
  output           lcd_i2c_sda_s1_reset_n;
  output           lcd_i2c_sda_s1_write_n;
  output           lcd_i2c_sda_s1_writedata;
  output           peripheral_bridge_m1_granted_lcd_i2c_sda_s1;
  output           peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1;
  output           peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1;
  output           peripheral_bridge_m1_requests_lcd_i2c_sda_s1;
  input            clk;
  input            lcd_i2c_sda_s1_readdata;
  input   [ 10: 0] peripheral_bridge_m1_address_to_slave;
  input            peripheral_bridge_m1_latency_counter;
  input   [  8: 0] peripheral_bridge_m1_nativeaddress;
  input            peripheral_bridge_m1_read;
  input            peripheral_bridge_m1_write;
  input   [ 31: 0] peripheral_bridge_m1_writedata;
  input            reset_n;

  reg              d1_lcd_i2c_sda_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_i2c_sda_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_i2c_sda_s1_address;
  wire             lcd_i2c_sda_s1_allgrants;
  wire             lcd_i2c_sda_s1_allow_new_arb_cycle;
  wire             lcd_i2c_sda_s1_any_bursting_master_saved_grant;
  wire             lcd_i2c_sda_s1_any_continuerequest;
  wire             lcd_i2c_sda_s1_arb_counter_enable;
  reg              lcd_i2c_sda_s1_arb_share_counter;
  wire             lcd_i2c_sda_s1_arb_share_counter_next_value;
  wire             lcd_i2c_sda_s1_arb_share_set_values;
  wire             lcd_i2c_sda_s1_beginbursttransfer_internal;
  wire             lcd_i2c_sda_s1_begins_xfer;
  wire             lcd_i2c_sda_s1_chipselect;
  wire             lcd_i2c_sda_s1_end_xfer;
  wire             lcd_i2c_sda_s1_firsttransfer;
  wire             lcd_i2c_sda_s1_grant_vector;
  wire             lcd_i2c_sda_s1_in_a_read_cycle;
  wire             lcd_i2c_sda_s1_in_a_write_cycle;
  wire             lcd_i2c_sda_s1_master_qreq_vector;
  wire             lcd_i2c_sda_s1_non_bursting_master_requests;
  wire             lcd_i2c_sda_s1_readdata_from_sa;
  reg              lcd_i2c_sda_s1_reg_firsttransfer;
  wire             lcd_i2c_sda_s1_reset_n;
  reg              lcd_i2c_sda_s1_slavearbiterlockenable;
  wire             lcd_i2c_sda_s1_slavearbiterlockenable2;
  wire             lcd_i2c_sda_s1_unreg_firsttransfer;
  wire             lcd_i2c_sda_s1_waits_for_read;
  wire             lcd_i2c_sda_s1_waits_for_write;
  wire             lcd_i2c_sda_s1_write_n;
  wire             lcd_i2c_sda_s1_writedata;
  wire             peripheral_bridge_m1_arbiterlock;
  wire             peripheral_bridge_m1_arbiterlock2;
  wire             peripheral_bridge_m1_continuerequest;
  wire             peripheral_bridge_m1_granted_lcd_i2c_sda_s1;
  wire             peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1;
  wire             peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1;
  wire             peripheral_bridge_m1_requests_lcd_i2c_sda_s1;
  wire             peripheral_bridge_m1_saved_grant_lcd_i2c_sda_s1;
  wire             wait_for_lcd_i2c_sda_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_i2c_sda_s1_end_xfer;
    end


  assign lcd_i2c_sda_s1_begins_xfer = ~d1_reasons_to_wait & ((peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1));
  //assign lcd_i2c_sda_s1_readdata_from_sa = lcd_i2c_sda_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_i2c_sda_s1_readdata_from_sa = lcd_i2c_sda_s1_readdata;

  assign peripheral_bridge_m1_requests_lcd_i2c_sda_s1 = ({peripheral_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h460) & (peripheral_bridge_m1_read | peripheral_bridge_m1_write);
  //lcd_i2c_sda_s1_arb_share_counter set values, which is an e_mux
  assign lcd_i2c_sda_s1_arb_share_set_values = 1;

  //lcd_i2c_sda_s1_non_bursting_master_requests mux, which is an e_mux
  assign lcd_i2c_sda_s1_non_bursting_master_requests = peripheral_bridge_m1_requests_lcd_i2c_sda_s1;

  //lcd_i2c_sda_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_i2c_sda_s1_any_bursting_master_saved_grant = 0;

  //lcd_i2c_sda_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_i2c_sda_s1_arb_share_counter_next_value = lcd_i2c_sda_s1_firsttransfer ? (lcd_i2c_sda_s1_arb_share_set_values - 1) : |lcd_i2c_sda_s1_arb_share_counter ? (lcd_i2c_sda_s1_arb_share_counter - 1) : 0;

  //lcd_i2c_sda_s1_allgrants all slave grants, which is an e_mux
  assign lcd_i2c_sda_s1_allgrants = |lcd_i2c_sda_s1_grant_vector;

  //lcd_i2c_sda_s1_end_xfer assignment, which is an e_assign
  assign lcd_i2c_sda_s1_end_xfer = ~(lcd_i2c_sda_s1_waits_for_read | lcd_i2c_sda_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_i2c_sda_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_i2c_sda_s1 = lcd_i2c_sda_s1_end_xfer & (~lcd_i2c_sda_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_i2c_sda_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_i2c_sda_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_i2c_sda_s1 & lcd_i2c_sda_s1_allgrants) | (end_xfer_arb_share_counter_term_lcd_i2c_sda_s1 & ~lcd_i2c_sda_s1_non_bursting_master_requests);

  //lcd_i2c_sda_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_i2c_sda_s1_arb_share_counter <= 0;
      else if (lcd_i2c_sda_s1_arb_counter_enable)
          lcd_i2c_sda_s1_arb_share_counter <= lcd_i2c_sda_s1_arb_share_counter_next_value;
    end


  //lcd_i2c_sda_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_i2c_sda_s1_slavearbiterlockenable <= 0;
      else if ((|lcd_i2c_sda_s1_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_i2c_sda_s1) | (end_xfer_arb_share_counter_term_lcd_i2c_sda_s1 & ~lcd_i2c_sda_s1_non_bursting_master_requests))
          lcd_i2c_sda_s1_slavearbiterlockenable <= |lcd_i2c_sda_s1_arb_share_counter_next_value;
    end


  //peripheral_bridge/m1 lcd_i2c_sda/s1 arbiterlock, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock = lcd_i2c_sda_s1_slavearbiterlockenable & peripheral_bridge_m1_continuerequest;

  //lcd_i2c_sda_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_i2c_sda_s1_slavearbiterlockenable2 = |lcd_i2c_sda_s1_arb_share_counter_next_value;

  //peripheral_bridge/m1 lcd_i2c_sda/s1 arbiterlock2, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock2 = lcd_i2c_sda_s1_slavearbiterlockenable2 & peripheral_bridge_m1_continuerequest;

  //lcd_i2c_sda_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_i2c_sda_s1_any_continuerequest = 1;

  //peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign peripheral_bridge_m1_continuerequest = 1;

  assign peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1 = peripheral_bridge_m1_requests_lcd_i2c_sda_s1 & ~((peripheral_bridge_m1_read & ((peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1, which is an e_mux
  assign peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1 = peripheral_bridge_m1_granted_lcd_i2c_sda_s1 & peripheral_bridge_m1_read & ~lcd_i2c_sda_s1_waits_for_read;

  //lcd_i2c_sda_s1_writedata mux, which is an e_mux
  assign lcd_i2c_sda_s1_writedata = peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign peripheral_bridge_m1_granted_lcd_i2c_sda_s1 = peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1;

  //peripheral_bridge/m1 saved-grant lcd_i2c_sda/s1, which is an e_assign
  assign peripheral_bridge_m1_saved_grant_lcd_i2c_sda_s1 = peripheral_bridge_m1_requests_lcd_i2c_sda_s1;

  //allow new arb cycle for lcd_i2c_sda/s1, which is an e_assign
  assign lcd_i2c_sda_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_i2c_sda_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_i2c_sda_s1_master_qreq_vector = 1;

  //lcd_i2c_sda_s1_reset_n assignment, which is an e_assign
  assign lcd_i2c_sda_s1_reset_n = reset_n;

  assign lcd_i2c_sda_s1_chipselect = peripheral_bridge_m1_granted_lcd_i2c_sda_s1;
  //lcd_i2c_sda_s1_firsttransfer first transaction, which is an e_assign
  assign lcd_i2c_sda_s1_firsttransfer = lcd_i2c_sda_s1_begins_xfer ? lcd_i2c_sda_s1_unreg_firsttransfer : lcd_i2c_sda_s1_reg_firsttransfer;

  //lcd_i2c_sda_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_i2c_sda_s1_unreg_firsttransfer = ~(lcd_i2c_sda_s1_slavearbiterlockenable & lcd_i2c_sda_s1_any_continuerequest);

  //lcd_i2c_sda_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_i2c_sda_s1_reg_firsttransfer <= 1'b1;
      else if (lcd_i2c_sda_s1_begins_xfer)
          lcd_i2c_sda_s1_reg_firsttransfer <= lcd_i2c_sda_s1_unreg_firsttransfer;
    end


  //lcd_i2c_sda_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_i2c_sda_s1_beginbursttransfer_internal = lcd_i2c_sda_s1_begins_xfer;

  //~lcd_i2c_sda_s1_write_n assignment, which is an e_mux
  assign lcd_i2c_sda_s1_write_n = ~(peripheral_bridge_m1_granted_lcd_i2c_sda_s1 & peripheral_bridge_m1_write);

  //lcd_i2c_sda_s1_address mux, which is an e_mux
  assign lcd_i2c_sda_s1_address = peripheral_bridge_m1_nativeaddress;

  //d1_lcd_i2c_sda_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_i2c_sda_s1_end_xfer <= 1;
      else 
        d1_lcd_i2c_sda_s1_end_xfer <= lcd_i2c_sda_s1_end_xfer;
    end


  //lcd_i2c_sda_s1_waits_for_read in a cycle, which is an e_mux
  assign lcd_i2c_sda_s1_waits_for_read = lcd_i2c_sda_s1_in_a_read_cycle & lcd_i2c_sda_s1_begins_xfer;

  //lcd_i2c_sda_s1_in_a_read_cycle assignment, which is an e_assign
  assign lcd_i2c_sda_s1_in_a_read_cycle = peripheral_bridge_m1_granted_lcd_i2c_sda_s1 & peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_i2c_sda_s1_in_a_read_cycle;

  //lcd_i2c_sda_s1_waits_for_write in a cycle, which is an e_mux
  assign lcd_i2c_sda_s1_waits_for_write = lcd_i2c_sda_s1_in_a_write_cycle & 0;

  //lcd_i2c_sda_s1_in_a_write_cycle assignment, which is an e_assign
  assign lcd_i2c_sda_s1_in_a_write_cycle = peripheral_bridge_m1_granted_lcd_i2c_sda_s1 & peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_i2c_sda_s1_in_a_write_cycle;

  assign wait_for_lcd_i2c_sda_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_i2c_sda/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_simple_clock_0_in_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_data_master_address_to_slave,
                                            cpu_data_master_byteenable,
                                            cpu_data_master_latency_counter,
                                            cpu_data_master_read,
                                            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                            cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                            cpu_data_master_write,
                                            cpu_data_master_writedata,
                                            nios_simple_clock_0_in_endofpacket,
                                            nios_simple_clock_0_in_readdata,
                                            nios_simple_clock_0_in_waitrequest,
                                            reset_n,

                                           // outputs:
                                            cpu_data_master_granted_nios_simple_clock_0_in,
                                            cpu_data_master_qualified_request_nios_simple_clock_0_in,
                                            cpu_data_master_read_data_valid_nios_simple_clock_0_in,
                                            cpu_data_master_requests_nios_simple_clock_0_in,
                                            d1_nios_simple_clock_0_in_end_xfer,
                                            nios_simple_clock_0_in_address,
                                            nios_simple_clock_0_in_byteenable,
                                            nios_simple_clock_0_in_endofpacket_from_sa,
                                            nios_simple_clock_0_in_nativeaddress,
                                            nios_simple_clock_0_in_read,
                                            nios_simple_clock_0_in_readdata_from_sa,
                                            nios_simple_clock_0_in_reset_n,
                                            nios_simple_clock_0_in_waitrequest_from_sa,
                                            nios_simple_clock_0_in_write,
                                            nios_simple_clock_0_in_writedata
                                         )
;

  output           cpu_data_master_granted_nios_simple_clock_0_in;
  output           cpu_data_master_qualified_request_nios_simple_clock_0_in;
  output           cpu_data_master_read_data_valid_nios_simple_clock_0_in;
  output           cpu_data_master_requests_nios_simple_clock_0_in;
  output           d1_nios_simple_clock_0_in_end_xfer;
  output  [  3: 0] nios_simple_clock_0_in_address;
  output  [  3: 0] nios_simple_clock_0_in_byteenable;
  output           nios_simple_clock_0_in_endofpacket_from_sa;
  output  [  1: 0] nios_simple_clock_0_in_nativeaddress;
  output           nios_simple_clock_0_in_read;
  output  [ 31: 0] nios_simple_clock_0_in_readdata_from_sa;
  output           nios_simple_clock_0_in_reset_n;
  output           nios_simple_clock_0_in_waitrequest_from_sa;
  output           nios_simple_clock_0_in_write;
  output  [ 31: 0] nios_simple_clock_0_in_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            nios_simple_clock_0_in_endofpacket;
  input   [ 31: 0] nios_simple_clock_0_in_readdata;
  input            nios_simple_clock_0_in_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_nios_simple_clock_0_in;
  wire             cpu_data_master_qualified_request_nios_simple_clock_0_in;
  wire             cpu_data_master_read_data_valid_nios_simple_clock_0_in;
  wire             cpu_data_master_requests_nios_simple_clock_0_in;
  wire             cpu_data_master_saved_grant_nios_simple_clock_0_in;
  reg              d1_nios_simple_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_nios_simple_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  3: 0] nios_simple_clock_0_in_address;
  wire             nios_simple_clock_0_in_allgrants;
  wire             nios_simple_clock_0_in_allow_new_arb_cycle;
  wire             nios_simple_clock_0_in_any_bursting_master_saved_grant;
  wire             nios_simple_clock_0_in_any_continuerequest;
  wire             nios_simple_clock_0_in_arb_counter_enable;
  reg     [  2: 0] nios_simple_clock_0_in_arb_share_counter;
  wire    [  2: 0] nios_simple_clock_0_in_arb_share_counter_next_value;
  wire    [  2: 0] nios_simple_clock_0_in_arb_share_set_values;
  wire             nios_simple_clock_0_in_beginbursttransfer_internal;
  wire             nios_simple_clock_0_in_begins_xfer;
  wire    [  3: 0] nios_simple_clock_0_in_byteenable;
  wire             nios_simple_clock_0_in_end_xfer;
  wire             nios_simple_clock_0_in_endofpacket_from_sa;
  wire             nios_simple_clock_0_in_firsttransfer;
  wire             nios_simple_clock_0_in_grant_vector;
  wire             nios_simple_clock_0_in_in_a_read_cycle;
  wire             nios_simple_clock_0_in_in_a_write_cycle;
  wire             nios_simple_clock_0_in_master_qreq_vector;
  wire    [  1: 0] nios_simple_clock_0_in_nativeaddress;
  wire             nios_simple_clock_0_in_non_bursting_master_requests;
  wire             nios_simple_clock_0_in_read;
  wire    [ 31: 0] nios_simple_clock_0_in_readdata_from_sa;
  reg              nios_simple_clock_0_in_reg_firsttransfer;
  wire             nios_simple_clock_0_in_reset_n;
  reg              nios_simple_clock_0_in_slavearbiterlockenable;
  wire             nios_simple_clock_0_in_slavearbiterlockenable2;
  wire             nios_simple_clock_0_in_unreg_firsttransfer;
  wire             nios_simple_clock_0_in_waitrequest_from_sa;
  wire             nios_simple_clock_0_in_waits_for_read;
  wire             nios_simple_clock_0_in_waits_for_write;
  wire             nios_simple_clock_0_in_write;
  wire    [ 31: 0] nios_simple_clock_0_in_writedata;
  wire             wait_for_nios_simple_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~nios_simple_clock_0_in_end_xfer;
    end


  assign nios_simple_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_nios_simple_clock_0_in));
  //assign nios_simple_clock_0_in_readdata_from_sa = nios_simple_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_simple_clock_0_in_readdata_from_sa = nios_simple_clock_0_in_readdata;

  assign cpu_data_master_requests_nios_simple_clock_0_in = ({cpu_data_master_address_to_slave[27 : 4] , 4'b0} == 28'ha411060) & (cpu_data_master_read | cpu_data_master_write);
  //assign nios_simple_clock_0_in_waitrequest_from_sa = nios_simple_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_simple_clock_0_in_waitrequest_from_sa = nios_simple_clock_0_in_waitrequest;

  //nios_simple_clock_0_in_arb_share_counter set values, which is an e_mux
  assign nios_simple_clock_0_in_arb_share_set_values = 1;

  //nios_simple_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign nios_simple_clock_0_in_non_bursting_master_requests = cpu_data_master_requests_nios_simple_clock_0_in;

  //nios_simple_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign nios_simple_clock_0_in_any_bursting_master_saved_grant = 0;

  //nios_simple_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign nios_simple_clock_0_in_arb_share_counter_next_value = nios_simple_clock_0_in_firsttransfer ? (nios_simple_clock_0_in_arb_share_set_values - 1) : |nios_simple_clock_0_in_arb_share_counter ? (nios_simple_clock_0_in_arb_share_counter - 1) : 0;

  //nios_simple_clock_0_in_allgrants all slave grants, which is an e_mux
  assign nios_simple_clock_0_in_allgrants = |nios_simple_clock_0_in_grant_vector;

  //nios_simple_clock_0_in_end_xfer assignment, which is an e_assign
  assign nios_simple_clock_0_in_end_xfer = ~(nios_simple_clock_0_in_waits_for_read | nios_simple_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_nios_simple_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_nios_simple_clock_0_in = nios_simple_clock_0_in_end_xfer & (~nios_simple_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //nios_simple_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign nios_simple_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_nios_simple_clock_0_in & nios_simple_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_nios_simple_clock_0_in & ~nios_simple_clock_0_in_non_bursting_master_requests);

  //nios_simple_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_simple_clock_0_in_arb_share_counter <= 0;
      else if (nios_simple_clock_0_in_arb_counter_enable)
          nios_simple_clock_0_in_arb_share_counter <= nios_simple_clock_0_in_arb_share_counter_next_value;
    end


  //nios_simple_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_simple_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|nios_simple_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_nios_simple_clock_0_in) | (end_xfer_arb_share_counter_term_nios_simple_clock_0_in & ~nios_simple_clock_0_in_non_bursting_master_requests))
          nios_simple_clock_0_in_slavearbiterlockenable <= |nios_simple_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/data_master nios_simple_clock_0/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = nios_simple_clock_0_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //nios_simple_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign nios_simple_clock_0_in_slavearbiterlockenable2 = |nios_simple_clock_0_in_arb_share_counter_next_value;

  //cpu/data_master nios_simple_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = nios_simple_clock_0_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //nios_simple_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign nios_simple_clock_0_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_nios_simple_clock_0_in = cpu_data_master_requests_nios_simple_clock_0_in & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_nios_simple_clock_0_in, which is an e_mux
  assign cpu_data_master_read_data_valid_nios_simple_clock_0_in = cpu_data_master_granted_nios_simple_clock_0_in & cpu_data_master_read & ~nios_simple_clock_0_in_waits_for_read;

  //nios_simple_clock_0_in_writedata mux, which is an e_mux
  assign nios_simple_clock_0_in_writedata = cpu_data_master_writedata;

  //assign nios_simple_clock_0_in_endofpacket_from_sa = nios_simple_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign nios_simple_clock_0_in_endofpacket_from_sa = nios_simple_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_nios_simple_clock_0_in = cpu_data_master_qualified_request_nios_simple_clock_0_in;

  //cpu/data_master saved-grant nios_simple_clock_0/in, which is an e_assign
  assign cpu_data_master_saved_grant_nios_simple_clock_0_in = cpu_data_master_requests_nios_simple_clock_0_in;

  //allow new arb cycle for nios_simple_clock_0/in, which is an e_assign
  assign nios_simple_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign nios_simple_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign nios_simple_clock_0_in_master_qreq_vector = 1;

  //nios_simple_clock_0_in_reset_n assignment, which is an e_assign
  assign nios_simple_clock_0_in_reset_n = reset_n;

  //nios_simple_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign nios_simple_clock_0_in_firsttransfer = nios_simple_clock_0_in_begins_xfer ? nios_simple_clock_0_in_unreg_firsttransfer : nios_simple_clock_0_in_reg_firsttransfer;

  //nios_simple_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign nios_simple_clock_0_in_unreg_firsttransfer = ~(nios_simple_clock_0_in_slavearbiterlockenable & nios_simple_clock_0_in_any_continuerequest);

  //nios_simple_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_simple_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (nios_simple_clock_0_in_begins_xfer)
          nios_simple_clock_0_in_reg_firsttransfer <= nios_simple_clock_0_in_unreg_firsttransfer;
    end


  //nios_simple_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign nios_simple_clock_0_in_beginbursttransfer_internal = nios_simple_clock_0_in_begins_xfer;

  //nios_simple_clock_0_in_read assignment, which is an e_mux
  assign nios_simple_clock_0_in_read = cpu_data_master_granted_nios_simple_clock_0_in & cpu_data_master_read;

  //nios_simple_clock_0_in_write assignment, which is an e_mux
  assign nios_simple_clock_0_in_write = cpu_data_master_granted_nios_simple_clock_0_in & cpu_data_master_write;

  //nios_simple_clock_0_in_address mux, which is an e_mux
  assign nios_simple_clock_0_in_address = cpu_data_master_address_to_slave;

  //slaveid nios_simple_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign nios_simple_clock_0_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_nios_simple_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_nios_simple_clock_0_in_end_xfer <= 1;
      else 
        d1_nios_simple_clock_0_in_end_xfer <= nios_simple_clock_0_in_end_xfer;
    end


  //nios_simple_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign nios_simple_clock_0_in_waits_for_read = nios_simple_clock_0_in_in_a_read_cycle & nios_simple_clock_0_in_waitrequest_from_sa;

  //nios_simple_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign nios_simple_clock_0_in_in_a_read_cycle = cpu_data_master_granted_nios_simple_clock_0_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = nios_simple_clock_0_in_in_a_read_cycle;

  //nios_simple_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign nios_simple_clock_0_in_waits_for_write = nios_simple_clock_0_in_in_a_write_cycle & nios_simple_clock_0_in_waitrequest_from_sa;

  //nios_simple_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign nios_simple_clock_0_in_in_a_write_cycle = cpu_data_master_granted_nios_simple_clock_0_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = nios_simple_clock_0_in_in_a_write_cycle;

  assign wait_for_nios_simple_clock_0_in_counter = 0;
  //nios_simple_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign nios_simple_clock_0_in_byteenable = (cpu_data_master_granted_nios_simple_clock_0_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_simple_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_simple_clock_0_out_arbitrator (
                                            // inputs:
                                             clk,
                                             d1_pll_pll_slave_end_xfer,
                                             nios_simple_clock_0_out_address,
                                             nios_simple_clock_0_out_byteenable,
                                             nios_simple_clock_0_out_granted_pll_pll_slave,
                                             nios_simple_clock_0_out_qualified_request_pll_pll_slave,
                                             nios_simple_clock_0_out_read,
                                             nios_simple_clock_0_out_read_data_valid_pll_pll_slave,
                                             nios_simple_clock_0_out_requests_pll_pll_slave,
                                             nios_simple_clock_0_out_write,
                                             nios_simple_clock_0_out_writedata,
                                             pll_pll_slave_readdata_from_sa,
                                             reset_n,

                                            // outputs:
                                             nios_simple_clock_0_out_address_to_slave,
                                             nios_simple_clock_0_out_readdata,
                                             nios_simple_clock_0_out_reset_n,
                                             nios_simple_clock_0_out_waitrequest
                                          )
;

  output  [  3: 0] nios_simple_clock_0_out_address_to_slave;
  output  [ 31: 0] nios_simple_clock_0_out_readdata;
  output           nios_simple_clock_0_out_reset_n;
  output           nios_simple_clock_0_out_waitrequest;
  input            clk;
  input            d1_pll_pll_slave_end_xfer;
  input   [  3: 0] nios_simple_clock_0_out_address;
  input   [  3: 0] nios_simple_clock_0_out_byteenable;
  input            nios_simple_clock_0_out_granted_pll_pll_slave;
  input            nios_simple_clock_0_out_qualified_request_pll_pll_slave;
  input            nios_simple_clock_0_out_read;
  input            nios_simple_clock_0_out_read_data_valid_pll_pll_slave;
  input            nios_simple_clock_0_out_requests_pll_pll_slave;
  input            nios_simple_clock_0_out_write;
  input   [ 31: 0] nios_simple_clock_0_out_writedata;
  input   [ 31: 0] pll_pll_slave_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [  3: 0] nios_simple_clock_0_out_address_last_time;
  wire    [  3: 0] nios_simple_clock_0_out_address_to_slave;
  reg     [  3: 0] nios_simple_clock_0_out_byteenable_last_time;
  reg              nios_simple_clock_0_out_read_last_time;
  wire    [ 31: 0] nios_simple_clock_0_out_readdata;
  wire             nios_simple_clock_0_out_reset_n;
  wire             nios_simple_clock_0_out_run;
  wire             nios_simple_clock_0_out_waitrequest;
  reg              nios_simple_clock_0_out_write_last_time;
  reg     [ 31: 0] nios_simple_clock_0_out_writedata_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~nios_simple_clock_0_out_qualified_request_pll_pll_slave | ~(nios_simple_clock_0_out_read | nios_simple_clock_0_out_write) | (1 & (nios_simple_clock_0_out_read | nios_simple_clock_0_out_write)))) & ((~nios_simple_clock_0_out_qualified_request_pll_pll_slave | ~(nios_simple_clock_0_out_read | nios_simple_clock_0_out_write) | (1 & (nios_simple_clock_0_out_read | nios_simple_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign nios_simple_clock_0_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign nios_simple_clock_0_out_address_to_slave = nios_simple_clock_0_out_address;

  //nios_simple_clock_0/out readdata mux, which is an e_mux
  assign nios_simple_clock_0_out_readdata = pll_pll_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign nios_simple_clock_0_out_waitrequest = ~nios_simple_clock_0_out_run;

  //nios_simple_clock_0_out_reset_n assignment, which is an e_assign
  assign nios_simple_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //nios_simple_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_simple_clock_0_out_address_last_time <= 0;
      else 
        nios_simple_clock_0_out_address_last_time <= nios_simple_clock_0_out_address;
    end


  //nios_simple_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= nios_simple_clock_0_out_waitrequest & (nios_simple_clock_0_out_read | nios_simple_clock_0_out_write);
    end


  //nios_simple_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_simple_clock_0_out_address != nios_simple_clock_0_out_address_last_time))
        begin
          $write("%0d ns: nios_simple_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_simple_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_simple_clock_0_out_byteenable_last_time <= 0;
      else 
        nios_simple_clock_0_out_byteenable_last_time <= nios_simple_clock_0_out_byteenable;
    end


  //nios_simple_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_simple_clock_0_out_byteenable != nios_simple_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: nios_simple_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_simple_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_simple_clock_0_out_read_last_time <= 0;
      else 
        nios_simple_clock_0_out_read_last_time <= nios_simple_clock_0_out_read;
    end


  //nios_simple_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_simple_clock_0_out_read != nios_simple_clock_0_out_read_last_time))
        begin
          $write("%0d ns: nios_simple_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_simple_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_simple_clock_0_out_write_last_time <= 0;
      else 
        nios_simple_clock_0_out_write_last_time <= nios_simple_clock_0_out_write;
    end


  //nios_simple_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_simple_clock_0_out_write != nios_simple_clock_0_out_write_last_time))
        begin
          $write("%0d ns: nios_simple_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //nios_simple_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          nios_simple_clock_0_out_writedata_last_time <= 0;
      else 
        nios_simple_clock_0_out_writedata_last_time <= nios_simple_clock_0_out_writedata;
    end


  //nios_simple_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (nios_simple_clock_0_out_writedata != nios_simple_clock_0_out_writedata_last_time) & nios_simple_clock_0_out_write)
        begin
          $write("%0d ns: nios_simple_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_peripheral_bridge_s1_module (
                                                                     // inputs:
                                                                      clear_fifo,
                                                                      clk,
                                                                      data_in,
                                                                      read,
                                                                      reset_n,
                                                                      sync_reset,
                                                                      write,

                                                                     // outputs:
                                                                      data_out,
                                                                      empty,
                                                                      fifo_contains_ones_n,
                                                                      full
                                                                   )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  reg              full_32;
  reg              full_33;
  reg              full_34;
  reg              full_35;
  reg              full_36;
  reg              full_37;
  reg              full_38;
  reg              full_39;
  reg              full_4;
  reg              full_40;
  reg              full_41;
  reg              full_42;
  reg              full_43;
  reg              full_44;
  reg              full_45;
  reg              full_46;
  reg              full_47;
  reg              full_48;
  reg              full_49;
  reg              full_5;
  reg              full_50;
  reg              full_51;
  reg              full_52;
  reg              full_53;
  reg              full_54;
  reg              full_55;
  reg              full_56;
  reg              full_57;
  reg              full_58;
  reg              full_59;
  reg              full_6;
  reg              full_60;
  reg              full_61;
  reg              full_62;
  reg              full_63;
  wire             full_64;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  7: 0] how_many_ones;
  wire    [  7: 0] one_count_minus_one;
  wire    [  7: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p32_full_32;
  wire             p32_stage_32;
  wire             p33_full_33;
  wire             p33_stage_33;
  wire             p34_full_34;
  wire             p34_stage_34;
  wire             p35_full_35;
  wire             p35_stage_35;
  wire             p36_full_36;
  wire             p36_stage_36;
  wire             p37_full_37;
  wire             p37_stage_37;
  wire             p38_full_38;
  wire             p38_stage_38;
  wire             p39_full_39;
  wire             p39_stage_39;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p40_full_40;
  wire             p40_stage_40;
  wire             p41_full_41;
  wire             p41_stage_41;
  wire             p42_full_42;
  wire             p42_stage_42;
  wire             p43_full_43;
  wire             p43_stage_43;
  wire             p44_full_44;
  wire             p44_stage_44;
  wire             p45_full_45;
  wire             p45_stage_45;
  wire             p46_full_46;
  wire             p46_stage_46;
  wire             p47_full_47;
  wire             p47_stage_47;
  wire             p48_full_48;
  wire             p48_stage_48;
  wire             p49_full_49;
  wire             p49_stage_49;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p50_full_50;
  wire             p50_stage_50;
  wire             p51_full_51;
  wire             p51_stage_51;
  wire             p52_full_52;
  wire             p52_stage_52;
  wire             p53_full_53;
  wire             p53_stage_53;
  wire             p54_full_54;
  wire             p54_stage_54;
  wire             p55_full_55;
  wire             p55_stage_55;
  wire             p56_full_56;
  wire             p56_stage_56;
  wire             p57_full_57;
  wire             p57_stage_57;
  wire             p58_full_58;
  wire             p58_stage_58;
  wire             p59_full_59;
  wire             p59_stage_59;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p60_full_60;
  wire             p60_stage_60;
  wire             p61_full_61;
  wire             p61_stage_61;
  wire             p62_full_62;
  wire             p62_stage_62;
  wire             p63_full_63;
  wire             p63_stage_63;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_32;
  reg              stage_33;
  reg              stage_34;
  reg              stage_35;
  reg              stage_36;
  reg              stage_37;
  reg              stage_38;
  reg              stage_39;
  reg              stage_4;
  reg              stage_40;
  reg              stage_41;
  reg              stage_42;
  reg              stage_43;
  reg              stage_44;
  reg              stage_45;
  reg              stage_46;
  reg              stage_47;
  reg              stage_48;
  reg              stage_49;
  reg              stage_5;
  reg              stage_50;
  reg              stage_51;
  reg              stage_52;
  reg              stage_53;
  reg              stage_54;
  reg              stage_55;
  reg              stage_56;
  reg              stage_57;
  reg              stage_58;
  reg              stage_59;
  reg              stage_6;
  reg              stage_60;
  reg              stage_61;
  reg              stage_62;
  reg              stage_63;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  7: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_63;
  assign empty = !full_0;
  assign full_64 = 0;
  //data_63, which is an e_mux
  assign p63_stage_63 = ((full_64 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_63, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_63 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_63))
          if (sync_reset & full_63 & !((full_64 == 0) & read & write))
              stage_63 <= 0;
          else 
            stage_63 <= p63_stage_63;
    end


  //control_63, which is an e_mux
  assign p63_full_63 = ((read & !write) == 0)? full_62 :
    0;

  //control_reg_63, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_63 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_63 <= 0;
          else 
            full_63 <= p63_full_63;
    end


  //data_62, which is an e_mux
  assign p62_stage_62 = ((full_63 & ~clear_fifo) == 0)? data_in :
    stage_63;

  //data_reg_62, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_62 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_62))
          if (sync_reset & full_62 & !((full_63 == 0) & read & write))
              stage_62 <= 0;
          else 
            stage_62 <= p62_stage_62;
    end


  //control_62, which is an e_mux
  assign p62_full_62 = ((read & !write) == 0)? full_61 :
    full_63;

  //control_reg_62, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_62 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_62 <= 0;
          else 
            full_62 <= p62_full_62;
    end


  //data_61, which is an e_mux
  assign p61_stage_61 = ((full_62 & ~clear_fifo) == 0)? data_in :
    stage_62;

  //data_reg_61, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_61 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_61))
          if (sync_reset & full_61 & !((full_62 == 0) & read & write))
              stage_61 <= 0;
          else 
            stage_61 <= p61_stage_61;
    end


  //control_61, which is an e_mux
  assign p61_full_61 = ((read & !write) == 0)? full_60 :
    full_62;

  //control_reg_61, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_61 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_61 <= 0;
          else 
            full_61 <= p61_full_61;
    end


  //data_60, which is an e_mux
  assign p60_stage_60 = ((full_61 & ~clear_fifo) == 0)? data_in :
    stage_61;

  //data_reg_60, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_60 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_60))
          if (sync_reset & full_60 & !((full_61 == 0) & read & write))
              stage_60 <= 0;
          else 
            stage_60 <= p60_stage_60;
    end


  //control_60, which is an e_mux
  assign p60_full_60 = ((read & !write) == 0)? full_59 :
    full_61;

  //control_reg_60, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_60 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_60 <= 0;
          else 
            full_60 <= p60_full_60;
    end


  //data_59, which is an e_mux
  assign p59_stage_59 = ((full_60 & ~clear_fifo) == 0)? data_in :
    stage_60;

  //data_reg_59, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_59 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_59))
          if (sync_reset & full_59 & !((full_60 == 0) & read & write))
              stage_59 <= 0;
          else 
            stage_59 <= p59_stage_59;
    end


  //control_59, which is an e_mux
  assign p59_full_59 = ((read & !write) == 0)? full_58 :
    full_60;

  //control_reg_59, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_59 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_59 <= 0;
          else 
            full_59 <= p59_full_59;
    end


  //data_58, which is an e_mux
  assign p58_stage_58 = ((full_59 & ~clear_fifo) == 0)? data_in :
    stage_59;

  //data_reg_58, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_58 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_58))
          if (sync_reset & full_58 & !((full_59 == 0) & read & write))
              stage_58 <= 0;
          else 
            stage_58 <= p58_stage_58;
    end


  //control_58, which is an e_mux
  assign p58_full_58 = ((read & !write) == 0)? full_57 :
    full_59;

  //control_reg_58, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_58 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_58 <= 0;
          else 
            full_58 <= p58_full_58;
    end


  //data_57, which is an e_mux
  assign p57_stage_57 = ((full_58 & ~clear_fifo) == 0)? data_in :
    stage_58;

  //data_reg_57, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_57 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_57))
          if (sync_reset & full_57 & !((full_58 == 0) & read & write))
              stage_57 <= 0;
          else 
            stage_57 <= p57_stage_57;
    end


  //control_57, which is an e_mux
  assign p57_full_57 = ((read & !write) == 0)? full_56 :
    full_58;

  //control_reg_57, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_57 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_57 <= 0;
          else 
            full_57 <= p57_full_57;
    end


  //data_56, which is an e_mux
  assign p56_stage_56 = ((full_57 & ~clear_fifo) == 0)? data_in :
    stage_57;

  //data_reg_56, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_56 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_56))
          if (sync_reset & full_56 & !((full_57 == 0) & read & write))
              stage_56 <= 0;
          else 
            stage_56 <= p56_stage_56;
    end


  //control_56, which is an e_mux
  assign p56_full_56 = ((read & !write) == 0)? full_55 :
    full_57;

  //control_reg_56, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_56 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_56 <= 0;
          else 
            full_56 <= p56_full_56;
    end


  //data_55, which is an e_mux
  assign p55_stage_55 = ((full_56 & ~clear_fifo) == 0)? data_in :
    stage_56;

  //data_reg_55, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_55 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_55))
          if (sync_reset & full_55 & !((full_56 == 0) & read & write))
              stage_55 <= 0;
          else 
            stage_55 <= p55_stage_55;
    end


  //control_55, which is an e_mux
  assign p55_full_55 = ((read & !write) == 0)? full_54 :
    full_56;

  //control_reg_55, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_55 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_55 <= 0;
          else 
            full_55 <= p55_full_55;
    end


  //data_54, which is an e_mux
  assign p54_stage_54 = ((full_55 & ~clear_fifo) == 0)? data_in :
    stage_55;

  //data_reg_54, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_54 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_54))
          if (sync_reset & full_54 & !((full_55 == 0) & read & write))
              stage_54 <= 0;
          else 
            stage_54 <= p54_stage_54;
    end


  //control_54, which is an e_mux
  assign p54_full_54 = ((read & !write) == 0)? full_53 :
    full_55;

  //control_reg_54, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_54 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_54 <= 0;
          else 
            full_54 <= p54_full_54;
    end


  //data_53, which is an e_mux
  assign p53_stage_53 = ((full_54 & ~clear_fifo) == 0)? data_in :
    stage_54;

  //data_reg_53, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_53 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_53))
          if (sync_reset & full_53 & !((full_54 == 0) & read & write))
              stage_53 <= 0;
          else 
            stage_53 <= p53_stage_53;
    end


  //control_53, which is an e_mux
  assign p53_full_53 = ((read & !write) == 0)? full_52 :
    full_54;

  //control_reg_53, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_53 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_53 <= 0;
          else 
            full_53 <= p53_full_53;
    end


  //data_52, which is an e_mux
  assign p52_stage_52 = ((full_53 & ~clear_fifo) == 0)? data_in :
    stage_53;

  //data_reg_52, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_52 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_52))
          if (sync_reset & full_52 & !((full_53 == 0) & read & write))
              stage_52 <= 0;
          else 
            stage_52 <= p52_stage_52;
    end


  //control_52, which is an e_mux
  assign p52_full_52 = ((read & !write) == 0)? full_51 :
    full_53;

  //control_reg_52, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_52 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_52 <= 0;
          else 
            full_52 <= p52_full_52;
    end


  //data_51, which is an e_mux
  assign p51_stage_51 = ((full_52 & ~clear_fifo) == 0)? data_in :
    stage_52;

  //data_reg_51, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_51 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_51))
          if (sync_reset & full_51 & !((full_52 == 0) & read & write))
              stage_51 <= 0;
          else 
            stage_51 <= p51_stage_51;
    end


  //control_51, which is an e_mux
  assign p51_full_51 = ((read & !write) == 0)? full_50 :
    full_52;

  //control_reg_51, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_51 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_51 <= 0;
          else 
            full_51 <= p51_full_51;
    end


  //data_50, which is an e_mux
  assign p50_stage_50 = ((full_51 & ~clear_fifo) == 0)? data_in :
    stage_51;

  //data_reg_50, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_50 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_50))
          if (sync_reset & full_50 & !((full_51 == 0) & read & write))
              stage_50 <= 0;
          else 
            stage_50 <= p50_stage_50;
    end


  //control_50, which is an e_mux
  assign p50_full_50 = ((read & !write) == 0)? full_49 :
    full_51;

  //control_reg_50, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_50 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_50 <= 0;
          else 
            full_50 <= p50_full_50;
    end


  //data_49, which is an e_mux
  assign p49_stage_49 = ((full_50 & ~clear_fifo) == 0)? data_in :
    stage_50;

  //data_reg_49, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_49 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_49))
          if (sync_reset & full_49 & !((full_50 == 0) & read & write))
              stage_49 <= 0;
          else 
            stage_49 <= p49_stage_49;
    end


  //control_49, which is an e_mux
  assign p49_full_49 = ((read & !write) == 0)? full_48 :
    full_50;

  //control_reg_49, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_49 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_49 <= 0;
          else 
            full_49 <= p49_full_49;
    end


  //data_48, which is an e_mux
  assign p48_stage_48 = ((full_49 & ~clear_fifo) == 0)? data_in :
    stage_49;

  //data_reg_48, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_48 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_48))
          if (sync_reset & full_48 & !((full_49 == 0) & read & write))
              stage_48 <= 0;
          else 
            stage_48 <= p48_stage_48;
    end


  //control_48, which is an e_mux
  assign p48_full_48 = ((read & !write) == 0)? full_47 :
    full_49;

  //control_reg_48, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_48 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_48 <= 0;
          else 
            full_48 <= p48_full_48;
    end


  //data_47, which is an e_mux
  assign p47_stage_47 = ((full_48 & ~clear_fifo) == 0)? data_in :
    stage_48;

  //data_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_47 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_47))
          if (sync_reset & full_47 & !((full_48 == 0) & read & write))
              stage_47 <= 0;
          else 
            stage_47 <= p47_stage_47;
    end


  //control_47, which is an e_mux
  assign p47_full_47 = ((read & !write) == 0)? full_46 :
    full_48;

  //control_reg_47, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_47 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_47 <= 0;
          else 
            full_47 <= p47_full_47;
    end


  //data_46, which is an e_mux
  assign p46_stage_46 = ((full_47 & ~clear_fifo) == 0)? data_in :
    stage_47;

  //data_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_46 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_46))
          if (sync_reset & full_46 & !((full_47 == 0) & read & write))
              stage_46 <= 0;
          else 
            stage_46 <= p46_stage_46;
    end


  //control_46, which is an e_mux
  assign p46_full_46 = ((read & !write) == 0)? full_45 :
    full_47;

  //control_reg_46, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_46 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_46 <= 0;
          else 
            full_46 <= p46_full_46;
    end


  //data_45, which is an e_mux
  assign p45_stage_45 = ((full_46 & ~clear_fifo) == 0)? data_in :
    stage_46;

  //data_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_45 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_45))
          if (sync_reset & full_45 & !((full_46 == 0) & read & write))
              stage_45 <= 0;
          else 
            stage_45 <= p45_stage_45;
    end


  //control_45, which is an e_mux
  assign p45_full_45 = ((read & !write) == 0)? full_44 :
    full_46;

  //control_reg_45, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_45 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_45 <= 0;
          else 
            full_45 <= p45_full_45;
    end


  //data_44, which is an e_mux
  assign p44_stage_44 = ((full_45 & ~clear_fifo) == 0)? data_in :
    stage_45;

  //data_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_44 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_44))
          if (sync_reset & full_44 & !((full_45 == 0) & read & write))
              stage_44 <= 0;
          else 
            stage_44 <= p44_stage_44;
    end


  //control_44, which is an e_mux
  assign p44_full_44 = ((read & !write) == 0)? full_43 :
    full_45;

  //control_reg_44, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_44 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_44 <= 0;
          else 
            full_44 <= p44_full_44;
    end


  //data_43, which is an e_mux
  assign p43_stage_43 = ((full_44 & ~clear_fifo) == 0)? data_in :
    stage_44;

  //data_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_43 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_43))
          if (sync_reset & full_43 & !((full_44 == 0) & read & write))
              stage_43 <= 0;
          else 
            stage_43 <= p43_stage_43;
    end


  //control_43, which is an e_mux
  assign p43_full_43 = ((read & !write) == 0)? full_42 :
    full_44;

  //control_reg_43, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_43 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_43 <= 0;
          else 
            full_43 <= p43_full_43;
    end


  //data_42, which is an e_mux
  assign p42_stage_42 = ((full_43 & ~clear_fifo) == 0)? data_in :
    stage_43;

  //data_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_42 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_42))
          if (sync_reset & full_42 & !((full_43 == 0) & read & write))
              stage_42 <= 0;
          else 
            stage_42 <= p42_stage_42;
    end


  //control_42, which is an e_mux
  assign p42_full_42 = ((read & !write) == 0)? full_41 :
    full_43;

  //control_reg_42, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_42 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_42 <= 0;
          else 
            full_42 <= p42_full_42;
    end


  //data_41, which is an e_mux
  assign p41_stage_41 = ((full_42 & ~clear_fifo) == 0)? data_in :
    stage_42;

  //data_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_41 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_41))
          if (sync_reset & full_41 & !((full_42 == 0) & read & write))
              stage_41 <= 0;
          else 
            stage_41 <= p41_stage_41;
    end


  //control_41, which is an e_mux
  assign p41_full_41 = ((read & !write) == 0)? full_40 :
    full_42;

  //control_reg_41, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_41 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_41 <= 0;
          else 
            full_41 <= p41_full_41;
    end


  //data_40, which is an e_mux
  assign p40_stage_40 = ((full_41 & ~clear_fifo) == 0)? data_in :
    stage_41;

  //data_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_40 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_40))
          if (sync_reset & full_40 & !((full_41 == 0) & read & write))
              stage_40 <= 0;
          else 
            stage_40 <= p40_stage_40;
    end


  //control_40, which is an e_mux
  assign p40_full_40 = ((read & !write) == 0)? full_39 :
    full_41;

  //control_reg_40, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_40 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_40 <= 0;
          else 
            full_40 <= p40_full_40;
    end


  //data_39, which is an e_mux
  assign p39_stage_39 = ((full_40 & ~clear_fifo) == 0)? data_in :
    stage_40;

  //data_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_39 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_39))
          if (sync_reset & full_39 & !((full_40 == 0) & read & write))
              stage_39 <= 0;
          else 
            stage_39 <= p39_stage_39;
    end


  //control_39, which is an e_mux
  assign p39_full_39 = ((read & !write) == 0)? full_38 :
    full_40;

  //control_reg_39, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_39 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_39 <= 0;
          else 
            full_39 <= p39_full_39;
    end


  //data_38, which is an e_mux
  assign p38_stage_38 = ((full_39 & ~clear_fifo) == 0)? data_in :
    stage_39;

  //data_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_38 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_38))
          if (sync_reset & full_38 & !((full_39 == 0) & read & write))
              stage_38 <= 0;
          else 
            stage_38 <= p38_stage_38;
    end


  //control_38, which is an e_mux
  assign p38_full_38 = ((read & !write) == 0)? full_37 :
    full_39;

  //control_reg_38, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_38 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_38 <= 0;
          else 
            full_38 <= p38_full_38;
    end


  //data_37, which is an e_mux
  assign p37_stage_37 = ((full_38 & ~clear_fifo) == 0)? data_in :
    stage_38;

  //data_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_37 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_37))
          if (sync_reset & full_37 & !((full_38 == 0) & read & write))
              stage_37 <= 0;
          else 
            stage_37 <= p37_stage_37;
    end


  //control_37, which is an e_mux
  assign p37_full_37 = ((read & !write) == 0)? full_36 :
    full_38;

  //control_reg_37, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_37 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_37 <= 0;
          else 
            full_37 <= p37_full_37;
    end


  //data_36, which is an e_mux
  assign p36_stage_36 = ((full_37 & ~clear_fifo) == 0)? data_in :
    stage_37;

  //data_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_36 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_36))
          if (sync_reset & full_36 & !((full_37 == 0) & read & write))
              stage_36 <= 0;
          else 
            stage_36 <= p36_stage_36;
    end


  //control_36, which is an e_mux
  assign p36_full_36 = ((read & !write) == 0)? full_35 :
    full_37;

  //control_reg_36, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_36 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_36 <= 0;
          else 
            full_36 <= p36_full_36;
    end


  //data_35, which is an e_mux
  assign p35_stage_35 = ((full_36 & ~clear_fifo) == 0)? data_in :
    stage_36;

  //data_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_35 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_35))
          if (sync_reset & full_35 & !((full_36 == 0) & read & write))
              stage_35 <= 0;
          else 
            stage_35 <= p35_stage_35;
    end


  //control_35, which is an e_mux
  assign p35_full_35 = ((read & !write) == 0)? full_34 :
    full_36;

  //control_reg_35, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_35 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_35 <= 0;
          else 
            full_35 <= p35_full_35;
    end


  //data_34, which is an e_mux
  assign p34_stage_34 = ((full_35 & ~clear_fifo) == 0)? data_in :
    stage_35;

  //data_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_34 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_34))
          if (sync_reset & full_34 & !((full_35 == 0) & read & write))
              stage_34 <= 0;
          else 
            stage_34 <= p34_stage_34;
    end


  //control_34, which is an e_mux
  assign p34_full_34 = ((read & !write) == 0)? full_33 :
    full_35;

  //control_reg_34, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_34 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_34 <= 0;
          else 
            full_34 <= p34_full_34;
    end


  //data_33, which is an e_mux
  assign p33_stage_33 = ((full_34 & ~clear_fifo) == 0)? data_in :
    stage_34;

  //data_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_33 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_33))
          if (sync_reset & full_33 & !((full_34 == 0) & read & write))
              stage_33 <= 0;
          else 
            stage_33 <= p33_stage_33;
    end


  //control_33, which is an e_mux
  assign p33_full_33 = ((read & !write) == 0)? full_32 :
    full_34;

  //control_reg_33, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_33 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_33 <= 0;
          else 
            full_33 <= p33_full_33;
    end


  //data_32, which is an e_mux
  assign p32_stage_32 = ((full_33 & ~clear_fifo) == 0)? data_in :
    stage_33;

  //data_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_32 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_32))
          if (sync_reset & full_32 & !((full_33 == 0) & read & write))
              stage_32 <= 0;
          else 
            stage_32 <= p32_stage_32;
    end


  //control_32, which is an e_mux
  assign p32_full_32 = ((read & !write) == 0)? full_31 :
    full_33;

  //control_reg_32, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_32 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_32 <= 0;
          else 
            full_32 <= p32_full_32;
    end


  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    stage_32;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    full_32;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module peripheral_bridge_s1_arbitrator (
                                         // inputs:
                                          clk,
                                          cpu_data_master_address_to_slave,
                                          cpu_data_master_byteenable,
                                          cpu_data_master_latency_counter,
                                          cpu_data_master_read,
                                          cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                          cpu_data_master_write,
                                          cpu_data_master_writedata,
                                          peripheral_bridge_s1_endofpacket,
                                          peripheral_bridge_s1_readdata,
                                          peripheral_bridge_s1_readdatavalid,
                                          peripheral_bridge_s1_waitrequest,
                                          reset_n,

                                         // outputs:
                                          cpu_data_master_granted_peripheral_bridge_s1,
                                          cpu_data_master_qualified_request_peripheral_bridge_s1,
                                          cpu_data_master_read_data_valid_peripheral_bridge_s1,
                                          cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                          cpu_data_master_requests_peripheral_bridge_s1,
                                          d1_peripheral_bridge_s1_end_xfer,
                                          peripheral_bridge_s1_address,
                                          peripheral_bridge_s1_byteenable,
                                          peripheral_bridge_s1_endofpacket_from_sa,
                                          peripheral_bridge_s1_nativeaddress,
                                          peripheral_bridge_s1_read,
                                          peripheral_bridge_s1_readdata_from_sa,
                                          peripheral_bridge_s1_reset_n,
                                          peripheral_bridge_s1_waitrequest_from_sa,
                                          peripheral_bridge_s1_write,
                                          peripheral_bridge_s1_writedata
                                       )
;

  output           cpu_data_master_granted_peripheral_bridge_s1;
  output           cpu_data_master_qualified_request_peripheral_bridge_s1;
  output           cpu_data_master_read_data_valid_peripheral_bridge_s1;
  output           cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  output           cpu_data_master_requests_peripheral_bridge_s1;
  output           d1_peripheral_bridge_s1_end_xfer;
  output  [  8: 0] peripheral_bridge_s1_address;
  output  [  3: 0] peripheral_bridge_s1_byteenable;
  output           peripheral_bridge_s1_endofpacket_from_sa;
  output  [  8: 0] peripheral_bridge_s1_nativeaddress;
  output           peripheral_bridge_s1_read;
  output  [ 31: 0] peripheral_bridge_s1_readdata_from_sa;
  output           peripheral_bridge_s1_reset_n;
  output           peripheral_bridge_s1_waitrequest_from_sa;
  output           peripheral_bridge_s1_write;
  output  [ 31: 0] peripheral_bridge_s1_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            peripheral_bridge_s1_endofpacket;
  input   [ 31: 0] peripheral_bridge_s1_readdata;
  input            peripheral_bridge_s1_readdatavalid;
  input            peripheral_bridge_s1_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_peripheral_bridge_s1;
  wire             cpu_data_master_qualified_request_peripheral_bridge_s1;
  wire             cpu_data_master_rdv_fifo_empty_peripheral_bridge_s1;
  wire             cpu_data_master_rdv_fifo_output_from_peripheral_bridge_s1;
  wire             cpu_data_master_read_data_valid_peripheral_bridge_s1;
  wire             cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  wire             cpu_data_master_requests_peripheral_bridge_s1;
  wire             cpu_data_master_saved_grant_peripheral_bridge_s1;
  reg              d1_peripheral_bridge_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_peripheral_bridge_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  8: 0] peripheral_bridge_s1_address;
  wire             peripheral_bridge_s1_allgrants;
  wire             peripheral_bridge_s1_allow_new_arb_cycle;
  wire             peripheral_bridge_s1_any_bursting_master_saved_grant;
  wire             peripheral_bridge_s1_any_continuerequest;
  wire             peripheral_bridge_s1_arb_counter_enable;
  reg     [  2: 0] peripheral_bridge_s1_arb_share_counter;
  wire    [  2: 0] peripheral_bridge_s1_arb_share_counter_next_value;
  wire    [  2: 0] peripheral_bridge_s1_arb_share_set_values;
  wire             peripheral_bridge_s1_beginbursttransfer_internal;
  wire             peripheral_bridge_s1_begins_xfer;
  wire    [  3: 0] peripheral_bridge_s1_byteenable;
  wire             peripheral_bridge_s1_end_xfer;
  wire             peripheral_bridge_s1_endofpacket_from_sa;
  wire             peripheral_bridge_s1_firsttransfer;
  wire             peripheral_bridge_s1_grant_vector;
  wire             peripheral_bridge_s1_in_a_read_cycle;
  wire             peripheral_bridge_s1_in_a_write_cycle;
  wire             peripheral_bridge_s1_master_qreq_vector;
  wire             peripheral_bridge_s1_move_on_to_next_transaction;
  wire    [  8: 0] peripheral_bridge_s1_nativeaddress;
  wire             peripheral_bridge_s1_non_bursting_master_requests;
  wire             peripheral_bridge_s1_read;
  wire    [ 31: 0] peripheral_bridge_s1_readdata_from_sa;
  wire             peripheral_bridge_s1_readdatavalid_from_sa;
  reg              peripheral_bridge_s1_reg_firsttransfer;
  wire             peripheral_bridge_s1_reset_n;
  reg              peripheral_bridge_s1_slavearbiterlockenable;
  wire             peripheral_bridge_s1_slavearbiterlockenable2;
  wire             peripheral_bridge_s1_unreg_firsttransfer;
  wire             peripheral_bridge_s1_waitrequest_from_sa;
  wire             peripheral_bridge_s1_waits_for_read;
  wire             peripheral_bridge_s1_waits_for_write;
  wire             peripheral_bridge_s1_write;
  wire    [ 31: 0] peripheral_bridge_s1_writedata;
  wire    [ 27: 0] shifted_address_to_peripheral_bridge_s1_from_cpu_data_master;
  wire             wait_for_peripheral_bridge_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~peripheral_bridge_s1_end_xfer;
    end


  assign peripheral_bridge_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_peripheral_bridge_s1));
  //assign peripheral_bridge_s1_readdatavalid_from_sa = peripheral_bridge_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign peripheral_bridge_s1_readdatavalid_from_sa = peripheral_bridge_s1_readdatavalid;

  //assign peripheral_bridge_s1_readdata_from_sa = peripheral_bridge_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign peripheral_bridge_s1_readdata_from_sa = peripheral_bridge_s1_readdata;

  assign cpu_data_master_requests_peripheral_bridge_s1 = ({cpu_data_master_address_to_slave[27 : 11] , 11'b0} == 28'h8000000) & (cpu_data_master_read | cpu_data_master_write);
  //assign peripheral_bridge_s1_waitrequest_from_sa = peripheral_bridge_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign peripheral_bridge_s1_waitrequest_from_sa = peripheral_bridge_s1_waitrequest;

  //peripheral_bridge_s1_arb_share_counter set values, which is an e_mux
  assign peripheral_bridge_s1_arb_share_set_values = 1;

  //peripheral_bridge_s1_non_bursting_master_requests mux, which is an e_mux
  assign peripheral_bridge_s1_non_bursting_master_requests = cpu_data_master_requests_peripheral_bridge_s1;

  //peripheral_bridge_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign peripheral_bridge_s1_any_bursting_master_saved_grant = 0;

  //peripheral_bridge_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign peripheral_bridge_s1_arb_share_counter_next_value = peripheral_bridge_s1_firsttransfer ? (peripheral_bridge_s1_arb_share_set_values - 1) : |peripheral_bridge_s1_arb_share_counter ? (peripheral_bridge_s1_arb_share_counter - 1) : 0;

  //peripheral_bridge_s1_allgrants all slave grants, which is an e_mux
  assign peripheral_bridge_s1_allgrants = |peripheral_bridge_s1_grant_vector;

  //peripheral_bridge_s1_end_xfer assignment, which is an e_assign
  assign peripheral_bridge_s1_end_xfer = ~(peripheral_bridge_s1_waits_for_read | peripheral_bridge_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_peripheral_bridge_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_peripheral_bridge_s1 = peripheral_bridge_s1_end_xfer & (~peripheral_bridge_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //peripheral_bridge_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign peripheral_bridge_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_peripheral_bridge_s1 & peripheral_bridge_s1_allgrants) | (end_xfer_arb_share_counter_term_peripheral_bridge_s1 & ~peripheral_bridge_s1_non_bursting_master_requests);

  //peripheral_bridge_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          peripheral_bridge_s1_arb_share_counter <= 0;
      else if (peripheral_bridge_s1_arb_counter_enable)
          peripheral_bridge_s1_arb_share_counter <= peripheral_bridge_s1_arb_share_counter_next_value;
    end


  //peripheral_bridge_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          peripheral_bridge_s1_slavearbiterlockenable <= 0;
      else if ((|peripheral_bridge_s1_master_qreq_vector & end_xfer_arb_share_counter_term_peripheral_bridge_s1) | (end_xfer_arb_share_counter_term_peripheral_bridge_s1 & ~peripheral_bridge_s1_non_bursting_master_requests))
          peripheral_bridge_s1_slavearbiterlockenable <= |peripheral_bridge_s1_arb_share_counter_next_value;
    end


  //cpu/data_master peripheral_bridge/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = peripheral_bridge_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //peripheral_bridge_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign peripheral_bridge_s1_slavearbiterlockenable2 = |peripheral_bridge_s1_arb_share_counter_next_value;

  //cpu/data_master peripheral_bridge/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = peripheral_bridge_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //peripheral_bridge_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign peripheral_bridge_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_peripheral_bridge_s1 = cpu_data_master_requests_peripheral_bridge_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //unique name for peripheral_bridge_s1_move_on_to_next_transaction, which is an e_assign
  assign peripheral_bridge_s1_move_on_to_next_transaction = peripheral_bridge_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_peripheral_bridge_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_peripheral_bridge_s1_module rdv_fifo_for_cpu_data_master_to_peripheral_bridge_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_peripheral_bridge_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_peripheral_bridge_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_peripheral_bridge_s1),
      .full                 (),
      .read                 (peripheral_bridge_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~peripheral_bridge_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_peripheral_bridge_s1;
  //local readdatavalid cpu_data_master_read_data_valid_peripheral_bridge_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_peripheral_bridge_s1 = peripheral_bridge_s1_readdatavalid_from_sa;

  //peripheral_bridge_s1_writedata mux, which is an e_mux
  assign peripheral_bridge_s1_writedata = cpu_data_master_writedata;

  //assign peripheral_bridge_s1_endofpacket_from_sa = peripheral_bridge_s1_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign peripheral_bridge_s1_endofpacket_from_sa = peripheral_bridge_s1_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_peripheral_bridge_s1 = cpu_data_master_qualified_request_peripheral_bridge_s1;

  //cpu/data_master saved-grant peripheral_bridge/s1, which is an e_assign
  assign cpu_data_master_saved_grant_peripheral_bridge_s1 = cpu_data_master_requests_peripheral_bridge_s1;

  //allow new arb cycle for peripheral_bridge/s1, which is an e_assign
  assign peripheral_bridge_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign peripheral_bridge_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign peripheral_bridge_s1_master_qreq_vector = 1;

  //peripheral_bridge_s1_reset_n assignment, which is an e_assign
  assign peripheral_bridge_s1_reset_n = reset_n;

  //peripheral_bridge_s1_firsttransfer first transaction, which is an e_assign
  assign peripheral_bridge_s1_firsttransfer = peripheral_bridge_s1_begins_xfer ? peripheral_bridge_s1_unreg_firsttransfer : peripheral_bridge_s1_reg_firsttransfer;

  //peripheral_bridge_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign peripheral_bridge_s1_unreg_firsttransfer = ~(peripheral_bridge_s1_slavearbiterlockenable & peripheral_bridge_s1_any_continuerequest);

  //peripheral_bridge_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          peripheral_bridge_s1_reg_firsttransfer <= 1'b1;
      else if (peripheral_bridge_s1_begins_xfer)
          peripheral_bridge_s1_reg_firsttransfer <= peripheral_bridge_s1_unreg_firsttransfer;
    end


  //peripheral_bridge_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign peripheral_bridge_s1_beginbursttransfer_internal = peripheral_bridge_s1_begins_xfer;

  //peripheral_bridge_s1_read assignment, which is an e_mux
  assign peripheral_bridge_s1_read = cpu_data_master_granted_peripheral_bridge_s1 & cpu_data_master_read;

  //peripheral_bridge_s1_write assignment, which is an e_mux
  assign peripheral_bridge_s1_write = cpu_data_master_granted_peripheral_bridge_s1 & cpu_data_master_write;

  assign shifted_address_to_peripheral_bridge_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //peripheral_bridge_s1_address mux, which is an e_mux
  assign peripheral_bridge_s1_address = shifted_address_to_peripheral_bridge_s1_from_cpu_data_master >> 2;

  //slaveid peripheral_bridge_s1_nativeaddress nativeaddress mux, which is an e_mux
  assign peripheral_bridge_s1_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_peripheral_bridge_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_peripheral_bridge_s1_end_xfer <= 1;
      else 
        d1_peripheral_bridge_s1_end_xfer <= peripheral_bridge_s1_end_xfer;
    end


  //peripheral_bridge_s1_waits_for_read in a cycle, which is an e_mux
  assign peripheral_bridge_s1_waits_for_read = peripheral_bridge_s1_in_a_read_cycle & peripheral_bridge_s1_waitrequest_from_sa;

  //peripheral_bridge_s1_in_a_read_cycle assignment, which is an e_assign
  assign peripheral_bridge_s1_in_a_read_cycle = cpu_data_master_granted_peripheral_bridge_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = peripheral_bridge_s1_in_a_read_cycle;

  //peripheral_bridge_s1_waits_for_write in a cycle, which is an e_mux
  assign peripheral_bridge_s1_waits_for_write = peripheral_bridge_s1_in_a_write_cycle & peripheral_bridge_s1_waitrequest_from_sa;

  //peripheral_bridge_s1_in_a_write_cycle assignment, which is an e_assign
  assign peripheral_bridge_s1_in_a_write_cycle = cpu_data_master_granted_peripheral_bridge_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = peripheral_bridge_s1_in_a_write_cycle;

  assign wait_for_peripheral_bridge_s1_counter = 0;
  //peripheral_bridge_s1_byteenable byte enable port mux, which is an e_mux
  assign peripheral_bridge_s1_byteenable = (cpu_data_master_granted_peripheral_bridge_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //peripheral_bridge/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module peripheral_bridge_m1_arbitrator (
                                         // inputs:
                                          clk,
                                          d1_lcd_i2c_en_s1_end_xfer,
                                          d1_lcd_i2c_scl_s1_end_xfer,
                                          d1_lcd_i2c_sda_s1_end_xfer,
                                          d1_sd_card_controller_avalon_slave_end_xfer,
                                          d1_sys_clk_timer_s1_end_xfer,
                                          d1_touch_panel_busy_s1_end_xfer,
                                          d1_touch_panel_pen_irq_n_s1_end_xfer,
                                          d1_touch_panel_spi_spi_control_port_end_xfer,
                                          lcd_i2c_en_s1_readdata_from_sa,
                                          lcd_i2c_scl_s1_readdata_from_sa,
                                          lcd_i2c_sda_s1_readdata_from_sa,
                                          peripheral_bridge_m1_address,
                                          peripheral_bridge_m1_byteenable,
                                          peripheral_bridge_m1_granted_lcd_i2c_en_s1,
                                          peripheral_bridge_m1_granted_lcd_i2c_scl_s1,
                                          peripheral_bridge_m1_granted_lcd_i2c_sda_s1,
                                          peripheral_bridge_m1_granted_sd_card_controller_avalon_slave,
                                          peripheral_bridge_m1_granted_sys_clk_timer_s1,
                                          peripheral_bridge_m1_granted_touch_panel_busy_s1,
                                          peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1,
                                          peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port,
                                          peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1,
                                          peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1,
                                          peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1,
                                          peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave,
                                          peripheral_bridge_m1_qualified_request_sys_clk_timer_s1,
                                          peripheral_bridge_m1_qualified_request_touch_panel_busy_s1,
                                          peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1,
                                          peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port,
                                          peripheral_bridge_m1_read,
                                          peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1,
                                          peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1,
                                          peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1,
                                          peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave,
                                          peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1,
                                          peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1,
                                          peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1,
                                          peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port,
                                          peripheral_bridge_m1_requests_lcd_i2c_en_s1,
                                          peripheral_bridge_m1_requests_lcd_i2c_scl_s1,
                                          peripheral_bridge_m1_requests_lcd_i2c_sda_s1,
                                          peripheral_bridge_m1_requests_sd_card_controller_avalon_slave,
                                          peripheral_bridge_m1_requests_sys_clk_timer_s1,
                                          peripheral_bridge_m1_requests_touch_panel_busy_s1,
                                          peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1,
                                          peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port,
                                          peripheral_bridge_m1_write,
                                          peripheral_bridge_m1_writedata,
                                          reset_n,
                                          sd_card_controller_avalon_slave_readdata_from_sa,
                                          sys_clk_timer_s1_readdata_from_sa,
                                          touch_panel_busy_s1_readdata_from_sa,
                                          touch_panel_pen_irq_n_s1_readdata_from_sa,
                                          touch_panel_spi_spi_control_port_endofpacket_from_sa,
                                          touch_panel_spi_spi_control_port_readdata_from_sa,

                                         // outputs:
                                          peripheral_bridge_m1_address_to_slave,
                                          peripheral_bridge_m1_endofpacket,
                                          peripheral_bridge_m1_latency_counter,
                                          peripheral_bridge_m1_readdata,
                                          peripheral_bridge_m1_readdatavalid,
                                          peripheral_bridge_m1_reset_n,
                                          peripheral_bridge_m1_waitrequest
                                       )
;

  output  [ 10: 0] peripheral_bridge_m1_address_to_slave;
  output           peripheral_bridge_m1_endofpacket;
  output           peripheral_bridge_m1_latency_counter;
  output  [ 31: 0] peripheral_bridge_m1_readdata;
  output           peripheral_bridge_m1_readdatavalid;
  output           peripheral_bridge_m1_reset_n;
  output           peripheral_bridge_m1_waitrequest;
  input            clk;
  input            d1_lcd_i2c_en_s1_end_xfer;
  input            d1_lcd_i2c_scl_s1_end_xfer;
  input            d1_lcd_i2c_sda_s1_end_xfer;
  input            d1_sd_card_controller_avalon_slave_end_xfer;
  input            d1_sys_clk_timer_s1_end_xfer;
  input            d1_touch_panel_busy_s1_end_xfer;
  input            d1_touch_panel_pen_irq_n_s1_end_xfer;
  input            d1_touch_panel_spi_spi_control_port_end_xfer;
  input            lcd_i2c_en_s1_readdata_from_sa;
  input            lcd_i2c_scl_s1_readdata_from_sa;
  input            lcd_i2c_sda_s1_readdata_from_sa;
  input   [ 10: 0] peripheral_bridge_m1_address;
  input   [  3: 0] peripheral_bridge_m1_byteenable;
  input            peripheral_bridge_m1_granted_lcd_i2c_en_s1;
  input            peripheral_bridge_m1_granted_lcd_i2c_scl_s1;
  input            peripheral_bridge_m1_granted_lcd_i2c_sda_s1;
  input            peripheral_bridge_m1_granted_sd_card_controller_avalon_slave;
  input            peripheral_bridge_m1_granted_sys_clk_timer_s1;
  input            peripheral_bridge_m1_granted_touch_panel_busy_s1;
  input            peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1;
  input            peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port;
  input            peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1;
  input            peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1;
  input            peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1;
  input            peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave;
  input            peripheral_bridge_m1_qualified_request_sys_clk_timer_s1;
  input            peripheral_bridge_m1_qualified_request_touch_panel_busy_s1;
  input            peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1;
  input            peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port;
  input            peripheral_bridge_m1_read;
  input            peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1;
  input            peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1;
  input            peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1;
  input            peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave;
  input            peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1;
  input            peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1;
  input            peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1;
  input            peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port;
  input            peripheral_bridge_m1_requests_lcd_i2c_en_s1;
  input            peripheral_bridge_m1_requests_lcd_i2c_scl_s1;
  input            peripheral_bridge_m1_requests_lcd_i2c_sda_s1;
  input            peripheral_bridge_m1_requests_sd_card_controller_avalon_slave;
  input            peripheral_bridge_m1_requests_sys_clk_timer_s1;
  input            peripheral_bridge_m1_requests_touch_panel_busy_s1;
  input            peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1;
  input            peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port;
  input            peripheral_bridge_m1_write;
  input   [ 31: 0] peripheral_bridge_m1_writedata;
  input            reset_n;
  input   [ 31: 0] sd_card_controller_avalon_slave_readdata_from_sa;
  input   [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  input            touch_panel_busy_s1_readdata_from_sa;
  input            touch_panel_pen_irq_n_s1_readdata_from_sa;
  input            touch_panel_spi_spi_control_port_endofpacket_from_sa;
  input   [ 15: 0] touch_panel_spi_spi_control_port_readdata_from_sa;

  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  wire             p1_peripheral_bridge_m1_latency_counter;
  reg     [ 10: 0] peripheral_bridge_m1_address_last_time;
  wire    [ 10: 0] peripheral_bridge_m1_address_to_slave;
  reg     [  3: 0] peripheral_bridge_m1_byteenable_last_time;
  wire             peripheral_bridge_m1_endofpacket;
  wire             peripheral_bridge_m1_is_granted_some_slave;
  reg              peripheral_bridge_m1_latency_counter;
  reg              peripheral_bridge_m1_read_but_no_slave_selected;
  reg              peripheral_bridge_m1_read_last_time;
  wire    [ 31: 0] peripheral_bridge_m1_readdata;
  wire             peripheral_bridge_m1_readdatavalid;
  wire             peripheral_bridge_m1_reset_n;
  wire             peripheral_bridge_m1_run;
  wire             peripheral_bridge_m1_waitrequest;
  reg              peripheral_bridge_m1_write_last_time;
  reg     [ 31: 0] peripheral_bridge_m1_writedata_last_time;
  wire             pre_flush_peripheral_bridge_m1_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1 | ~peripheral_bridge_m1_requests_lcd_i2c_en_s1) & ((~peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1 | ~peripheral_bridge_m1_read | (1 & ~d1_lcd_i2c_en_s1_end_xfer & peripheral_bridge_m1_read))) & ((~peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1 | ~peripheral_bridge_m1_write | (1 & peripheral_bridge_m1_write))) & 1 & (peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1 | ~peripheral_bridge_m1_requests_lcd_i2c_scl_s1) & ((~peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1 | ~peripheral_bridge_m1_read | (1 & ~d1_lcd_i2c_scl_s1_end_xfer & peripheral_bridge_m1_read))) & ((~peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1 | ~peripheral_bridge_m1_write | (1 & peripheral_bridge_m1_write))) & 1 & (peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1 | ~peripheral_bridge_m1_requests_lcd_i2c_sda_s1) & ((~peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1 | ~peripheral_bridge_m1_read | (1 & ~d1_lcd_i2c_sda_s1_end_xfer & peripheral_bridge_m1_read))) & ((~peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1 | ~peripheral_bridge_m1_write | (1 & peripheral_bridge_m1_write)));

  //cascaded wait assignment, which is an e_assign
  assign peripheral_bridge_m1_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave | ~peripheral_bridge_m1_requests_sd_card_controller_avalon_slave) & ((~peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave | ~(peripheral_bridge_m1_read | peripheral_bridge_m1_write) | (1 & ~d1_sd_card_controller_avalon_slave_end_xfer & (peripheral_bridge_m1_read | peripheral_bridge_m1_write)))) & ((~peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave | ~(peripheral_bridge_m1_read | peripheral_bridge_m1_write) | (1 & ~d1_sd_card_controller_avalon_slave_end_xfer & (peripheral_bridge_m1_read | peripheral_bridge_m1_write))));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 | ~peripheral_bridge_m1_requests_sys_clk_timer_s1) & ((~peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 | ~peripheral_bridge_m1_read | (1 & ~d1_sys_clk_timer_s1_end_xfer & peripheral_bridge_m1_read))) & ((~peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 | ~peripheral_bridge_m1_write | (1 & peripheral_bridge_m1_write))) & 1 & (peripheral_bridge_m1_qualified_request_touch_panel_busy_s1 | ~peripheral_bridge_m1_requests_touch_panel_busy_s1) & ((~peripheral_bridge_m1_qualified_request_touch_panel_busy_s1 | ~peripheral_bridge_m1_read | (1 & ~d1_touch_panel_busy_s1_end_xfer & peripheral_bridge_m1_read))) & ((~peripheral_bridge_m1_qualified_request_touch_panel_busy_s1 | ~peripheral_bridge_m1_write | (1 & peripheral_bridge_m1_write))) & 1 & (peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1 | ~peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1) & ((~peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1 | ~peripheral_bridge_m1_read | (1 & ~d1_touch_panel_pen_irq_n_s1_end_xfer & peripheral_bridge_m1_read))) & ((~peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1 | ~peripheral_bridge_m1_write | (1 & peripheral_bridge_m1_write))) & 1 & (peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port | ~peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port) & ((~peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port | ~(peripheral_bridge_m1_read | peripheral_bridge_m1_write) | (1 & ~d1_touch_panel_spi_spi_control_port_end_xfer & (peripheral_bridge_m1_read | peripheral_bridge_m1_write)))) & ((~peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port | ~(peripheral_bridge_m1_read | peripheral_bridge_m1_write) | (1 & ~d1_touch_panel_spi_spi_control_port_end_xfer & (peripheral_bridge_m1_read | peripheral_bridge_m1_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign peripheral_bridge_m1_address_to_slave = peripheral_bridge_m1_address[10 : 0];

  //peripheral_bridge_m1_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          peripheral_bridge_m1_read_but_no_slave_selected <= 0;
      else 
        peripheral_bridge_m1_read_but_no_slave_selected <= peripheral_bridge_m1_read & peripheral_bridge_m1_run & ~peripheral_bridge_m1_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign peripheral_bridge_m1_is_granted_some_slave = peripheral_bridge_m1_granted_lcd_i2c_en_s1 |
    peripheral_bridge_m1_granted_lcd_i2c_scl_s1 |
    peripheral_bridge_m1_granted_lcd_i2c_sda_s1 |
    peripheral_bridge_m1_granted_sd_card_controller_avalon_slave |
    peripheral_bridge_m1_granted_sys_clk_timer_s1 |
    peripheral_bridge_m1_granted_touch_panel_busy_s1 |
    peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1 |
    peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_peripheral_bridge_m1_readdatavalid = 0;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign peripheral_bridge_m1_readdatavalid = peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_peripheral_bridge_m1_readdatavalid |
    peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1 |
    peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_peripheral_bridge_m1_readdatavalid |
    peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1 |
    peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_peripheral_bridge_m1_readdatavalid |
    peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1 |
    peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_peripheral_bridge_m1_readdatavalid |
    peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave |
    peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_peripheral_bridge_m1_readdatavalid |
    peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1 |
    peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_peripheral_bridge_m1_readdatavalid |
    peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1 |
    peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_peripheral_bridge_m1_readdatavalid |
    peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1 |
    peripheral_bridge_m1_read_but_no_slave_selected |
    pre_flush_peripheral_bridge_m1_readdatavalid |
    peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port;

  //peripheral_bridge/m1 readdata mux, which is an e_mux
  assign peripheral_bridge_m1_readdata = ({32 {~(peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1 & peripheral_bridge_m1_read)}} | lcd_i2c_en_s1_readdata_from_sa) &
    ({32 {~(peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1 & peripheral_bridge_m1_read)}} | lcd_i2c_scl_s1_readdata_from_sa) &
    ({32 {~(peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1 & peripheral_bridge_m1_read)}} | lcd_i2c_sda_s1_readdata_from_sa) &
    ({32 {~(peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave & peripheral_bridge_m1_read)}} | sd_card_controller_avalon_slave_readdata_from_sa) &
    ({32 {~(peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 & peripheral_bridge_m1_read)}} | sys_clk_timer_s1_readdata_from_sa) &
    ({32 {~(peripheral_bridge_m1_qualified_request_touch_panel_busy_s1 & peripheral_bridge_m1_read)}} | touch_panel_busy_s1_readdata_from_sa) &
    ({32 {~(peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1 & peripheral_bridge_m1_read)}} | touch_panel_pen_irq_n_s1_readdata_from_sa) &
    ({32 {~(peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port & peripheral_bridge_m1_read)}} | touch_panel_spi_spi_control_port_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign peripheral_bridge_m1_waitrequest = ~peripheral_bridge_m1_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          peripheral_bridge_m1_latency_counter <= 0;
      else 
        peripheral_bridge_m1_latency_counter <= p1_peripheral_bridge_m1_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_peripheral_bridge_m1_latency_counter = ((peripheral_bridge_m1_run & peripheral_bridge_m1_read))? latency_load_value :
    (peripheral_bridge_m1_latency_counter)? peripheral_bridge_m1_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //peripheral_bridge_m1_reset_n assignment, which is an e_assign
  assign peripheral_bridge_m1_reset_n = reset_n;

  //mux peripheral_bridge_m1_endofpacket, which is an e_mux
  assign peripheral_bridge_m1_endofpacket = touch_panel_spi_spi_control_port_endofpacket_from_sa;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //peripheral_bridge_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          peripheral_bridge_m1_address_last_time <= 0;
      else 
        peripheral_bridge_m1_address_last_time <= peripheral_bridge_m1_address;
    end


  //peripheral_bridge/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= peripheral_bridge_m1_waitrequest & (peripheral_bridge_m1_read | peripheral_bridge_m1_write);
    end


  //peripheral_bridge_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (peripheral_bridge_m1_address != peripheral_bridge_m1_address_last_time))
        begin
          $write("%0d ns: peripheral_bridge_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //peripheral_bridge_m1_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          peripheral_bridge_m1_byteenable_last_time <= 0;
      else 
        peripheral_bridge_m1_byteenable_last_time <= peripheral_bridge_m1_byteenable;
    end


  //peripheral_bridge_m1_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (peripheral_bridge_m1_byteenable != peripheral_bridge_m1_byteenable_last_time))
        begin
          $write("%0d ns: peripheral_bridge_m1_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //peripheral_bridge_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          peripheral_bridge_m1_read_last_time <= 0;
      else 
        peripheral_bridge_m1_read_last_time <= peripheral_bridge_m1_read;
    end


  //peripheral_bridge_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (peripheral_bridge_m1_read != peripheral_bridge_m1_read_last_time))
        begin
          $write("%0d ns: peripheral_bridge_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //peripheral_bridge_m1_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          peripheral_bridge_m1_write_last_time <= 0;
      else 
        peripheral_bridge_m1_write_last_time <= peripheral_bridge_m1_write;
    end


  //peripheral_bridge_m1_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (peripheral_bridge_m1_write != peripheral_bridge_m1_write_last_time))
        begin
          $write("%0d ns: peripheral_bridge_m1_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //peripheral_bridge_m1_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          peripheral_bridge_m1_writedata_last_time <= 0;
      else 
        peripheral_bridge_m1_writedata_last_time <= peripheral_bridge_m1_writedata;
    end


  //peripheral_bridge_m1_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (peripheral_bridge_m1_writedata != peripheral_bridge_m1_writedata_last_time) & peripheral_bridge_m1_write)
        begin
          $write("%0d ns: peripheral_bridge_m1_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module peripheral_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pixel_converter_in_arbitrator (
                                       // inputs:
                                        clk,
                                        fifo_to_pixel_converter_out_data,
                                        fifo_to_pixel_converter_out_empty,
                                        fifo_to_pixel_converter_out_endofpacket,
                                        fifo_to_pixel_converter_out_startofpacket,
                                        fifo_to_pixel_converter_out_valid,
                                        pixel_converter_in_ready,
                                        reset_n,

                                       // outputs:
                                        pixel_converter_in_data,
                                        pixel_converter_in_empty,
                                        pixel_converter_in_endofpacket,
                                        pixel_converter_in_ready_from_sa,
                                        pixel_converter_in_reset_n,
                                        pixel_converter_in_startofpacket,
                                        pixel_converter_in_valid
                                     )
;

  output  [ 31: 0] pixel_converter_in_data;
  output  [  1: 0] pixel_converter_in_empty;
  output           pixel_converter_in_endofpacket;
  output           pixel_converter_in_ready_from_sa;
  output           pixel_converter_in_reset_n;
  output           pixel_converter_in_startofpacket;
  output           pixel_converter_in_valid;
  input            clk;
  input   [ 31: 0] fifo_to_pixel_converter_out_data;
  input   [  1: 0] fifo_to_pixel_converter_out_empty;
  input            fifo_to_pixel_converter_out_endofpacket;
  input            fifo_to_pixel_converter_out_startofpacket;
  input            fifo_to_pixel_converter_out_valid;
  input            pixel_converter_in_ready;
  input            reset_n;

  wire    [ 31: 0] pixel_converter_in_data;
  wire    [  1: 0] pixel_converter_in_empty;
  wire             pixel_converter_in_endofpacket;
  wire             pixel_converter_in_ready_from_sa;
  wire             pixel_converter_in_reset_n;
  wire             pixel_converter_in_startofpacket;
  wire             pixel_converter_in_valid;
  //mux pixel_converter_in_data, which is an e_mux
  assign pixel_converter_in_data = fifo_to_pixel_converter_out_data;

  //mux pixel_converter_in_empty, which is an e_mux
  assign pixel_converter_in_empty = fifo_to_pixel_converter_out_empty;

  //mux pixel_converter_in_endofpacket, which is an e_mux
  assign pixel_converter_in_endofpacket = fifo_to_pixel_converter_out_endofpacket;

  //assign pixel_converter_in_ready_from_sa = pixel_converter_in_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pixel_converter_in_ready_from_sa = pixel_converter_in_ready;

  //mux pixel_converter_in_startofpacket, which is an e_mux
  assign pixel_converter_in_startofpacket = fifo_to_pixel_converter_out_startofpacket;

  //mux pixel_converter_in_valid, which is an e_mux
  assign pixel_converter_in_valid = fifo_to_pixel_converter_out_valid;

  //pixel_converter_in_reset_n assignment, which is an e_assign
  assign pixel_converter_in_reset_n = reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pixel_converter_out_arbitrator (
                                        // inputs:
                                         clk,
                                         pixel_converter_out_data,
                                         pixel_converter_out_empty,
                                         pixel_converter_out_endofpacket,
                                         pixel_converter_out_startofpacket,
                                         pixel_converter_out_valid,
                                         reset_n,
                                         video_sync_generator_in_ready_from_sa,

                                        // outputs:
                                         pixel_converter_out_ready
                                      )
;

  output           pixel_converter_out_ready;
  input            clk;
  input   [ 23: 0] pixel_converter_out_data;
  input            pixel_converter_out_empty;
  input            pixel_converter_out_endofpacket;
  input            pixel_converter_out_startofpacket;
  input            pixel_converter_out_valid;
  input            reset_n;
  input            video_sync_generator_in_ready_from_sa;

  wire             pixel_converter_out_ready;
  //mux pixel_converter_out_ready, which is an e_mux
  assign pixel_converter_out_ready = video_sync_generator_in_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pll_pll_slave_arbitrator (
                                  // inputs:
                                   clk,
                                   nios_simple_clock_0_out_address_to_slave,
                                   nios_simple_clock_0_out_read,
                                   nios_simple_clock_0_out_write,
                                   nios_simple_clock_0_out_writedata,
                                   pll_pll_slave_readdata,
                                   reset_n,

                                  // outputs:
                                   d1_pll_pll_slave_end_xfer,
                                   nios_simple_clock_0_out_granted_pll_pll_slave,
                                   nios_simple_clock_0_out_qualified_request_pll_pll_slave,
                                   nios_simple_clock_0_out_read_data_valid_pll_pll_slave,
                                   nios_simple_clock_0_out_requests_pll_pll_slave,
                                   pll_pll_slave_address,
                                   pll_pll_slave_read,
                                   pll_pll_slave_readdata_from_sa,
                                   pll_pll_slave_reset,
                                   pll_pll_slave_write,
                                   pll_pll_slave_writedata
                                )
;

  output           d1_pll_pll_slave_end_xfer;
  output           nios_simple_clock_0_out_granted_pll_pll_slave;
  output           nios_simple_clock_0_out_qualified_request_pll_pll_slave;
  output           nios_simple_clock_0_out_read_data_valid_pll_pll_slave;
  output           nios_simple_clock_0_out_requests_pll_pll_slave;
  output  [  1: 0] pll_pll_slave_address;
  output           pll_pll_slave_read;
  output  [ 31: 0] pll_pll_slave_readdata_from_sa;
  output           pll_pll_slave_reset;
  output           pll_pll_slave_write;
  output  [ 31: 0] pll_pll_slave_writedata;
  input            clk;
  input   [  3: 0] nios_simple_clock_0_out_address_to_slave;
  input            nios_simple_clock_0_out_read;
  input            nios_simple_clock_0_out_write;
  input   [ 31: 0] nios_simple_clock_0_out_writedata;
  input   [ 31: 0] pll_pll_slave_readdata;
  input            reset_n;

  reg              d1_pll_pll_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pll_pll_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             nios_simple_clock_0_out_arbiterlock;
  wire             nios_simple_clock_0_out_arbiterlock2;
  wire             nios_simple_clock_0_out_continuerequest;
  wire             nios_simple_clock_0_out_granted_pll_pll_slave;
  wire             nios_simple_clock_0_out_qualified_request_pll_pll_slave;
  wire             nios_simple_clock_0_out_read_data_valid_pll_pll_slave;
  wire             nios_simple_clock_0_out_requests_pll_pll_slave;
  wire             nios_simple_clock_0_out_saved_grant_pll_pll_slave;
  wire    [  1: 0] pll_pll_slave_address;
  wire             pll_pll_slave_allgrants;
  wire             pll_pll_slave_allow_new_arb_cycle;
  wire             pll_pll_slave_any_bursting_master_saved_grant;
  wire             pll_pll_slave_any_continuerequest;
  wire             pll_pll_slave_arb_counter_enable;
  reg              pll_pll_slave_arb_share_counter;
  wire             pll_pll_slave_arb_share_counter_next_value;
  wire             pll_pll_slave_arb_share_set_values;
  wire             pll_pll_slave_beginbursttransfer_internal;
  wire             pll_pll_slave_begins_xfer;
  wire             pll_pll_slave_end_xfer;
  wire             pll_pll_slave_firsttransfer;
  wire             pll_pll_slave_grant_vector;
  wire             pll_pll_slave_in_a_read_cycle;
  wire             pll_pll_slave_in_a_write_cycle;
  wire             pll_pll_slave_master_qreq_vector;
  wire             pll_pll_slave_non_bursting_master_requests;
  wire             pll_pll_slave_read;
  wire    [ 31: 0] pll_pll_slave_readdata_from_sa;
  reg              pll_pll_slave_reg_firsttransfer;
  wire             pll_pll_slave_reset;
  reg              pll_pll_slave_slavearbiterlockenable;
  wire             pll_pll_slave_slavearbiterlockenable2;
  wire             pll_pll_slave_unreg_firsttransfer;
  wire             pll_pll_slave_waits_for_read;
  wire             pll_pll_slave_waits_for_write;
  wire             pll_pll_slave_write;
  wire    [ 31: 0] pll_pll_slave_writedata;
  wire    [  3: 0] shifted_address_to_pll_pll_slave_from_nios_simple_clock_0_out;
  wire             wait_for_pll_pll_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pll_pll_slave_end_xfer;
    end


  assign pll_pll_slave_begins_xfer = ~d1_reasons_to_wait & ((nios_simple_clock_0_out_qualified_request_pll_pll_slave));
  //assign pll_pll_slave_readdata_from_sa = pll_pll_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pll_pll_slave_readdata_from_sa = pll_pll_slave_readdata;

  assign nios_simple_clock_0_out_requests_pll_pll_slave = (1) & (nios_simple_clock_0_out_read | nios_simple_clock_0_out_write);
  //pll_pll_slave_arb_share_counter set values, which is an e_mux
  assign pll_pll_slave_arb_share_set_values = 1;

  //pll_pll_slave_non_bursting_master_requests mux, which is an e_mux
  assign pll_pll_slave_non_bursting_master_requests = nios_simple_clock_0_out_requests_pll_pll_slave;

  //pll_pll_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign pll_pll_slave_any_bursting_master_saved_grant = 0;

  //pll_pll_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign pll_pll_slave_arb_share_counter_next_value = pll_pll_slave_firsttransfer ? (pll_pll_slave_arb_share_set_values - 1) : |pll_pll_slave_arb_share_counter ? (pll_pll_slave_arb_share_counter - 1) : 0;

  //pll_pll_slave_allgrants all slave grants, which is an e_mux
  assign pll_pll_slave_allgrants = |pll_pll_slave_grant_vector;

  //pll_pll_slave_end_xfer assignment, which is an e_assign
  assign pll_pll_slave_end_xfer = ~(pll_pll_slave_waits_for_read | pll_pll_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_pll_pll_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pll_pll_slave = pll_pll_slave_end_xfer & (~pll_pll_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pll_pll_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign pll_pll_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_pll_pll_slave & pll_pll_slave_allgrants) | (end_xfer_arb_share_counter_term_pll_pll_slave & ~pll_pll_slave_non_bursting_master_requests);

  //pll_pll_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_arb_share_counter <= 0;
      else if (pll_pll_slave_arb_counter_enable)
          pll_pll_slave_arb_share_counter <= pll_pll_slave_arb_share_counter_next_value;
    end


  //pll_pll_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_slavearbiterlockenable <= 0;
      else if ((|pll_pll_slave_master_qreq_vector & end_xfer_arb_share_counter_term_pll_pll_slave) | (end_xfer_arb_share_counter_term_pll_pll_slave & ~pll_pll_slave_non_bursting_master_requests))
          pll_pll_slave_slavearbiterlockenable <= |pll_pll_slave_arb_share_counter_next_value;
    end


  //nios_simple_clock_0/out pll/pll_slave arbiterlock, which is an e_assign
  assign nios_simple_clock_0_out_arbiterlock = pll_pll_slave_slavearbiterlockenable & nios_simple_clock_0_out_continuerequest;

  //pll_pll_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pll_pll_slave_slavearbiterlockenable2 = |pll_pll_slave_arb_share_counter_next_value;

  //nios_simple_clock_0/out pll/pll_slave arbiterlock2, which is an e_assign
  assign nios_simple_clock_0_out_arbiterlock2 = pll_pll_slave_slavearbiterlockenable2 & nios_simple_clock_0_out_continuerequest;

  //pll_pll_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pll_pll_slave_any_continuerequest = 1;

  //nios_simple_clock_0_out_continuerequest continued request, which is an e_assign
  assign nios_simple_clock_0_out_continuerequest = 1;

  assign nios_simple_clock_0_out_qualified_request_pll_pll_slave = nios_simple_clock_0_out_requests_pll_pll_slave;
  //pll_pll_slave_writedata mux, which is an e_mux
  assign pll_pll_slave_writedata = nios_simple_clock_0_out_writedata;

  //master is always granted when requested
  assign nios_simple_clock_0_out_granted_pll_pll_slave = nios_simple_clock_0_out_qualified_request_pll_pll_slave;

  //nios_simple_clock_0/out saved-grant pll/pll_slave, which is an e_assign
  assign nios_simple_clock_0_out_saved_grant_pll_pll_slave = nios_simple_clock_0_out_requests_pll_pll_slave;

  //allow new arb cycle for pll/pll_slave, which is an e_assign
  assign pll_pll_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pll_pll_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pll_pll_slave_master_qreq_vector = 1;

  //~pll_pll_slave_reset assignment, which is an e_assign
  assign pll_pll_slave_reset = ~reset_n;

  //pll_pll_slave_firsttransfer first transaction, which is an e_assign
  assign pll_pll_slave_firsttransfer = pll_pll_slave_begins_xfer ? pll_pll_slave_unreg_firsttransfer : pll_pll_slave_reg_firsttransfer;

  //pll_pll_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign pll_pll_slave_unreg_firsttransfer = ~(pll_pll_slave_slavearbiterlockenable & pll_pll_slave_any_continuerequest);

  //pll_pll_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pll_pll_slave_reg_firsttransfer <= 1'b1;
      else if (pll_pll_slave_begins_xfer)
          pll_pll_slave_reg_firsttransfer <= pll_pll_slave_unreg_firsttransfer;
    end


  //pll_pll_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pll_pll_slave_beginbursttransfer_internal = pll_pll_slave_begins_xfer;

  //pll_pll_slave_read assignment, which is an e_mux
  assign pll_pll_slave_read = nios_simple_clock_0_out_granted_pll_pll_slave & nios_simple_clock_0_out_read;

  //pll_pll_slave_write assignment, which is an e_mux
  assign pll_pll_slave_write = nios_simple_clock_0_out_granted_pll_pll_slave & nios_simple_clock_0_out_write;

  assign shifted_address_to_pll_pll_slave_from_nios_simple_clock_0_out = nios_simple_clock_0_out_address_to_slave;
  //pll_pll_slave_address mux, which is an e_mux
  assign pll_pll_slave_address = shifted_address_to_pll_pll_slave_from_nios_simple_clock_0_out >> 2;

  //d1_pll_pll_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pll_pll_slave_end_xfer <= 1;
      else 
        d1_pll_pll_slave_end_xfer <= pll_pll_slave_end_xfer;
    end


  //pll_pll_slave_waits_for_read in a cycle, which is an e_mux
  assign pll_pll_slave_waits_for_read = pll_pll_slave_in_a_read_cycle & 0;

  //pll_pll_slave_in_a_read_cycle assignment, which is an e_assign
  assign pll_pll_slave_in_a_read_cycle = nios_simple_clock_0_out_granted_pll_pll_slave & nios_simple_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pll_pll_slave_in_a_read_cycle;

  //pll_pll_slave_waits_for_write in a cycle, which is an e_mux
  assign pll_pll_slave_waits_for_write = pll_pll_slave_in_a_write_cycle & 0;

  //pll_pll_slave_in_a_write_cycle assignment, which is an e_assign
  assign pll_pll_slave_in_a_write_cycle = nios_simple_clock_0_out_granted_pll_pll_slave & nios_simple_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pll_pll_slave_in_a_write_cycle;

  assign wait_for_pll_pll_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pll/pll_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sd_card_controller_avalon_slave_arbitrator (
                                                    // inputs:
                                                     clk,
                                                     peripheral_bridge_m1_address_to_slave,
                                                     peripheral_bridge_m1_byteenable,
                                                     peripheral_bridge_m1_latency_counter,
                                                     peripheral_bridge_m1_read,
                                                     peripheral_bridge_m1_write,
                                                     peripheral_bridge_m1_writedata,
                                                     reset_n,
                                                     sd_card_controller_avalon_slave_readdata,

                                                    // outputs:
                                                     d1_sd_card_controller_avalon_slave_end_xfer,
                                                     peripheral_bridge_m1_granted_sd_card_controller_avalon_slave,
                                                     peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave,
                                                     peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave,
                                                     peripheral_bridge_m1_requests_sd_card_controller_avalon_slave,
                                                     sd_card_controller_avalon_slave_address,
                                                     sd_card_controller_avalon_slave_byteenable,
                                                     sd_card_controller_avalon_slave_chipselect,
                                                     sd_card_controller_avalon_slave_read,
                                                     sd_card_controller_avalon_slave_readdata_from_sa,
                                                     sd_card_controller_avalon_slave_reset_n,
                                                     sd_card_controller_avalon_slave_write,
                                                     sd_card_controller_avalon_slave_writedata
                                                  )
;

  output           d1_sd_card_controller_avalon_slave_end_xfer;
  output           peripheral_bridge_m1_granted_sd_card_controller_avalon_slave;
  output           peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave;
  output           peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave;
  output           peripheral_bridge_m1_requests_sd_card_controller_avalon_slave;
  output  [  7: 0] sd_card_controller_avalon_slave_address;
  output  [  3: 0] sd_card_controller_avalon_slave_byteenable;
  output           sd_card_controller_avalon_slave_chipselect;
  output           sd_card_controller_avalon_slave_read;
  output  [ 31: 0] sd_card_controller_avalon_slave_readdata_from_sa;
  output           sd_card_controller_avalon_slave_reset_n;
  output           sd_card_controller_avalon_slave_write;
  output  [ 31: 0] sd_card_controller_avalon_slave_writedata;
  input            clk;
  input   [ 10: 0] peripheral_bridge_m1_address_to_slave;
  input   [  3: 0] peripheral_bridge_m1_byteenable;
  input            peripheral_bridge_m1_latency_counter;
  input            peripheral_bridge_m1_read;
  input            peripheral_bridge_m1_write;
  input   [ 31: 0] peripheral_bridge_m1_writedata;
  input            reset_n;
  input   [ 31: 0] sd_card_controller_avalon_slave_readdata;

  reg              d1_reasons_to_wait;
  reg              d1_sd_card_controller_avalon_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sd_card_controller_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             peripheral_bridge_m1_arbiterlock;
  wire             peripheral_bridge_m1_arbiterlock2;
  wire             peripheral_bridge_m1_continuerequest;
  wire             peripheral_bridge_m1_granted_sd_card_controller_avalon_slave;
  wire             peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave;
  wire             peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave;
  wire             peripheral_bridge_m1_requests_sd_card_controller_avalon_slave;
  wire             peripheral_bridge_m1_saved_grant_sd_card_controller_avalon_slave;
  wire    [  7: 0] sd_card_controller_avalon_slave_address;
  wire             sd_card_controller_avalon_slave_allgrants;
  wire             sd_card_controller_avalon_slave_allow_new_arb_cycle;
  wire             sd_card_controller_avalon_slave_any_bursting_master_saved_grant;
  wire             sd_card_controller_avalon_slave_any_continuerequest;
  wire             sd_card_controller_avalon_slave_arb_counter_enable;
  reg              sd_card_controller_avalon_slave_arb_share_counter;
  wire             sd_card_controller_avalon_slave_arb_share_counter_next_value;
  wire             sd_card_controller_avalon_slave_arb_share_set_values;
  wire             sd_card_controller_avalon_slave_beginbursttransfer_internal;
  wire             sd_card_controller_avalon_slave_begins_xfer;
  wire    [  3: 0] sd_card_controller_avalon_slave_byteenable;
  wire             sd_card_controller_avalon_slave_chipselect;
  wire             sd_card_controller_avalon_slave_end_xfer;
  wire             sd_card_controller_avalon_slave_firsttransfer;
  wire             sd_card_controller_avalon_slave_grant_vector;
  wire             sd_card_controller_avalon_slave_in_a_read_cycle;
  wire             sd_card_controller_avalon_slave_in_a_write_cycle;
  wire             sd_card_controller_avalon_slave_master_qreq_vector;
  wire             sd_card_controller_avalon_slave_non_bursting_master_requests;
  wire             sd_card_controller_avalon_slave_read;
  wire    [ 31: 0] sd_card_controller_avalon_slave_readdata_from_sa;
  reg              sd_card_controller_avalon_slave_reg_firsttransfer;
  wire             sd_card_controller_avalon_slave_reset_n;
  reg              sd_card_controller_avalon_slave_slavearbiterlockenable;
  wire             sd_card_controller_avalon_slave_slavearbiterlockenable2;
  wire             sd_card_controller_avalon_slave_unreg_firsttransfer;
  wire             sd_card_controller_avalon_slave_waits_for_read;
  wire             sd_card_controller_avalon_slave_waits_for_write;
  wire             sd_card_controller_avalon_slave_write;
  wire    [ 31: 0] sd_card_controller_avalon_slave_writedata;
  wire    [ 10: 0] shifted_address_to_sd_card_controller_avalon_slave_from_peripheral_bridge_m1;
  wire             wait_for_sd_card_controller_avalon_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sd_card_controller_avalon_slave_end_xfer;
    end


  assign sd_card_controller_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave));
  //assign sd_card_controller_avalon_slave_readdata_from_sa = sd_card_controller_avalon_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sd_card_controller_avalon_slave_readdata_from_sa = sd_card_controller_avalon_slave_readdata;

  assign peripheral_bridge_m1_requests_sd_card_controller_avalon_slave = ({peripheral_bridge_m1_address_to_slave[10] , 10'b0} == 11'h0) & (peripheral_bridge_m1_read | peripheral_bridge_m1_write);
  //sd_card_controller_avalon_slave_arb_share_counter set values, which is an e_mux
  assign sd_card_controller_avalon_slave_arb_share_set_values = 1;

  //sd_card_controller_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign sd_card_controller_avalon_slave_non_bursting_master_requests = peripheral_bridge_m1_requests_sd_card_controller_avalon_slave;

  //sd_card_controller_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sd_card_controller_avalon_slave_any_bursting_master_saved_grant = 0;

  //sd_card_controller_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sd_card_controller_avalon_slave_arb_share_counter_next_value = sd_card_controller_avalon_slave_firsttransfer ? (sd_card_controller_avalon_slave_arb_share_set_values - 1) : |sd_card_controller_avalon_slave_arb_share_counter ? (sd_card_controller_avalon_slave_arb_share_counter - 1) : 0;

  //sd_card_controller_avalon_slave_allgrants all slave grants, which is an e_mux
  assign sd_card_controller_avalon_slave_allgrants = |sd_card_controller_avalon_slave_grant_vector;

  //sd_card_controller_avalon_slave_end_xfer assignment, which is an e_assign
  assign sd_card_controller_avalon_slave_end_xfer = ~(sd_card_controller_avalon_slave_waits_for_read | sd_card_controller_avalon_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sd_card_controller_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sd_card_controller_avalon_slave = sd_card_controller_avalon_slave_end_xfer & (~sd_card_controller_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sd_card_controller_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sd_card_controller_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sd_card_controller_avalon_slave & sd_card_controller_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_sd_card_controller_avalon_slave & ~sd_card_controller_avalon_slave_non_bursting_master_requests);

  //sd_card_controller_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_card_controller_avalon_slave_arb_share_counter <= 0;
      else if (sd_card_controller_avalon_slave_arb_counter_enable)
          sd_card_controller_avalon_slave_arb_share_counter <= sd_card_controller_avalon_slave_arb_share_counter_next_value;
    end


  //sd_card_controller_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_card_controller_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|sd_card_controller_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sd_card_controller_avalon_slave) | (end_xfer_arb_share_counter_term_sd_card_controller_avalon_slave & ~sd_card_controller_avalon_slave_non_bursting_master_requests))
          sd_card_controller_avalon_slave_slavearbiterlockenable <= |sd_card_controller_avalon_slave_arb_share_counter_next_value;
    end


  //peripheral_bridge/m1 sd_card_controller/avalon_slave arbiterlock, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock = sd_card_controller_avalon_slave_slavearbiterlockenable & peripheral_bridge_m1_continuerequest;

  //sd_card_controller_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sd_card_controller_avalon_slave_slavearbiterlockenable2 = |sd_card_controller_avalon_slave_arb_share_counter_next_value;

  //peripheral_bridge/m1 sd_card_controller/avalon_slave arbiterlock2, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock2 = sd_card_controller_avalon_slave_slavearbiterlockenable2 & peripheral_bridge_m1_continuerequest;

  //sd_card_controller_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sd_card_controller_avalon_slave_any_continuerequest = 1;

  //peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign peripheral_bridge_m1_continuerequest = 1;

  assign peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave = peripheral_bridge_m1_requests_sd_card_controller_avalon_slave & ~((peripheral_bridge_m1_read & ((peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave, which is an e_mux
  assign peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave = peripheral_bridge_m1_granted_sd_card_controller_avalon_slave & peripheral_bridge_m1_read & ~sd_card_controller_avalon_slave_waits_for_read;

  //sd_card_controller_avalon_slave_writedata mux, which is an e_mux
  assign sd_card_controller_avalon_slave_writedata = peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign peripheral_bridge_m1_granted_sd_card_controller_avalon_slave = peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave;

  //peripheral_bridge/m1 saved-grant sd_card_controller/avalon_slave, which is an e_assign
  assign peripheral_bridge_m1_saved_grant_sd_card_controller_avalon_slave = peripheral_bridge_m1_requests_sd_card_controller_avalon_slave;

  //allow new arb cycle for sd_card_controller/avalon_slave, which is an e_assign
  assign sd_card_controller_avalon_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sd_card_controller_avalon_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sd_card_controller_avalon_slave_master_qreq_vector = 1;

  //sd_card_controller_avalon_slave_reset_n assignment, which is an e_assign
  assign sd_card_controller_avalon_slave_reset_n = reset_n;

  assign sd_card_controller_avalon_slave_chipselect = peripheral_bridge_m1_granted_sd_card_controller_avalon_slave;
  //sd_card_controller_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign sd_card_controller_avalon_slave_firsttransfer = sd_card_controller_avalon_slave_begins_xfer ? sd_card_controller_avalon_slave_unreg_firsttransfer : sd_card_controller_avalon_slave_reg_firsttransfer;

  //sd_card_controller_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sd_card_controller_avalon_slave_unreg_firsttransfer = ~(sd_card_controller_avalon_slave_slavearbiterlockenable & sd_card_controller_avalon_slave_any_continuerequest);

  //sd_card_controller_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sd_card_controller_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (sd_card_controller_avalon_slave_begins_xfer)
          sd_card_controller_avalon_slave_reg_firsttransfer <= sd_card_controller_avalon_slave_unreg_firsttransfer;
    end


  //sd_card_controller_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sd_card_controller_avalon_slave_beginbursttransfer_internal = sd_card_controller_avalon_slave_begins_xfer;

  //sd_card_controller_avalon_slave_read assignment, which is an e_mux
  assign sd_card_controller_avalon_slave_read = peripheral_bridge_m1_granted_sd_card_controller_avalon_slave & peripheral_bridge_m1_read;

  //sd_card_controller_avalon_slave_write assignment, which is an e_mux
  assign sd_card_controller_avalon_slave_write = peripheral_bridge_m1_granted_sd_card_controller_avalon_slave & peripheral_bridge_m1_write;

  assign shifted_address_to_sd_card_controller_avalon_slave_from_peripheral_bridge_m1 = peripheral_bridge_m1_address_to_slave;
  //sd_card_controller_avalon_slave_address mux, which is an e_mux
  assign sd_card_controller_avalon_slave_address = shifted_address_to_sd_card_controller_avalon_slave_from_peripheral_bridge_m1 >> 2;

  //d1_sd_card_controller_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sd_card_controller_avalon_slave_end_xfer <= 1;
      else 
        d1_sd_card_controller_avalon_slave_end_xfer <= sd_card_controller_avalon_slave_end_xfer;
    end


  //sd_card_controller_avalon_slave_waits_for_read in a cycle, which is an e_mux
  assign sd_card_controller_avalon_slave_waits_for_read = sd_card_controller_avalon_slave_in_a_read_cycle & sd_card_controller_avalon_slave_begins_xfer;

  //sd_card_controller_avalon_slave_in_a_read_cycle assignment, which is an e_assign
  assign sd_card_controller_avalon_slave_in_a_read_cycle = peripheral_bridge_m1_granted_sd_card_controller_avalon_slave & peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sd_card_controller_avalon_slave_in_a_read_cycle;

  //sd_card_controller_avalon_slave_waits_for_write in a cycle, which is an e_mux
  assign sd_card_controller_avalon_slave_waits_for_write = sd_card_controller_avalon_slave_in_a_write_cycle & sd_card_controller_avalon_slave_begins_xfer;

  //sd_card_controller_avalon_slave_in_a_write_cycle assignment, which is an e_assign
  assign sd_card_controller_avalon_slave_in_a_write_cycle = peripheral_bridge_m1_granted_sd_card_controller_avalon_slave & peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sd_card_controller_avalon_slave_in_a_write_cycle;

  assign wait_for_sd_card_controller_avalon_slave_counter = 0;
  //sd_card_controller_avalon_slave_byteenable byte enable port mux, which is an e_mux
  assign sd_card_controller_avalon_slave_byteenable = (peripheral_bridge_m1_granted_sd_card_controller_avalon_slave)? peripheral_bridge_m1_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sd_card_controller/avalon_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_sdram_s1_module (
                                                         // inputs:
                                                          clear_fifo,
                                                          clk,
                                                          data_in,
                                                          read,
                                                          reset_n,
                                                          sync_reset,
                                                          write,

                                                         // outputs:
                                                          data_out,
                                                          empty,
                                                          fifo_contains_ones_n,
                                                          full
                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module (
                                                                // inputs:
                                                                 clear_fifo,
                                                                 clk,
                                                                 data_in,
                                                                 read,
                                                                 reset_n,
                                                                 sync_reset,
                                                                 write,

                                                                // outputs:
                                                                 data_out,
                                                                 empty,
                                                                 fifo_contains_ones_n,
                                                                 full
                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_sgdma_pixel_m_read_to_sdram_s1_module (
                                                            // inputs:
                                                             clear_fifo,
                                                             clk,
                                                             data_in,
                                                             read,
                                                             reset_n,
                                                             sync_reset,
                                                             write,

                                                            // outputs:
                                                             data_out,
                                                             empty,
                                                             fifo_contains_ones_n,
                                                             full
                                                          )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_data_master_address_to_slave,
                              cpu_data_master_byteenable,
                              cpu_data_master_latency_counter,
                              cpu_data_master_read,
                              cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                              cpu_data_master_write,
                              cpu_data_master_writedata,
                              cpu_instruction_master_address_to_slave,
                              cpu_instruction_master_latency_counter,
                              cpu_instruction_master_read,
                              reset_n,
                              sdram_s1_readdata,
                              sdram_s1_readdatavalid,
                              sdram_s1_waitrequest,
                              sgdma_pixel_m_read_address_to_slave,
                              sgdma_pixel_m_read_latency_counter,
                              sgdma_pixel_m_read_read,

                             // outputs:
                              cpu_data_master_granted_sdram_s1,
                              cpu_data_master_qualified_request_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1_shift_register,
                              cpu_data_master_requests_sdram_s1,
                              cpu_instruction_master_granted_sdram_s1,
                              cpu_instruction_master_qualified_request_sdram_s1,
                              cpu_instruction_master_read_data_valid_sdram_s1,
                              cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                              cpu_instruction_master_requests_sdram_s1,
                              d1_sdram_s1_end_xfer,
                              sdram_s1_address,
                              sdram_s1_byteenable_n,
                              sdram_s1_chipselect,
                              sdram_s1_read_n,
                              sdram_s1_readdata_from_sa,
                              sdram_s1_reset_n,
                              sdram_s1_waitrequest_from_sa,
                              sdram_s1_write_n,
                              sdram_s1_writedata,
                              sgdma_pixel_m_read_granted_sdram_s1,
                              sgdma_pixel_m_read_qualified_request_sdram_s1,
                              sgdma_pixel_m_read_read_data_valid_sdram_s1,
                              sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register,
                              sgdma_pixel_m_read_requests_sdram_s1
                           )
;

  output           cpu_data_master_granted_sdram_s1;
  output           cpu_data_master_qualified_request_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1_shift_register;
  output           cpu_data_master_requests_sdram_s1;
  output           cpu_instruction_master_granted_sdram_s1;
  output           cpu_instruction_master_qualified_request_sdram_s1;
  output           cpu_instruction_master_read_data_valid_sdram_s1;
  output           cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  output           cpu_instruction_master_requests_sdram_s1;
  output           d1_sdram_s1_end_xfer;
  output  [ 24: 0] sdram_s1_address;
  output  [  3: 0] sdram_s1_byteenable_n;
  output           sdram_s1_chipselect;
  output           sdram_s1_read_n;
  output  [ 31: 0] sdram_s1_readdata_from_sa;
  output           sdram_s1_reset_n;
  output           sdram_s1_waitrequest_from_sa;
  output           sdram_s1_write_n;
  output  [ 31: 0] sdram_s1_writedata;
  output           sgdma_pixel_m_read_granted_sdram_s1;
  output           sgdma_pixel_m_read_qualified_request_sdram_s1;
  output           sgdma_pixel_m_read_read_data_valid_sdram_s1;
  output           sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register;
  output           sgdma_pixel_m_read_requests_sdram_s1;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 27: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata;
  input            sdram_s1_readdatavalid;
  input            sdram_s1_waitrequest;
  input   [ 31: 0] sgdma_pixel_m_read_address_to_slave;
  input            sgdma_pixel_m_read_latency_counter;
  input            sgdma_pixel_m_read_read;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_rdv_fifo_empty_sdram_s1;
  wire             cpu_data_master_rdv_fifo_output_from_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_saved_grant_sdram_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_sdram_s1;
  wire             cpu_instruction_master_qualified_request_sdram_s1;
  wire             cpu_instruction_master_rdv_fifo_empty_sdram_s1;
  wire             cpu_instruction_master_rdv_fifo_output_from_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_instruction_master_requests_sdram_s1;
  wire             cpu_instruction_master_saved_grant_sdram_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_sdram_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_sdram_s1;
  reg              last_cycle_sgdma_pixel_m_read_granted_slave_sdram_s1;
  wire    [ 24: 0] sdram_s1_address;
  wire             sdram_s1_allgrants;
  wire             sdram_s1_allow_new_arb_cycle;
  wire             sdram_s1_any_bursting_master_saved_grant;
  wire             sdram_s1_any_continuerequest;
  reg     [  2: 0] sdram_s1_arb_addend;
  wire             sdram_s1_arb_counter_enable;
  reg     [  3: 0] sdram_s1_arb_share_counter;
  wire    [  3: 0] sdram_s1_arb_share_counter_next_value;
  wire    [  3: 0] sdram_s1_arb_share_set_values;
  wire    [  2: 0] sdram_s1_arb_winner;
  wire             sdram_s1_arbitration_holdoff_internal;
  wire             sdram_s1_beginbursttransfer_internal;
  wire             sdram_s1_begins_xfer;
  wire    [  3: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire    [  5: 0] sdram_s1_chosen_master_double_vector;
  wire    [  2: 0] sdram_s1_chosen_master_rot_left;
  wire             sdram_s1_end_xfer;
  wire             sdram_s1_firsttransfer;
  wire    [  2: 0] sdram_s1_grant_vector;
  wire             sdram_s1_in_a_read_cycle;
  wire             sdram_s1_in_a_write_cycle;
  wire    [  2: 0] sdram_s1_master_qreq_vector;
  wire             sdram_s1_move_on_to_next_transaction;
  wire             sdram_s1_non_bursting_master_requests;
  wire             sdram_s1_read_n;
  wire    [ 31: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid_from_sa;
  reg              sdram_s1_reg_firsttransfer;
  wire             sdram_s1_reset_n;
  reg     [  2: 0] sdram_s1_saved_chosen_master_vector;
  reg              sdram_s1_slavearbiterlockenable;
  wire             sdram_s1_slavearbiterlockenable2;
  wire             sdram_s1_unreg_firsttransfer;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_waits_for_read;
  wire             sdram_s1_waits_for_write;
  wire             sdram_s1_write_n;
  wire    [ 31: 0] sdram_s1_writedata;
  wire             sgdma_pixel_m_read_arbiterlock;
  wire             sgdma_pixel_m_read_arbiterlock2;
  wire             sgdma_pixel_m_read_continuerequest;
  wire             sgdma_pixel_m_read_granted_sdram_s1;
  wire             sgdma_pixel_m_read_qualified_request_sdram_s1;
  wire             sgdma_pixel_m_read_rdv_fifo_empty_sdram_s1;
  wire             sgdma_pixel_m_read_rdv_fifo_output_from_sdram_s1;
  wire             sgdma_pixel_m_read_read_data_valid_sdram_s1;
  wire             sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register;
  wire             sgdma_pixel_m_read_requests_sdram_s1;
  wire             sgdma_pixel_m_read_saved_grant_sdram_s1;
  wire    [ 27: 0] shifted_address_to_sdram_s1_from_cpu_data_master;
  wire    [ 27: 0] shifted_address_to_sdram_s1_from_cpu_instruction_master;
  wire    [ 31: 0] shifted_address_to_sdram_s1_from_sgdma_pixel_m_read;
  wire             wait_for_sdram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_s1_end_xfer;
    end


  assign sdram_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sdram_s1 | cpu_instruction_master_qualified_request_sdram_s1 | sgdma_pixel_m_read_qualified_request_sdram_s1));
  //assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid;

  //assign sdram_s1_readdata_from_sa = sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdata_from_sa = sdram_s1_readdata;

  assign cpu_data_master_requests_sdram_s1 = ({cpu_data_master_address_to_slave[27] , 27'b0} == 28'h0) & (cpu_data_master_read | cpu_data_master_write);
  //assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest;

  //sdram_s1_arb_share_counter set values, which is an e_mux
  assign sdram_s1_arb_share_set_values = (sgdma_pixel_m_read_granted_sdram_s1)? 10 :
    (sgdma_pixel_m_read_granted_sdram_s1)? 10 :
    (sgdma_pixel_m_read_granted_sdram_s1)? 10 :
    1;

  //sdram_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_s1_non_bursting_master_requests = cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1 |
    sgdma_pixel_m_read_requests_sdram_s1 |
    cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1 |
    sgdma_pixel_m_read_requests_sdram_s1 |
    cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1 |
    sgdma_pixel_m_read_requests_sdram_s1;

  //sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_s1_any_bursting_master_saved_grant = 0;

  //sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_s1_arb_share_counter_next_value = sdram_s1_firsttransfer ? (sdram_s1_arb_share_set_values - 1) : |sdram_s1_arb_share_counter ? (sdram_s1_arb_share_counter - 1) : 0;

  //sdram_s1_allgrants all slave grants, which is an e_mux
  assign sdram_s1_allgrants = (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector);

  //sdram_s1_end_xfer assignment, which is an e_assign
  assign sdram_s1_end_xfer = ~(sdram_s1_waits_for_read | sdram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_s1 = sdram_s1_end_xfer & (~sdram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_s1 & sdram_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests);

  //sdram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_share_counter <= 0;
      else if (sdram_s1_arb_counter_enable)
          sdram_s1_arb_share_counter <= sdram_s1_arb_share_counter_next_value;
    end


  //sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_s1) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests))
          sdram_s1_slavearbiterlockenable <= |sdram_s1_arb_share_counter_next_value;
    end


  //cpu/data_master sdram/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sdram_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_s1_slavearbiterlockenable2 = |sdram_s1_arb_share_counter_next_value;

  //cpu/data_master sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master sdram/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = sdram_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_sdram_s1 <= cpu_instruction_master_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_sdram_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_sdram_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = (last_cycle_cpu_instruction_master_granted_slave_sdram_s1 & cpu_instruction_master_requests_sdram_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_sdram_s1 & cpu_instruction_master_requests_sdram_s1);

  //sdram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    sgdma_pixel_m_read_continuerequest |
    cpu_data_master_continuerequest |
    sgdma_pixel_m_read_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest;

  //sgdma_pixel/m_read sdram/s1 arbiterlock, which is an e_assign
  assign sgdma_pixel_m_read_arbiterlock = sdram_s1_slavearbiterlockenable & sgdma_pixel_m_read_continuerequest;

  //sgdma_pixel/m_read sdram/s1 arbiterlock2, which is an e_assign
  assign sgdma_pixel_m_read_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & sgdma_pixel_m_read_continuerequest;

  //sgdma_pixel/m_read granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_sgdma_pixel_m_read_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_sgdma_pixel_m_read_granted_slave_sdram_s1 <= sgdma_pixel_m_read_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~sgdma_pixel_m_read_requests_sdram_s1) ? 0 : last_cycle_sgdma_pixel_m_read_granted_slave_sdram_s1;
    end


  //sgdma_pixel_m_read_continuerequest continued request, which is an e_mux
  assign sgdma_pixel_m_read_continuerequest = (last_cycle_sgdma_pixel_m_read_granted_slave_sdram_s1 & sgdma_pixel_m_read_requests_sdram_s1) |
    (last_cycle_sgdma_pixel_m_read_granted_slave_sdram_s1 & sgdma_pixel_m_read_requests_sdram_s1);

  assign cpu_data_master_qualified_request_sdram_s1 = cpu_data_master_requests_sdram_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register))) | cpu_instruction_master_arbiterlock | sgdma_pixel_m_read_arbiterlock);
  //unique name for sdram_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_s1_move_on_to_next_transaction = sdram_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_sdram_s1_module rdv_fifo_for_cpu_data_master_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_sdram_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_sdram_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_sdram_s1;
  //local readdatavalid cpu_data_master_read_data_valid_sdram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & cpu_data_master_rdv_fifo_output_from_sdram_s1) & ~ cpu_data_master_rdv_fifo_empty_sdram_s1;

  //sdram_s1_writedata mux, which is an e_mux
  assign sdram_s1_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_sdram_s1 = (({cpu_instruction_master_address_to_slave[27] , 27'b0} == 28'h0) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_sdram_s1 <= cpu_data_master_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_sdram_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_sdram_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = (last_cycle_cpu_data_master_granted_slave_sdram_s1 & cpu_data_master_requests_sdram_s1) |
    (last_cycle_cpu_data_master_granted_slave_sdram_s1 & cpu_data_master_requests_sdram_s1);

  assign cpu_instruction_master_qualified_request_sdram_s1 = cpu_instruction_master_requests_sdram_s1 & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (1 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock | sgdma_pixel_m_read_arbiterlock);
  //rdv_fifo_for_cpu_instruction_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module rdv_fifo_for_cpu_instruction_master_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_instruction_master_granted_sdram_s1),
      .data_out             (cpu_instruction_master_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_instruction_master_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign cpu_instruction_master_read_data_valid_sdram_s1_shift_register = ~cpu_instruction_master_rdv_fifo_empty_sdram_s1;
  //local readdatavalid cpu_instruction_master_read_data_valid_sdram_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & cpu_instruction_master_rdv_fifo_output_from_sdram_s1) & ~ cpu_instruction_master_rdv_fifo_empty_sdram_s1;

  assign sgdma_pixel_m_read_requests_sdram_s1 = (({sgdma_pixel_m_read_address_to_slave[31 : 27] , 27'b0} == 32'h0) & (sgdma_pixel_m_read_read)) & sgdma_pixel_m_read_read;
  assign sgdma_pixel_m_read_qualified_request_sdram_s1 = sgdma_pixel_m_read_requests_sdram_s1 & ~((sgdma_pixel_m_read_read & ((sgdma_pixel_m_read_latency_counter != 0) | (1 < sgdma_pixel_m_read_latency_counter))) | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock);
  //rdv_fifo_for_sgdma_pixel_m_read_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_sgdma_pixel_m_read_to_sdram_s1_module rdv_fifo_for_sgdma_pixel_m_read_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (sgdma_pixel_m_read_granted_sdram_s1),
      .data_out             (sgdma_pixel_m_read_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (sgdma_pixel_m_read_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register = ~sgdma_pixel_m_read_rdv_fifo_empty_sdram_s1;
  //local readdatavalid sgdma_pixel_m_read_read_data_valid_sdram_s1, which is an e_mux
  assign sgdma_pixel_m_read_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & sgdma_pixel_m_read_rdv_fifo_output_from_sdram_s1) & ~ sgdma_pixel_m_read_rdv_fifo_empty_sdram_s1;

  //allow new arb cycle for sdram/s1, which is an e_assign
  assign sdram_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock & ~sgdma_pixel_m_read_arbiterlock;

  //sgdma_pixel/m_read assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[0] = sgdma_pixel_m_read_qualified_request_sdram_s1;

  //sgdma_pixel/m_read grant sdram/s1, which is an e_assign
  assign sgdma_pixel_m_read_granted_sdram_s1 = sdram_s1_grant_vector[0];

  //sgdma_pixel/m_read saved-grant sdram/s1, which is an e_assign
  assign sgdma_pixel_m_read_saved_grant_sdram_s1 = sdram_s1_arb_winner[0] && sgdma_pixel_m_read_requests_sdram_s1;

  //cpu/instruction_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[1] = cpu_instruction_master_qualified_request_sdram_s1;

  //cpu/instruction_master grant sdram/s1, which is an e_assign
  assign cpu_instruction_master_granted_sdram_s1 = sdram_s1_grant_vector[1];

  //cpu/instruction_master saved-grant sdram/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_sdram_s1 = sdram_s1_arb_winner[1] && cpu_instruction_master_requests_sdram_s1;

  //cpu/data_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[2] = cpu_data_master_qualified_request_sdram_s1;

  //cpu/data_master grant sdram/s1, which is an e_assign
  assign cpu_data_master_granted_sdram_s1 = sdram_s1_grant_vector[2];

  //cpu/data_master saved-grant sdram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sdram_s1 = sdram_s1_arb_winner[2] && cpu_data_master_requests_sdram_s1;

  //sdram/s1 chosen-master double-vector, which is an e_assign
  assign sdram_s1_chosen_master_double_vector = {sdram_s1_master_qreq_vector, sdram_s1_master_qreq_vector} & ({~sdram_s1_master_qreq_vector, ~sdram_s1_master_qreq_vector} + sdram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_s1_arb_winner = (sdram_s1_allow_new_arb_cycle & | sdram_s1_grant_vector) ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;

  //saved sdram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_saved_chosen_master_vector <= 0;
      else if (sdram_s1_allow_new_arb_cycle)
          sdram_s1_saved_chosen_master_vector <= |sdram_s1_grant_vector ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_s1_grant_vector = {(sdram_s1_chosen_master_double_vector[2] | sdram_s1_chosen_master_double_vector[5]),
    (sdram_s1_chosen_master_double_vector[1] | sdram_s1_chosen_master_double_vector[4]),
    (sdram_s1_chosen_master_double_vector[0] | sdram_s1_chosen_master_double_vector[3])};

  //sdram/s1 chosen master rotated left, which is an e_assign
  assign sdram_s1_chosen_master_rot_left = (sdram_s1_arb_winner << 1) ? (sdram_s1_arb_winner << 1) : 1;

  //sdram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_addend <= 1;
      else if (|sdram_s1_grant_vector)
          sdram_s1_arb_addend <= sdram_s1_end_xfer? sdram_s1_chosen_master_rot_left : sdram_s1_grant_vector;
    end


  //sdram_s1_reset_n assignment, which is an e_assign
  assign sdram_s1_reset_n = reset_n;

  assign sdram_s1_chipselect = cpu_data_master_granted_sdram_s1 | cpu_instruction_master_granted_sdram_s1 | sgdma_pixel_m_read_granted_sdram_s1;
  //sdram_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_firsttransfer = sdram_s1_begins_xfer ? sdram_s1_unreg_firsttransfer : sdram_s1_reg_firsttransfer;

  //sdram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_unreg_firsttransfer = ~(sdram_s1_slavearbiterlockenable & sdram_s1_any_continuerequest);

  //sdram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_s1_begins_xfer)
          sdram_s1_reg_firsttransfer <= sdram_s1_unreg_firsttransfer;
    end


  //sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_s1_beginbursttransfer_internal = sdram_s1_begins_xfer;

  //sdram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_s1_arbitration_holdoff_internal = sdram_s1_begins_xfer & sdram_s1_firsttransfer;

  //~sdram_s1_read_n assignment, which is an e_mux
  assign sdram_s1_read_n = ~((cpu_data_master_granted_sdram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_sdram_s1 & cpu_instruction_master_read) | (sgdma_pixel_m_read_granted_sdram_s1 & sgdma_pixel_m_read_read));

  //~sdram_s1_write_n assignment, which is an e_mux
  assign sdram_s1_write_n = ~(cpu_data_master_granted_sdram_s1 & cpu_data_master_write);

  assign shifted_address_to_sdram_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sdram_s1_address mux, which is an e_mux
  assign sdram_s1_address = (cpu_data_master_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_cpu_data_master >> 2) :
    (cpu_instruction_master_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_cpu_instruction_master >> 2) :
    (shifted_address_to_sdram_s1_from_sgdma_pixel_m_read >> 2);

  assign shifted_address_to_sdram_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  assign shifted_address_to_sdram_s1_from_sgdma_pixel_m_read = sgdma_pixel_m_read_address_to_slave;
  //d1_sdram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_s1_end_xfer <= 1;
      else 
        d1_sdram_s1_end_xfer <= sdram_s1_end_xfer;
    end


  //sdram_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_s1_waits_for_read = sdram_s1_in_a_read_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_read_cycle = (cpu_data_master_granted_sdram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_sdram_s1 & cpu_instruction_master_read) | (sgdma_pixel_m_read_granted_sdram_s1 & sgdma_pixel_m_read_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_s1_in_a_read_cycle;

  //sdram_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_s1_waits_for_write = sdram_s1_in_a_write_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_write_cycle = cpu_data_master_granted_sdram_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_s1_in_a_write_cycle;

  assign wait_for_sdram_s1_counter = 0;
  //~sdram_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_s1_byteenable_n = ~((cpu_data_master_granted_sdram_s1)? cpu_data_master_byteenable :
    -1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_sdram_s1 + cpu_instruction_master_granted_sdram_s1 + sgdma_pixel_m_read_granted_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_sdram_s1 + cpu_instruction_master_saved_grant_sdram_s1 + sgdma_pixel_m_read_saved_grant_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_pixel_csr_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_latency_counter,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                     cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     reset_n,
                                     sgdma_pixel_csr_irq,
                                     sgdma_pixel_csr_readdata,

                                    // outputs:
                                     cpu_data_master_granted_sgdma_pixel_csr,
                                     cpu_data_master_qualified_request_sgdma_pixel_csr,
                                     cpu_data_master_read_data_valid_sgdma_pixel_csr,
                                     cpu_data_master_requests_sgdma_pixel_csr,
                                     d1_sgdma_pixel_csr_end_xfer,
                                     sgdma_pixel_csr_address,
                                     sgdma_pixel_csr_chipselect,
                                     sgdma_pixel_csr_irq_from_sa,
                                     sgdma_pixel_csr_read,
                                     sgdma_pixel_csr_readdata_from_sa,
                                     sgdma_pixel_csr_reset_n,
                                     sgdma_pixel_csr_write,
                                     sgdma_pixel_csr_writedata
                                  )
;

  output           cpu_data_master_granted_sgdma_pixel_csr;
  output           cpu_data_master_qualified_request_sgdma_pixel_csr;
  output           cpu_data_master_read_data_valid_sgdma_pixel_csr;
  output           cpu_data_master_requests_sgdma_pixel_csr;
  output           d1_sgdma_pixel_csr_end_xfer;
  output  [  3: 0] sgdma_pixel_csr_address;
  output           sgdma_pixel_csr_chipselect;
  output           sgdma_pixel_csr_irq_from_sa;
  output           sgdma_pixel_csr_read;
  output  [ 31: 0] sgdma_pixel_csr_readdata_from_sa;
  output           sgdma_pixel_csr_reset_n;
  output           sgdma_pixel_csr_write;
  output  [ 31: 0] sgdma_pixel_csr_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            sgdma_pixel_csr_irq;
  input   [ 31: 0] sgdma_pixel_csr_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sgdma_pixel_csr;
  wire             cpu_data_master_qualified_request_sgdma_pixel_csr;
  wire             cpu_data_master_read_data_valid_sgdma_pixel_csr;
  wire             cpu_data_master_requests_sgdma_pixel_csr;
  wire             cpu_data_master_saved_grant_sgdma_pixel_csr;
  reg              d1_reasons_to_wait;
  reg              d1_sgdma_pixel_csr_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sgdma_pixel_csr;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  3: 0] sgdma_pixel_csr_address;
  wire             sgdma_pixel_csr_allgrants;
  wire             sgdma_pixel_csr_allow_new_arb_cycle;
  wire             sgdma_pixel_csr_any_bursting_master_saved_grant;
  wire             sgdma_pixel_csr_any_continuerequest;
  wire             sgdma_pixel_csr_arb_counter_enable;
  reg     [  2: 0] sgdma_pixel_csr_arb_share_counter;
  wire    [  2: 0] sgdma_pixel_csr_arb_share_counter_next_value;
  wire    [  2: 0] sgdma_pixel_csr_arb_share_set_values;
  wire             sgdma_pixel_csr_beginbursttransfer_internal;
  wire             sgdma_pixel_csr_begins_xfer;
  wire             sgdma_pixel_csr_chipselect;
  wire             sgdma_pixel_csr_end_xfer;
  wire             sgdma_pixel_csr_firsttransfer;
  wire             sgdma_pixel_csr_grant_vector;
  wire             sgdma_pixel_csr_in_a_read_cycle;
  wire             sgdma_pixel_csr_in_a_write_cycle;
  wire             sgdma_pixel_csr_irq_from_sa;
  wire             sgdma_pixel_csr_master_qreq_vector;
  wire             sgdma_pixel_csr_non_bursting_master_requests;
  wire             sgdma_pixel_csr_read;
  wire    [ 31: 0] sgdma_pixel_csr_readdata_from_sa;
  reg              sgdma_pixel_csr_reg_firsttransfer;
  wire             sgdma_pixel_csr_reset_n;
  reg              sgdma_pixel_csr_slavearbiterlockenable;
  wire             sgdma_pixel_csr_slavearbiterlockenable2;
  wire             sgdma_pixel_csr_unreg_firsttransfer;
  wire             sgdma_pixel_csr_waits_for_read;
  wire             sgdma_pixel_csr_waits_for_write;
  wire             sgdma_pixel_csr_write;
  wire    [ 31: 0] sgdma_pixel_csr_writedata;
  wire    [ 27: 0] shifted_address_to_sgdma_pixel_csr_from_cpu_data_master;
  wire             wait_for_sgdma_pixel_csr_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sgdma_pixel_csr_end_xfer;
    end


  assign sgdma_pixel_csr_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sgdma_pixel_csr));
  //assign sgdma_pixel_csr_readdata_from_sa = sgdma_pixel_csr_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sgdma_pixel_csr_readdata_from_sa = sgdma_pixel_csr_readdata;

  assign cpu_data_master_requests_sgdma_pixel_csr = ({cpu_data_master_address_to_slave[27 : 6] , 6'b0} == 28'ha411000) & (cpu_data_master_read | cpu_data_master_write);
  //sgdma_pixel_csr_arb_share_counter set values, which is an e_mux
  assign sgdma_pixel_csr_arb_share_set_values = 1;

  //sgdma_pixel_csr_non_bursting_master_requests mux, which is an e_mux
  assign sgdma_pixel_csr_non_bursting_master_requests = cpu_data_master_requests_sgdma_pixel_csr;

  //sgdma_pixel_csr_any_bursting_master_saved_grant mux, which is an e_mux
  assign sgdma_pixel_csr_any_bursting_master_saved_grant = 0;

  //sgdma_pixel_csr_arb_share_counter_next_value assignment, which is an e_assign
  assign sgdma_pixel_csr_arb_share_counter_next_value = sgdma_pixel_csr_firsttransfer ? (sgdma_pixel_csr_arb_share_set_values - 1) : |sgdma_pixel_csr_arb_share_counter ? (sgdma_pixel_csr_arb_share_counter - 1) : 0;

  //sgdma_pixel_csr_allgrants all slave grants, which is an e_mux
  assign sgdma_pixel_csr_allgrants = |sgdma_pixel_csr_grant_vector;

  //sgdma_pixel_csr_end_xfer assignment, which is an e_assign
  assign sgdma_pixel_csr_end_xfer = ~(sgdma_pixel_csr_waits_for_read | sgdma_pixel_csr_waits_for_write);

  //end_xfer_arb_share_counter_term_sgdma_pixel_csr arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sgdma_pixel_csr = sgdma_pixel_csr_end_xfer & (~sgdma_pixel_csr_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sgdma_pixel_csr_arb_share_counter arbitration counter enable, which is an e_assign
  assign sgdma_pixel_csr_arb_counter_enable = (end_xfer_arb_share_counter_term_sgdma_pixel_csr & sgdma_pixel_csr_allgrants) | (end_xfer_arb_share_counter_term_sgdma_pixel_csr & ~sgdma_pixel_csr_non_bursting_master_requests);

  //sgdma_pixel_csr_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_csr_arb_share_counter <= 0;
      else if (sgdma_pixel_csr_arb_counter_enable)
          sgdma_pixel_csr_arb_share_counter <= sgdma_pixel_csr_arb_share_counter_next_value;
    end


  //sgdma_pixel_csr_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_csr_slavearbiterlockenable <= 0;
      else if ((|sgdma_pixel_csr_master_qreq_vector & end_xfer_arb_share_counter_term_sgdma_pixel_csr) | (end_xfer_arb_share_counter_term_sgdma_pixel_csr & ~sgdma_pixel_csr_non_bursting_master_requests))
          sgdma_pixel_csr_slavearbiterlockenable <= |sgdma_pixel_csr_arb_share_counter_next_value;
    end


  //cpu/data_master sgdma_pixel/csr arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sgdma_pixel_csr_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sgdma_pixel_csr_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sgdma_pixel_csr_slavearbiterlockenable2 = |sgdma_pixel_csr_arb_share_counter_next_value;

  //cpu/data_master sgdma_pixel/csr arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sgdma_pixel_csr_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sgdma_pixel_csr_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sgdma_pixel_csr_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sgdma_pixel_csr = cpu_data_master_requests_sgdma_pixel_csr & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_sgdma_pixel_csr, which is an e_mux
  assign cpu_data_master_read_data_valid_sgdma_pixel_csr = cpu_data_master_granted_sgdma_pixel_csr & cpu_data_master_read & ~sgdma_pixel_csr_waits_for_read;

  //sgdma_pixel_csr_writedata mux, which is an e_mux
  assign sgdma_pixel_csr_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_sgdma_pixel_csr = cpu_data_master_qualified_request_sgdma_pixel_csr;

  //cpu/data_master saved-grant sgdma_pixel/csr, which is an e_assign
  assign cpu_data_master_saved_grant_sgdma_pixel_csr = cpu_data_master_requests_sgdma_pixel_csr;

  //allow new arb cycle for sgdma_pixel/csr, which is an e_assign
  assign sgdma_pixel_csr_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sgdma_pixel_csr_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sgdma_pixel_csr_master_qreq_vector = 1;

  //sgdma_pixel_csr_reset_n assignment, which is an e_assign
  assign sgdma_pixel_csr_reset_n = reset_n;

  assign sgdma_pixel_csr_chipselect = cpu_data_master_granted_sgdma_pixel_csr;
  //sgdma_pixel_csr_firsttransfer first transaction, which is an e_assign
  assign sgdma_pixel_csr_firsttransfer = sgdma_pixel_csr_begins_xfer ? sgdma_pixel_csr_unreg_firsttransfer : sgdma_pixel_csr_reg_firsttransfer;

  //sgdma_pixel_csr_unreg_firsttransfer first transaction, which is an e_assign
  assign sgdma_pixel_csr_unreg_firsttransfer = ~(sgdma_pixel_csr_slavearbiterlockenable & sgdma_pixel_csr_any_continuerequest);

  //sgdma_pixel_csr_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_csr_reg_firsttransfer <= 1'b1;
      else if (sgdma_pixel_csr_begins_xfer)
          sgdma_pixel_csr_reg_firsttransfer <= sgdma_pixel_csr_unreg_firsttransfer;
    end


  //sgdma_pixel_csr_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sgdma_pixel_csr_beginbursttransfer_internal = sgdma_pixel_csr_begins_xfer;

  //sgdma_pixel_csr_read assignment, which is an e_mux
  assign sgdma_pixel_csr_read = cpu_data_master_granted_sgdma_pixel_csr & cpu_data_master_read;

  //sgdma_pixel_csr_write assignment, which is an e_mux
  assign sgdma_pixel_csr_write = cpu_data_master_granted_sgdma_pixel_csr & cpu_data_master_write;

  assign shifted_address_to_sgdma_pixel_csr_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sgdma_pixel_csr_address mux, which is an e_mux
  assign sgdma_pixel_csr_address = shifted_address_to_sgdma_pixel_csr_from_cpu_data_master >> 2;

  //d1_sgdma_pixel_csr_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sgdma_pixel_csr_end_xfer <= 1;
      else 
        d1_sgdma_pixel_csr_end_xfer <= sgdma_pixel_csr_end_xfer;
    end


  //sgdma_pixel_csr_waits_for_read in a cycle, which is an e_mux
  assign sgdma_pixel_csr_waits_for_read = sgdma_pixel_csr_in_a_read_cycle & sgdma_pixel_csr_begins_xfer;

  //sgdma_pixel_csr_in_a_read_cycle assignment, which is an e_assign
  assign sgdma_pixel_csr_in_a_read_cycle = cpu_data_master_granted_sgdma_pixel_csr & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sgdma_pixel_csr_in_a_read_cycle;

  //sgdma_pixel_csr_waits_for_write in a cycle, which is an e_mux
  assign sgdma_pixel_csr_waits_for_write = sgdma_pixel_csr_in_a_write_cycle & 0;

  //sgdma_pixel_csr_in_a_write_cycle assignment, which is an e_assign
  assign sgdma_pixel_csr_in_a_write_cycle = cpu_data_master_granted_sgdma_pixel_csr & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sgdma_pixel_csr_in_a_write_cycle;

  assign wait_for_sgdma_pixel_csr_counter = 0;
  //assign sgdma_pixel_csr_irq_from_sa = sgdma_pixel_csr_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sgdma_pixel_csr_irq_from_sa = sgdma_pixel_csr_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_pixel/csr enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_pixel_descriptor_read_arbitrator (
                                                // inputs:
                                                 clk,
                                                 d1_descriptor_mem_s1_end_xfer,
                                                 descriptor_mem_s1_readdata_from_sa,
                                                 reset_n,
                                                 sgdma_pixel_descriptor_read_address,
                                                 sgdma_pixel_descriptor_read_granted_descriptor_mem_s1,
                                                 sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1,
                                                 sgdma_pixel_descriptor_read_read,
                                                 sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1,
                                                 sgdma_pixel_descriptor_read_requests_descriptor_mem_s1,

                                                // outputs:
                                                 sgdma_pixel_descriptor_read_address_to_slave,
                                                 sgdma_pixel_descriptor_read_latency_counter,
                                                 sgdma_pixel_descriptor_read_readdata,
                                                 sgdma_pixel_descriptor_read_readdatavalid,
                                                 sgdma_pixel_descriptor_read_waitrequest
                                              )
;

  output  [ 31: 0] sgdma_pixel_descriptor_read_address_to_slave;
  output           sgdma_pixel_descriptor_read_latency_counter;
  output  [ 31: 0] sgdma_pixel_descriptor_read_readdata;
  output           sgdma_pixel_descriptor_read_readdatavalid;
  output           sgdma_pixel_descriptor_read_waitrequest;
  input            clk;
  input            d1_descriptor_mem_s1_end_xfer;
  input   [ 31: 0] descriptor_mem_s1_readdata_from_sa;
  input            reset_n;
  input   [ 31: 0] sgdma_pixel_descriptor_read_address;
  input            sgdma_pixel_descriptor_read_granted_descriptor_mem_s1;
  input            sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1;
  input            sgdma_pixel_descriptor_read_read;
  input            sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1;
  input            sgdma_pixel_descriptor_read_requests_descriptor_mem_s1;

  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  wire             p1_sgdma_pixel_descriptor_read_latency_counter;
  wire             pre_flush_sgdma_pixel_descriptor_read_readdatavalid;
  wire             r_0;
  reg     [ 31: 0] sgdma_pixel_descriptor_read_address_last_time;
  wire    [ 31: 0] sgdma_pixel_descriptor_read_address_to_slave;
  wire             sgdma_pixel_descriptor_read_is_granted_some_slave;
  reg              sgdma_pixel_descriptor_read_latency_counter;
  reg              sgdma_pixel_descriptor_read_read_but_no_slave_selected;
  reg              sgdma_pixel_descriptor_read_read_last_time;
  wire    [ 31: 0] sgdma_pixel_descriptor_read_readdata;
  wire             sgdma_pixel_descriptor_read_readdatavalid;
  wire             sgdma_pixel_descriptor_read_run;
  wire             sgdma_pixel_descriptor_read_waitrequest;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1 | ~sgdma_pixel_descriptor_read_requests_descriptor_mem_s1) & (sgdma_pixel_descriptor_read_granted_descriptor_mem_s1 | ~sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1) & ((~sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1 | ~(sgdma_pixel_descriptor_read_read) | (1 & (sgdma_pixel_descriptor_read_read))));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_pixel_descriptor_read_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_pixel_descriptor_read_address_to_slave = {16'b101001000000,
    sgdma_pixel_descriptor_read_address[15 : 0]};

  //sgdma_pixel_descriptor_read_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_descriptor_read_read_but_no_slave_selected <= 0;
      else 
        sgdma_pixel_descriptor_read_read_but_no_slave_selected <= sgdma_pixel_descriptor_read_read & sgdma_pixel_descriptor_read_run & ~sgdma_pixel_descriptor_read_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign sgdma_pixel_descriptor_read_is_granted_some_slave = sgdma_pixel_descriptor_read_granted_descriptor_mem_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_sgdma_pixel_descriptor_read_readdatavalid = sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign sgdma_pixel_descriptor_read_readdatavalid = sgdma_pixel_descriptor_read_read_but_no_slave_selected |
    pre_flush_sgdma_pixel_descriptor_read_readdatavalid;

  //sgdma_pixel/descriptor_read readdata mux, which is an e_mux
  assign sgdma_pixel_descriptor_read_readdata = descriptor_mem_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign sgdma_pixel_descriptor_read_waitrequest = ~sgdma_pixel_descriptor_read_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_descriptor_read_latency_counter <= 0;
      else 
        sgdma_pixel_descriptor_read_latency_counter <= p1_sgdma_pixel_descriptor_read_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_sgdma_pixel_descriptor_read_latency_counter = ((sgdma_pixel_descriptor_read_run & sgdma_pixel_descriptor_read_read))? latency_load_value :
    (sgdma_pixel_descriptor_read_latency_counter)? sgdma_pixel_descriptor_read_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {sgdma_pixel_descriptor_read_requests_descriptor_mem_s1}} & 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_pixel_descriptor_read_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_descriptor_read_address_last_time <= 0;
      else 
        sgdma_pixel_descriptor_read_address_last_time <= sgdma_pixel_descriptor_read_address;
    end


  //sgdma_pixel/descriptor_read waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= sgdma_pixel_descriptor_read_waitrequest & (sgdma_pixel_descriptor_read_read);
    end


  //sgdma_pixel_descriptor_read_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_pixel_descriptor_read_address != sgdma_pixel_descriptor_read_address_last_time))
        begin
          $write("%0d ns: sgdma_pixel_descriptor_read_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_pixel_descriptor_read_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_descriptor_read_read_last_time <= 0;
      else 
        sgdma_pixel_descriptor_read_read_last_time <= sgdma_pixel_descriptor_read_read;
    end


  //sgdma_pixel_descriptor_read_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_pixel_descriptor_read_read != sgdma_pixel_descriptor_read_read_last_time))
        begin
          $write("%0d ns: sgdma_pixel_descriptor_read_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_pixel_descriptor_write_arbitrator (
                                                 // inputs:
                                                  clk,
                                                  d1_descriptor_mem_s1_end_xfer,
                                                  reset_n,
                                                  sgdma_pixel_descriptor_write_address,
                                                  sgdma_pixel_descriptor_write_granted_descriptor_mem_s1,
                                                  sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1,
                                                  sgdma_pixel_descriptor_write_requests_descriptor_mem_s1,
                                                  sgdma_pixel_descriptor_write_write,
                                                  sgdma_pixel_descriptor_write_writedata,

                                                 // outputs:
                                                  sgdma_pixel_descriptor_write_address_to_slave,
                                                  sgdma_pixel_descriptor_write_waitrequest
                                               )
;

  output  [ 31: 0] sgdma_pixel_descriptor_write_address_to_slave;
  output           sgdma_pixel_descriptor_write_waitrequest;
  input            clk;
  input            d1_descriptor_mem_s1_end_xfer;
  input            reset_n;
  input   [ 31: 0] sgdma_pixel_descriptor_write_address;
  input            sgdma_pixel_descriptor_write_granted_descriptor_mem_s1;
  input            sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1;
  input            sgdma_pixel_descriptor_write_requests_descriptor_mem_s1;
  input            sgdma_pixel_descriptor_write_write;
  input   [ 31: 0] sgdma_pixel_descriptor_write_writedata;

  reg              active_and_waiting_last_time;
  wire             r_0;
  reg     [ 31: 0] sgdma_pixel_descriptor_write_address_last_time;
  wire    [ 31: 0] sgdma_pixel_descriptor_write_address_to_slave;
  wire             sgdma_pixel_descriptor_write_run;
  wire             sgdma_pixel_descriptor_write_waitrequest;
  reg              sgdma_pixel_descriptor_write_write_last_time;
  reg     [ 31: 0] sgdma_pixel_descriptor_write_writedata_last_time;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1 | ~sgdma_pixel_descriptor_write_requests_descriptor_mem_s1) & (sgdma_pixel_descriptor_write_granted_descriptor_mem_s1 | ~sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1) & ((~sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1 | ~(sgdma_pixel_descriptor_write_write) | (1 & (sgdma_pixel_descriptor_write_write))));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_pixel_descriptor_write_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_pixel_descriptor_write_address_to_slave = {16'b101001000000,
    sgdma_pixel_descriptor_write_address[15 : 0]};

  //actual waitrequest port, which is an e_assign
  assign sgdma_pixel_descriptor_write_waitrequest = ~sgdma_pixel_descriptor_write_run;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_pixel_descriptor_write_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_descriptor_write_address_last_time <= 0;
      else 
        sgdma_pixel_descriptor_write_address_last_time <= sgdma_pixel_descriptor_write_address;
    end


  //sgdma_pixel/descriptor_write waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= sgdma_pixel_descriptor_write_waitrequest & (sgdma_pixel_descriptor_write_write);
    end


  //sgdma_pixel_descriptor_write_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_pixel_descriptor_write_address != sgdma_pixel_descriptor_write_address_last_time))
        begin
          $write("%0d ns: sgdma_pixel_descriptor_write_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_pixel_descriptor_write_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_descriptor_write_write_last_time <= 0;
      else 
        sgdma_pixel_descriptor_write_write_last_time <= sgdma_pixel_descriptor_write_write;
    end


  //sgdma_pixel_descriptor_write_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_pixel_descriptor_write_write != sgdma_pixel_descriptor_write_write_last_time))
        begin
          $write("%0d ns: sgdma_pixel_descriptor_write_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_pixel_descriptor_write_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_descriptor_write_writedata_last_time <= 0;
      else 
        sgdma_pixel_descriptor_write_writedata_last_time <= sgdma_pixel_descriptor_write_writedata;
    end


  //sgdma_pixel_descriptor_write_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_pixel_descriptor_write_writedata != sgdma_pixel_descriptor_write_writedata_last_time) & sgdma_pixel_descriptor_write_write)
        begin
          $write("%0d ns: sgdma_pixel_descriptor_write_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_pixel_m_read_arbitrator (
                                       // inputs:
                                        clk,
                                        d1_sdram_s1_end_xfer,
                                        reset_n,
                                        sdram_s1_readdata_from_sa,
                                        sdram_s1_waitrequest_from_sa,
                                        sgdma_pixel_m_read_address,
                                        sgdma_pixel_m_read_granted_sdram_s1,
                                        sgdma_pixel_m_read_qualified_request_sdram_s1,
                                        sgdma_pixel_m_read_read,
                                        sgdma_pixel_m_read_read_data_valid_sdram_s1,
                                        sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register,
                                        sgdma_pixel_m_read_requests_sdram_s1,

                                       // outputs:
                                        sgdma_pixel_m_read_address_to_slave,
                                        sgdma_pixel_m_read_latency_counter,
                                        sgdma_pixel_m_read_readdata,
                                        sgdma_pixel_m_read_readdatavalid,
                                        sgdma_pixel_m_read_waitrequest
                                     )
;

  output  [ 31: 0] sgdma_pixel_m_read_address_to_slave;
  output           sgdma_pixel_m_read_latency_counter;
  output  [ 31: 0] sgdma_pixel_m_read_readdata;
  output           sgdma_pixel_m_read_readdatavalid;
  output           sgdma_pixel_m_read_waitrequest;
  input            clk;
  input            d1_sdram_s1_end_xfer;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input   [ 31: 0] sgdma_pixel_m_read_address;
  input            sgdma_pixel_m_read_granted_sdram_s1;
  input            sgdma_pixel_m_read_qualified_request_sdram_s1;
  input            sgdma_pixel_m_read_read;
  input            sgdma_pixel_m_read_read_data_valid_sdram_s1;
  input            sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register;
  input            sgdma_pixel_m_read_requests_sdram_s1;

  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  wire             p1_sgdma_pixel_m_read_latency_counter;
  wire             pre_flush_sgdma_pixel_m_read_readdatavalid;
  wire             r_1;
  reg     [ 31: 0] sgdma_pixel_m_read_address_last_time;
  wire    [ 31: 0] sgdma_pixel_m_read_address_to_slave;
  wire             sgdma_pixel_m_read_is_granted_some_slave;
  reg              sgdma_pixel_m_read_latency_counter;
  reg              sgdma_pixel_m_read_read_but_no_slave_selected;
  reg              sgdma_pixel_m_read_read_last_time;
  wire    [ 31: 0] sgdma_pixel_m_read_readdata;
  wire             sgdma_pixel_m_read_readdatavalid;
  wire             sgdma_pixel_m_read_run;
  wire             sgdma_pixel_m_read_waitrequest;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (sgdma_pixel_m_read_qualified_request_sdram_s1 | ~sgdma_pixel_m_read_requests_sdram_s1) & (sgdma_pixel_m_read_granted_sdram_s1 | ~sgdma_pixel_m_read_qualified_request_sdram_s1) & ((~sgdma_pixel_m_read_qualified_request_sdram_s1 | ~(sgdma_pixel_m_read_read) | (1 & ~sdram_s1_waitrequest_from_sa & (sgdma_pixel_m_read_read))));

  //cascaded wait assignment, which is an e_assign
  assign sgdma_pixel_m_read_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign sgdma_pixel_m_read_address_to_slave = {5'b0,
    sgdma_pixel_m_read_address[26 : 0]};

  //sgdma_pixel_m_read_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_m_read_read_but_no_slave_selected <= 0;
      else 
        sgdma_pixel_m_read_read_but_no_slave_selected <= sgdma_pixel_m_read_read & sgdma_pixel_m_read_run & ~sgdma_pixel_m_read_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign sgdma_pixel_m_read_is_granted_some_slave = sgdma_pixel_m_read_granted_sdram_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_sgdma_pixel_m_read_readdatavalid = sgdma_pixel_m_read_read_data_valid_sdram_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign sgdma_pixel_m_read_readdatavalid = sgdma_pixel_m_read_read_but_no_slave_selected |
    pre_flush_sgdma_pixel_m_read_readdatavalid;

  //sgdma_pixel/m_read readdata mux, which is an e_mux
  assign sgdma_pixel_m_read_readdata = sdram_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign sgdma_pixel_m_read_waitrequest = ~sgdma_pixel_m_read_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_m_read_latency_counter <= 0;
      else 
        sgdma_pixel_m_read_latency_counter <= p1_sgdma_pixel_m_read_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_sgdma_pixel_m_read_latency_counter = ((sgdma_pixel_m_read_run & sgdma_pixel_m_read_read))? latency_load_value :
    (sgdma_pixel_m_read_latency_counter)? sgdma_pixel_m_read_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sgdma_pixel_m_read_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_m_read_address_last_time <= 0;
      else 
        sgdma_pixel_m_read_address_last_time <= sgdma_pixel_m_read_address;
    end


  //sgdma_pixel/m_read waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= sgdma_pixel_m_read_waitrequest & (sgdma_pixel_m_read_read);
    end


  //sgdma_pixel_m_read_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_pixel_m_read_address != sgdma_pixel_m_read_address_last_time))
        begin
          $write("%0d ns: sgdma_pixel_m_read_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //sgdma_pixel_m_read_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sgdma_pixel_m_read_read_last_time <= 0;
      else 
        sgdma_pixel_m_read_read_last_time <= sgdma_pixel_m_read_read;
    end


  //sgdma_pixel_m_read_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (sgdma_pixel_m_read_read != sgdma_pixel_m_read_read_last_time))
        begin
          $write("%0d ns: sgdma_pixel_m_read_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sgdma_pixel_out_arbitrator (
                                    // inputs:
                                     clk,
                                     reset_n,
                                     sgdma_pixel_out_data,
                                     sgdma_pixel_out_empty,
                                     sgdma_pixel_out_endofpacket,
                                     sgdma_pixel_out_startofpacket,
                                     sgdma_pixel_out_valid,
                                     timing_adapter_in_ready_from_sa,

                                    // outputs:
                                     sgdma_pixel_out_ready
                                  )
;

  output           sgdma_pixel_out_ready;
  input            clk;
  input            reset_n;
  input   [ 31: 0] sgdma_pixel_out_data;
  input   [  1: 0] sgdma_pixel_out_empty;
  input            sgdma_pixel_out_endofpacket;
  input            sgdma_pixel_out_startofpacket;
  input            sgdma_pixel_out_valid;
  input            timing_adapter_in_ready_from_sa;

  wire             sgdma_pixel_out_ready;
  //mux sgdma_pixel_out_ready, which is an e_mux
  assign sgdma_pixel_out_ready = timing_adapter_in_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram_avalon_slave_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_byteenable,
                                       cpu_data_master_dbs_address,
                                       cpu_data_master_dbs_write_16,
                                       cpu_data_master_latency_counter,
                                       cpu_data_master_read,
                                       cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                       cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                       cpu_data_master_write,
                                       cpu_instruction_master_address_to_slave,
                                       cpu_instruction_master_dbs_address,
                                       cpu_instruction_master_latency_counter,
                                       cpu_instruction_master_read,
                                       cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                                       reset_n,
                                       sram_avalon_slave_readdata,

                                      // outputs:
                                       cpu_data_master_byteenable_sram_avalon_slave,
                                       cpu_data_master_granted_sram_avalon_slave,
                                       cpu_data_master_qualified_request_sram_avalon_slave,
                                       cpu_data_master_read_data_valid_sram_avalon_slave,
                                       cpu_data_master_requests_sram_avalon_slave,
                                       cpu_instruction_master_granted_sram_avalon_slave,
                                       cpu_instruction_master_qualified_request_sram_avalon_slave,
                                       cpu_instruction_master_read_data_valid_sram_avalon_slave,
                                       cpu_instruction_master_requests_sram_avalon_slave,
                                       d1_sram_avalon_slave_end_xfer,
                                       sram_avalon_slave_address,
                                       sram_avalon_slave_byteenable_n,
                                       sram_avalon_slave_chipselect_n,
                                       sram_avalon_slave_read_n,
                                       sram_avalon_slave_readdata_from_sa,
                                       sram_avalon_slave_reset_n,
                                       sram_avalon_slave_wait_counter_eq_0,
                                       sram_avalon_slave_write_n,
                                       sram_avalon_slave_writedata
                                    )
;

  output  [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  output           cpu_data_master_granted_sram_avalon_slave;
  output           cpu_data_master_qualified_request_sram_avalon_slave;
  output           cpu_data_master_read_data_valid_sram_avalon_slave;
  output           cpu_data_master_requests_sram_avalon_slave;
  output           cpu_instruction_master_granted_sram_avalon_slave;
  output           cpu_instruction_master_qualified_request_sram_avalon_slave;
  output           cpu_instruction_master_read_data_valid_sram_avalon_slave;
  output           cpu_instruction_master_requests_sram_avalon_slave;
  output           d1_sram_avalon_slave_end_xfer;
  output  [ 19: 0] sram_avalon_slave_address;
  output  [  1: 0] sram_avalon_slave_byteenable_n;
  output           sram_avalon_slave_chipselect_n;
  output           sram_avalon_slave_read_n;
  output  [ 15: 0] sram_avalon_slave_readdata_from_sa;
  output           sram_avalon_slave_reset_n;
  output           sram_avalon_slave_wait_counter_eq_0;
  output           sram_avalon_slave_write_n;
  output  [ 15: 0] sram_avalon_slave_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 27: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  input            reset_n;
  input   [ 15: 0] sram_avalon_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sram_avalon_slave;
  wire             cpu_data_master_qualified_request_sram_avalon_slave;
  wire             cpu_data_master_read_data_valid_sram_avalon_slave;
  wire             cpu_data_master_requests_sram_avalon_slave;
  wire             cpu_data_master_saved_grant_sram_avalon_slave;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_sram_avalon_slave;
  wire             cpu_instruction_master_qualified_request_sram_avalon_slave;
  wire             cpu_instruction_master_read_data_valid_sram_avalon_slave;
  wire             cpu_instruction_master_requests_sram_avalon_slave;
  wire             cpu_instruction_master_saved_grant_sram_avalon_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sram_avalon_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sram_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_sram_avalon_slave;
  reg              last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave;
  wire    [ 27: 0] shifted_address_to_sram_avalon_slave_from_cpu_data_master;
  wire    [ 27: 0] shifted_address_to_sram_avalon_slave_from_cpu_instruction_master;
  wire    [ 19: 0] sram_avalon_slave_address;
  wire             sram_avalon_slave_allgrants;
  wire             sram_avalon_slave_allow_new_arb_cycle;
  wire             sram_avalon_slave_any_bursting_master_saved_grant;
  wire             sram_avalon_slave_any_continuerequest;
  reg     [  1: 0] sram_avalon_slave_arb_addend;
  wire             sram_avalon_slave_arb_counter_enable;
  reg     [  2: 0] sram_avalon_slave_arb_share_counter;
  wire    [  2: 0] sram_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] sram_avalon_slave_arb_share_set_values;
  wire    [  1: 0] sram_avalon_slave_arb_winner;
  wire             sram_avalon_slave_arbitration_holdoff_internal;
  wire             sram_avalon_slave_beginbursttransfer_internal;
  wire             sram_avalon_slave_begins_xfer;
  wire    [  1: 0] sram_avalon_slave_byteenable_n;
  wire             sram_avalon_slave_chipselect_n;
  wire    [  3: 0] sram_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] sram_avalon_slave_chosen_master_rot_left;
  wire    [  1: 0] sram_avalon_slave_counter_load_value;
  wire             sram_avalon_slave_end_xfer;
  wire             sram_avalon_slave_firsttransfer;
  wire    [  1: 0] sram_avalon_slave_grant_vector;
  wire             sram_avalon_slave_in_a_read_cycle;
  wire             sram_avalon_slave_in_a_write_cycle;
  wire    [  1: 0] sram_avalon_slave_master_qreq_vector;
  wire             sram_avalon_slave_non_bursting_master_requests;
  wire             sram_avalon_slave_read_n;
  wire    [ 15: 0] sram_avalon_slave_readdata_from_sa;
  reg              sram_avalon_slave_reg_firsttransfer;
  wire             sram_avalon_slave_reset_n;
  reg     [  1: 0] sram_avalon_slave_saved_chosen_master_vector;
  reg              sram_avalon_slave_slavearbiterlockenable;
  wire             sram_avalon_slave_slavearbiterlockenable2;
  wire             sram_avalon_slave_unreg_firsttransfer;
  reg     [  1: 0] sram_avalon_slave_wait_counter;
  wire             sram_avalon_slave_wait_counter_eq_0;
  wire             sram_avalon_slave_waits_for_read;
  wire             sram_avalon_slave_waits_for_write;
  wire             sram_avalon_slave_write_n;
  wire    [ 15: 0] sram_avalon_slave_writedata;
  wire             wait_for_sram_avalon_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sram_avalon_slave_end_xfer;
    end


  assign sram_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sram_avalon_slave | cpu_instruction_master_qualified_request_sram_avalon_slave));
  //assign sram_avalon_slave_readdata_from_sa = sram_avalon_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sram_avalon_slave_readdata_from_sa = sram_avalon_slave_readdata;

  assign cpu_data_master_requests_sram_avalon_slave = ({cpu_data_master_address_to_slave[27 : 21] , 21'b0} == 28'ha200000) & (cpu_data_master_read | cpu_data_master_write);
  //sram_avalon_slave_arb_share_counter set values, which is an e_mux
  assign sram_avalon_slave_arb_share_set_values = (cpu_data_master_granted_sram_avalon_slave)? 2 :
    (cpu_instruction_master_granted_sram_avalon_slave)? 2 :
    (cpu_data_master_granted_sram_avalon_slave)? 2 :
    (cpu_instruction_master_granted_sram_avalon_slave)? 2 :
    1;

  //sram_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign sram_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_sram_avalon_slave |
    cpu_instruction_master_requests_sram_avalon_slave |
    cpu_data_master_requests_sram_avalon_slave |
    cpu_instruction_master_requests_sram_avalon_slave;

  //sram_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sram_avalon_slave_any_bursting_master_saved_grant = 0;

  //sram_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sram_avalon_slave_arb_share_counter_next_value = sram_avalon_slave_firsttransfer ? (sram_avalon_slave_arb_share_set_values - 1) : |sram_avalon_slave_arb_share_counter ? (sram_avalon_slave_arb_share_counter - 1) : 0;

  //sram_avalon_slave_allgrants all slave grants, which is an e_mux
  assign sram_avalon_slave_allgrants = (|sram_avalon_slave_grant_vector) |
    (|sram_avalon_slave_grant_vector) |
    (|sram_avalon_slave_grant_vector) |
    (|sram_avalon_slave_grant_vector);

  //sram_avalon_slave_end_xfer assignment, which is an e_assign
  assign sram_avalon_slave_end_xfer = ~(sram_avalon_slave_waits_for_read | sram_avalon_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sram_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sram_avalon_slave = sram_avalon_slave_end_xfer & (~sram_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sram_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sram_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sram_avalon_slave & sram_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_sram_avalon_slave & ~sram_avalon_slave_non_bursting_master_requests);

  //sram_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_arb_share_counter <= 0;
      else if (sram_avalon_slave_arb_counter_enable)
          sram_avalon_slave_arb_share_counter <= sram_avalon_slave_arb_share_counter_next_value;
    end


  //sram_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|sram_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sram_avalon_slave) | (end_xfer_arb_share_counter_term_sram_avalon_slave & ~sram_avalon_slave_non_bursting_master_requests))
          sram_avalon_slave_slavearbiterlockenable <= |sram_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sram/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sram_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sram_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sram_avalon_slave_slavearbiterlockenable2 = |sram_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master sram/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sram_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master sram/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = sram_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master sram/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = sram_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted sram/avalon_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave <= cpu_instruction_master_saved_grant_sram_avalon_slave ? 1 : (sram_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_sram_avalon_slave) ? 0 : last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave & cpu_instruction_master_requests_sram_avalon_slave;

  //sram_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sram_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_sram_avalon_slave = cpu_data_master_requests_sram_avalon_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | ((!cpu_data_master_byteenable_sram_avalon_slave) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_sram_avalon_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_sram_avalon_slave = cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read & ~sram_avalon_slave_waits_for_read;

  //sram_avalon_slave_writedata mux, which is an e_mux
  assign sram_avalon_slave_writedata = cpu_data_master_dbs_write_16;

  assign cpu_instruction_master_requests_sram_avalon_slave = (({cpu_instruction_master_address_to_slave[27 : 21] , 21'b0} == 28'ha200000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted sram/avalon_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_sram_avalon_slave <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_sram_avalon_slave <= cpu_data_master_saved_grant_sram_avalon_slave ? 1 : (sram_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_sram_avalon_slave) ? 0 : last_cycle_cpu_data_master_granted_slave_sram_avalon_slave;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_sram_avalon_slave & cpu_data_master_requests_sram_avalon_slave;

  assign cpu_instruction_master_qualified_request_sram_avalon_slave = cpu_instruction_master_requests_sram_avalon_slave & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (|cpu_instruction_master_read_data_valid_sdram_s1_shift_register))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_sram_avalon_slave, which is an e_mux
  assign cpu_instruction_master_read_data_valid_sram_avalon_slave = cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read & ~sram_avalon_slave_waits_for_read;

  //allow new arb cycle for sram/avalon_slave, which is an e_assign
  assign sram_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for sram/avalon_slave, which is an e_assign
  assign sram_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_sram_avalon_slave;

  //cpu/instruction_master grant sram/avalon_slave, which is an e_assign
  assign cpu_instruction_master_granted_sram_avalon_slave = sram_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant sram/avalon_slave, which is an e_assign
  assign cpu_instruction_master_saved_grant_sram_avalon_slave = sram_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_sram_avalon_slave;

  //cpu/data_master assignment into master qualified-requests vector for sram/avalon_slave, which is an e_assign
  assign sram_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_sram_avalon_slave;

  //cpu/data_master grant sram/avalon_slave, which is an e_assign
  assign cpu_data_master_granted_sram_avalon_slave = sram_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant sram/avalon_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sram_avalon_slave = sram_avalon_slave_arb_winner[1] && cpu_data_master_requests_sram_avalon_slave;

  //sram/avalon_slave chosen-master double-vector, which is an e_assign
  assign sram_avalon_slave_chosen_master_double_vector = {sram_avalon_slave_master_qreq_vector, sram_avalon_slave_master_qreq_vector} & ({~sram_avalon_slave_master_qreq_vector, ~sram_avalon_slave_master_qreq_vector} + sram_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign sram_avalon_slave_arb_winner = (sram_avalon_slave_allow_new_arb_cycle & | sram_avalon_slave_grant_vector) ? sram_avalon_slave_grant_vector : sram_avalon_slave_saved_chosen_master_vector;

  //saved sram_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_saved_chosen_master_vector <= 0;
      else if (sram_avalon_slave_allow_new_arb_cycle)
          sram_avalon_slave_saved_chosen_master_vector <= |sram_avalon_slave_grant_vector ? sram_avalon_slave_grant_vector : sram_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sram_avalon_slave_grant_vector = {(sram_avalon_slave_chosen_master_double_vector[1] | sram_avalon_slave_chosen_master_double_vector[3]),
    (sram_avalon_slave_chosen_master_double_vector[0] | sram_avalon_slave_chosen_master_double_vector[2])};

  //sram/avalon_slave chosen master rotated left, which is an e_assign
  assign sram_avalon_slave_chosen_master_rot_left = (sram_avalon_slave_arb_winner << 1) ? (sram_avalon_slave_arb_winner << 1) : 1;

  //sram/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_arb_addend <= 1;
      else if (|sram_avalon_slave_grant_vector)
          sram_avalon_slave_arb_addend <= sram_avalon_slave_end_xfer? sram_avalon_slave_chosen_master_rot_left : sram_avalon_slave_grant_vector;
    end


  //sram_avalon_slave_reset_n assignment, which is an e_assign
  assign sram_avalon_slave_reset_n = reset_n;

  assign sram_avalon_slave_chipselect_n = ~(cpu_data_master_granted_sram_avalon_slave | cpu_instruction_master_granted_sram_avalon_slave);
  //sram_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign sram_avalon_slave_firsttransfer = sram_avalon_slave_begins_xfer ? sram_avalon_slave_unreg_firsttransfer : sram_avalon_slave_reg_firsttransfer;

  //sram_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sram_avalon_slave_unreg_firsttransfer = ~(sram_avalon_slave_slavearbiterlockenable & sram_avalon_slave_any_continuerequest);

  //sram_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (sram_avalon_slave_begins_xfer)
          sram_avalon_slave_reg_firsttransfer <= sram_avalon_slave_unreg_firsttransfer;
    end


  //sram_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sram_avalon_slave_beginbursttransfer_internal = sram_avalon_slave_begins_xfer;

  //sram_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sram_avalon_slave_arbitration_holdoff_internal = sram_avalon_slave_begins_xfer & sram_avalon_slave_firsttransfer;

  //~sram_avalon_slave_read_n assignment, which is an e_mux
  assign sram_avalon_slave_read_n = ~(((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read) | (cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read))& ~sram_avalon_slave_begins_xfer);

  //~sram_avalon_slave_write_n assignment, which is an e_mux
  assign sram_avalon_slave_write_n = ~(((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_write)) & ~sram_avalon_slave_begins_xfer & (sram_avalon_slave_wait_counter >= 1));

  assign shifted_address_to_sram_avalon_slave_from_cpu_data_master = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sram_avalon_slave_address mux, which is an e_mux
  assign sram_avalon_slave_address = (cpu_data_master_granted_sram_avalon_slave)? (shifted_address_to_sram_avalon_slave_from_cpu_data_master >> 1) :
    (shifted_address_to_sram_avalon_slave_from_cpu_instruction_master >> 1);

  assign shifted_address_to_sram_avalon_slave_from_cpu_instruction_master = {cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sram_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sram_avalon_slave_end_xfer <= 1;
      else 
        d1_sram_avalon_slave_end_xfer <= sram_avalon_slave_end_xfer;
    end


  //sram_avalon_slave_waits_for_read in a cycle, which is an e_mux
  assign sram_avalon_slave_waits_for_read = sram_avalon_slave_in_a_read_cycle & wait_for_sram_avalon_slave_counter;

  //sram_avalon_slave_in_a_read_cycle assignment, which is an e_assign
  assign sram_avalon_slave_in_a_read_cycle = (cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read) | (cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sram_avalon_slave_in_a_read_cycle;

  //sram_avalon_slave_waits_for_write in a cycle, which is an e_mux
  assign sram_avalon_slave_waits_for_write = sram_avalon_slave_in_a_write_cycle & wait_for_sram_avalon_slave_counter;

  //sram_avalon_slave_in_a_write_cycle assignment, which is an e_assign
  assign sram_avalon_slave_in_a_write_cycle = cpu_data_master_granted_sram_avalon_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sram_avalon_slave_in_a_write_cycle;

  assign sram_avalon_slave_wait_counter_eq_0 = sram_avalon_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_wait_counter <= 0;
      else 
        sram_avalon_slave_wait_counter <= sram_avalon_slave_counter_load_value;
    end


  assign sram_avalon_slave_counter_load_value = ((sram_avalon_slave_in_a_write_cycle & sram_avalon_slave_begins_xfer))? 2 :
    ((sram_avalon_slave_in_a_read_cycle & sram_avalon_slave_begins_xfer))? 1 :
    (~sram_avalon_slave_wait_counter_eq_0)? sram_avalon_slave_wait_counter - 1 :
    0;

  assign wait_for_sram_avalon_slave_counter = sram_avalon_slave_begins_xfer | ~sram_avalon_slave_wait_counter_eq_0;
  //~sram_avalon_slave_byteenable_n byte enable port mux, which is an e_mux
  assign sram_avalon_slave_byteenable_n = ~((cpu_data_master_granted_sram_avalon_slave)? cpu_data_master_byteenable_sram_avalon_slave :
    -1);

  assign {cpu_data_master_byteenable_sram_avalon_slave_segment_1,
cpu_data_master_byteenable_sram_avalon_slave_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_sram_avalon_slave = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_sram_avalon_slave_segment_0 :
    cpu_data_master_byteenable_sram_avalon_slave_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sram/avalon_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_sram_avalon_slave + cpu_instruction_master_granted_sram_avalon_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_sram_avalon_slave + cpu_instruction_master_saved_grant_sram_avalon_slave > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sys_clk_timer_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      peripheral_bridge_m1_address_to_slave,
                                      peripheral_bridge_m1_latency_counter,
                                      peripheral_bridge_m1_nativeaddress,
                                      peripheral_bridge_m1_read,
                                      peripheral_bridge_m1_write,
                                      peripheral_bridge_m1_writedata,
                                      reset_n,
                                      sys_clk_timer_s1_irq,
                                      sys_clk_timer_s1_readdata,

                                     // outputs:
                                      d1_sys_clk_timer_s1_end_xfer,
                                      peripheral_bridge_m1_granted_sys_clk_timer_s1,
                                      peripheral_bridge_m1_qualified_request_sys_clk_timer_s1,
                                      peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1,
                                      peripheral_bridge_m1_requests_sys_clk_timer_s1,
                                      sys_clk_timer_s1_address,
                                      sys_clk_timer_s1_chipselect,
                                      sys_clk_timer_s1_irq_from_sa,
                                      sys_clk_timer_s1_readdata_from_sa,
                                      sys_clk_timer_s1_reset_n,
                                      sys_clk_timer_s1_write_n,
                                      sys_clk_timer_s1_writedata
                                   )
;

  output           d1_sys_clk_timer_s1_end_xfer;
  output           peripheral_bridge_m1_granted_sys_clk_timer_s1;
  output           peripheral_bridge_m1_qualified_request_sys_clk_timer_s1;
  output           peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1;
  output           peripheral_bridge_m1_requests_sys_clk_timer_s1;
  output  [  2: 0] sys_clk_timer_s1_address;
  output           sys_clk_timer_s1_chipselect;
  output           sys_clk_timer_s1_irq_from_sa;
  output  [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  output           sys_clk_timer_s1_reset_n;
  output           sys_clk_timer_s1_write_n;
  output  [ 15: 0] sys_clk_timer_s1_writedata;
  input            clk;
  input   [ 10: 0] peripheral_bridge_m1_address_to_slave;
  input            peripheral_bridge_m1_latency_counter;
  input   [  8: 0] peripheral_bridge_m1_nativeaddress;
  input            peripheral_bridge_m1_read;
  input            peripheral_bridge_m1_write;
  input   [ 31: 0] peripheral_bridge_m1_writedata;
  input            reset_n;
  input            sys_clk_timer_s1_irq;
  input   [ 15: 0] sys_clk_timer_s1_readdata;

  reg              d1_reasons_to_wait;
  reg              d1_sys_clk_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sys_clk_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             peripheral_bridge_m1_arbiterlock;
  wire             peripheral_bridge_m1_arbiterlock2;
  wire             peripheral_bridge_m1_continuerequest;
  wire             peripheral_bridge_m1_granted_sys_clk_timer_s1;
  wire             peripheral_bridge_m1_qualified_request_sys_clk_timer_s1;
  wire             peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1;
  wire             peripheral_bridge_m1_requests_sys_clk_timer_s1;
  wire             peripheral_bridge_m1_saved_grant_sys_clk_timer_s1;
  wire    [  2: 0] sys_clk_timer_s1_address;
  wire             sys_clk_timer_s1_allgrants;
  wire             sys_clk_timer_s1_allow_new_arb_cycle;
  wire             sys_clk_timer_s1_any_bursting_master_saved_grant;
  wire             sys_clk_timer_s1_any_continuerequest;
  wire             sys_clk_timer_s1_arb_counter_enable;
  reg              sys_clk_timer_s1_arb_share_counter;
  wire             sys_clk_timer_s1_arb_share_counter_next_value;
  wire             sys_clk_timer_s1_arb_share_set_values;
  wire             sys_clk_timer_s1_beginbursttransfer_internal;
  wire             sys_clk_timer_s1_begins_xfer;
  wire             sys_clk_timer_s1_chipselect;
  wire             sys_clk_timer_s1_end_xfer;
  wire             sys_clk_timer_s1_firsttransfer;
  wire             sys_clk_timer_s1_grant_vector;
  wire             sys_clk_timer_s1_in_a_read_cycle;
  wire             sys_clk_timer_s1_in_a_write_cycle;
  wire             sys_clk_timer_s1_irq_from_sa;
  wire             sys_clk_timer_s1_master_qreq_vector;
  wire             sys_clk_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  reg              sys_clk_timer_s1_reg_firsttransfer;
  wire             sys_clk_timer_s1_reset_n;
  reg              sys_clk_timer_s1_slavearbiterlockenable;
  wire             sys_clk_timer_s1_slavearbiterlockenable2;
  wire             sys_clk_timer_s1_unreg_firsttransfer;
  wire             sys_clk_timer_s1_waits_for_read;
  wire             sys_clk_timer_s1_waits_for_write;
  wire             sys_clk_timer_s1_write_n;
  wire    [ 15: 0] sys_clk_timer_s1_writedata;
  wire             wait_for_sys_clk_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sys_clk_timer_s1_end_xfer;
    end


  assign sys_clk_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((peripheral_bridge_m1_qualified_request_sys_clk_timer_s1));
  //assign sys_clk_timer_s1_readdata_from_sa = sys_clk_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_clk_timer_s1_readdata_from_sa = sys_clk_timer_s1_readdata;

  assign peripheral_bridge_m1_requests_sys_clk_timer_s1 = ({peripheral_bridge_m1_address_to_slave[10 : 5] , 5'b0} == 11'h400) & (peripheral_bridge_m1_read | peripheral_bridge_m1_write);
  //sys_clk_timer_s1_arb_share_counter set values, which is an e_mux
  assign sys_clk_timer_s1_arb_share_set_values = 1;

  //sys_clk_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign sys_clk_timer_s1_non_bursting_master_requests = peripheral_bridge_m1_requests_sys_clk_timer_s1;

  //sys_clk_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sys_clk_timer_s1_any_bursting_master_saved_grant = 0;

  //sys_clk_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sys_clk_timer_s1_arb_share_counter_next_value = sys_clk_timer_s1_firsttransfer ? (sys_clk_timer_s1_arb_share_set_values - 1) : |sys_clk_timer_s1_arb_share_counter ? (sys_clk_timer_s1_arb_share_counter - 1) : 0;

  //sys_clk_timer_s1_allgrants all slave grants, which is an e_mux
  assign sys_clk_timer_s1_allgrants = |sys_clk_timer_s1_grant_vector;

  //sys_clk_timer_s1_end_xfer assignment, which is an e_assign
  assign sys_clk_timer_s1_end_xfer = ~(sys_clk_timer_s1_waits_for_read | sys_clk_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sys_clk_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sys_clk_timer_s1 = sys_clk_timer_s1_end_xfer & (~sys_clk_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sys_clk_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sys_clk_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & sys_clk_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & ~sys_clk_timer_s1_non_bursting_master_requests);

  //sys_clk_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_arb_share_counter <= 0;
      else if (sys_clk_timer_s1_arb_counter_enable)
          sys_clk_timer_s1_arb_share_counter <= sys_clk_timer_s1_arb_share_counter_next_value;
    end


  //sys_clk_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_slavearbiterlockenable <= 0;
      else if ((|sys_clk_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sys_clk_timer_s1) | (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & ~sys_clk_timer_s1_non_bursting_master_requests))
          sys_clk_timer_s1_slavearbiterlockenable <= |sys_clk_timer_s1_arb_share_counter_next_value;
    end


  //peripheral_bridge/m1 sys_clk_timer/s1 arbiterlock, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock = sys_clk_timer_s1_slavearbiterlockenable & peripheral_bridge_m1_continuerequest;

  //sys_clk_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sys_clk_timer_s1_slavearbiterlockenable2 = |sys_clk_timer_s1_arb_share_counter_next_value;

  //peripheral_bridge/m1 sys_clk_timer/s1 arbiterlock2, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock2 = sys_clk_timer_s1_slavearbiterlockenable2 & peripheral_bridge_m1_continuerequest;

  //sys_clk_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sys_clk_timer_s1_any_continuerequest = 1;

  //peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign peripheral_bridge_m1_continuerequest = 1;

  assign peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 = peripheral_bridge_m1_requests_sys_clk_timer_s1 & ~((peripheral_bridge_m1_read & ((peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1, which is an e_mux
  assign peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1 = peripheral_bridge_m1_granted_sys_clk_timer_s1 & peripheral_bridge_m1_read & ~sys_clk_timer_s1_waits_for_read;

  //sys_clk_timer_s1_writedata mux, which is an e_mux
  assign sys_clk_timer_s1_writedata = peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign peripheral_bridge_m1_granted_sys_clk_timer_s1 = peripheral_bridge_m1_qualified_request_sys_clk_timer_s1;

  //peripheral_bridge/m1 saved-grant sys_clk_timer/s1, which is an e_assign
  assign peripheral_bridge_m1_saved_grant_sys_clk_timer_s1 = peripheral_bridge_m1_requests_sys_clk_timer_s1;

  //allow new arb cycle for sys_clk_timer/s1, which is an e_assign
  assign sys_clk_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sys_clk_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sys_clk_timer_s1_master_qreq_vector = 1;

  //sys_clk_timer_s1_reset_n assignment, which is an e_assign
  assign sys_clk_timer_s1_reset_n = reset_n;

  assign sys_clk_timer_s1_chipselect = peripheral_bridge_m1_granted_sys_clk_timer_s1;
  //sys_clk_timer_s1_firsttransfer first transaction, which is an e_assign
  assign sys_clk_timer_s1_firsttransfer = sys_clk_timer_s1_begins_xfer ? sys_clk_timer_s1_unreg_firsttransfer : sys_clk_timer_s1_reg_firsttransfer;

  //sys_clk_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sys_clk_timer_s1_unreg_firsttransfer = ~(sys_clk_timer_s1_slavearbiterlockenable & sys_clk_timer_s1_any_continuerequest);

  //sys_clk_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_reg_firsttransfer <= 1'b1;
      else if (sys_clk_timer_s1_begins_xfer)
          sys_clk_timer_s1_reg_firsttransfer <= sys_clk_timer_s1_unreg_firsttransfer;
    end


  //sys_clk_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sys_clk_timer_s1_beginbursttransfer_internal = sys_clk_timer_s1_begins_xfer;

  //~sys_clk_timer_s1_write_n assignment, which is an e_mux
  assign sys_clk_timer_s1_write_n = ~(peripheral_bridge_m1_granted_sys_clk_timer_s1 & peripheral_bridge_m1_write);

  //sys_clk_timer_s1_address mux, which is an e_mux
  assign sys_clk_timer_s1_address = peripheral_bridge_m1_nativeaddress;

  //d1_sys_clk_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sys_clk_timer_s1_end_xfer <= 1;
      else 
        d1_sys_clk_timer_s1_end_xfer <= sys_clk_timer_s1_end_xfer;
    end


  //sys_clk_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign sys_clk_timer_s1_waits_for_read = sys_clk_timer_s1_in_a_read_cycle & sys_clk_timer_s1_begins_xfer;

  //sys_clk_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign sys_clk_timer_s1_in_a_read_cycle = peripheral_bridge_m1_granted_sys_clk_timer_s1 & peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sys_clk_timer_s1_in_a_read_cycle;

  //sys_clk_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign sys_clk_timer_s1_waits_for_write = sys_clk_timer_s1_in_a_write_cycle & 0;

  //sys_clk_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign sys_clk_timer_s1_in_a_write_cycle = peripheral_bridge_m1_granted_sys_clk_timer_s1 & peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sys_clk_timer_s1_in_a_write_cycle;

  assign wait_for_sys_clk_timer_s1_counter = 0;
  //assign sys_clk_timer_s1_irq_from_sa = sys_clk_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_clk_timer_s1_irq_from_sa = sys_clk_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sys_clk_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_latency_counter,
                                         cpu_data_master_read,
                                         cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                         cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                         cpu_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_data_master_granted_sysid_control_slave,
                                         cpu_data_master_qualified_request_sysid_control_slave,
                                         cpu_data_master_read_data_valid_sysid_control_slave,
                                         cpu_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           cpu_data_master_granted_sysid_control_slave;
  output           cpu_data_master_qualified_request_sysid_control_slave;
  output           cpu_data_master_read_data_valid_sysid_control_slave;
  output           cpu_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_sysid_control_slave_from_cpu_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  2: 0] sysid_control_slave_arb_share_counter;
  wire    [  2: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_data_master_requests_sysid_control_slave = (({cpu_data_master_address_to_slave[27 : 3] , 3'b0} == 28'ha411078) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sysid_control_slave = cpu_data_master_requests_sysid_control_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_sysid_control_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_sysid_control_slave = cpu_data_master_granted_sysid_control_slave & cpu_data_master_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign cpu_data_master_granted_sysid_control_slave = cpu_data_master_qualified_request_sysid_control_slave;

  //cpu/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timing_adapter_in_arbitrator (
                                      // inputs:
                                       clk,
                                       reset_n,
                                       sgdma_pixel_out_data,
                                       sgdma_pixel_out_empty,
                                       sgdma_pixel_out_endofpacket,
                                       sgdma_pixel_out_startofpacket,
                                       sgdma_pixel_out_valid,
                                       timing_adapter_in_ready,

                                      // outputs:
                                       timing_adapter_in_data,
                                       timing_adapter_in_empty,
                                       timing_adapter_in_endofpacket,
                                       timing_adapter_in_ready_from_sa,
                                       timing_adapter_in_reset_n,
                                       timing_adapter_in_startofpacket,
                                       timing_adapter_in_valid
                                    )
;

  output  [ 31: 0] timing_adapter_in_data;
  output  [  1: 0] timing_adapter_in_empty;
  output           timing_adapter_in_endofpacket;
  output           timing_adapter_in_ready_from_sa;
  output           timing_adapter_in_reset_n;
  output           timing_adapter_in_startofpacket;
  output           timing_adapter_in_valid;
  input            clk;
  input            reset_n;
  input   [ 31: 0] sgdma_pixel_out_data;
  input   [  1: 0] sgdma_pixel_out_empty;
  input            sgdma_pixel_out_endofpacket;
  input            sgdma_pixel_out_startofpacket;
  input            sgdma_pixel_out_valid;
  input            timing_adapter_in_ready;

  wire    [ 31: 0] timing_adapter_in_data;
  wire    [  1: 0] timing_adapter_in_empty;
  wire             timing_adapter_in_endofpacket;
  wire             timing_adapter_in_ready_from_sa;
  wire             timing_adapter_in_reset_n;
  wire             timing_adapter_in_startofpacket;
  wire             timing_adapter_in_valid;
  //mux timing_adapter_in_data, which is an e_mux
  assign timing_adapter_in_data = sgdma_pixel_out_data;

  //mux timing_adapter_in_empty, which is an e_mux
  assign timing_adapter_in_empty = sgdma_pixel_out_empty;

  //mux timing_adapter_in_endofpacket, which is an e_mux
  assign timing_adapter_in_endofpacket = sgdma_pixel_out_endofpacket;

  //assign timing_adapter_in_ready_from_sa = timing_adapter_in_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timing_adapter_in_ready_from_sa = timing_adapter_in_ready;

  //mux timing_adapter_in_startofpacket, which is an e_mux
  assign timing_adapter_in_startofpacket = sgdma_pixel_out_startofpacket;

  //mux timing_adapter_in_valid, which is an e_mux
  assign timing_adapter_in_valid = sgdma_pixel_out_valid;

  //timing_adapter_in_reset_n assignment, which is an e_assign
  assign timing_adapter_in_reset_n = reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timing_adapter_out_arbitrator (
                                       // inputs:
                                        clk,
                                        fifo_in_ready_from_sa,
                                        reset_n,
                                        timing_adapter_out_data,
                                        timing_adapter_out_empty,
                                        timing_adapter_out_endofpacket,
                                        timing_adapter_out_startofpacket,
                                        timing_adapter_out_valid,

                                       // outputs:
                                        timing_adapter_out_ready
                                     )
;

  output           timing_adapter_out_ready;
  input            clk;
  input            fifo_in_ready_from_sa;
  input            reset_n;
  input   [ 31: 0] timing_adapter_out_data;
  input   [  1: 0] timing_adapter_out_empty;
  input            timing_adapter_out_endofpacket;
  input            timing_adapter_out_startofpacket;
  input            timing_adapter_out_valid;

  wire             timing_adapter_out_ready;
  //mux timing_adapter_out_ready, which is an e_mux
  assign timing_adapter_out_ready = fifo_in_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module touch_panel_busy_s1_arbitrator (
                                        // inputs:
                                         clk,
                                         peripheral_bridge_m1_address_to_slave,
                                         peripheral_bridge_m1_latency_counter,
                                         peripheral_bridge_m1_nativeaddress,
                                         peripheral_bridge_m1_read,
                                         peripheral_bridge_m1_write,
                                         reset_n,
                                         touch_panel_busy_s1_readdata,

                                        // outputs:
                                         d1_touch_panel_busy_s1_end_xfer,
                                         peripheral_bridge_m1_granted_touch_panel_busy_s1,
                                         peripheral_bridge_m1_qualified_request_touch_panel_busy_s1,
                                         peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1,
                                         peripheral_bridge_m1_requests_touch_panel_busy_s1,
                                         touch_panel_busy_s1_address,
                                         touch_panel_busy_s1_readdata_from_sa,
                                         touch_panel_busy_s1_reset_n
                                      )
;

  output           d1_touch_panel_busy_s1_end_xfer;
  output           peripheral_bridge_m1_granted_touch_panel_busy_s1;
  output           peripheral_bridge_m1_qualified_request_touch_panel_busy_s1;
  output           peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1;
  output           peripheral_bridge_m1_requests_touch_panel_busy_s1;
  output  [  1: 0] touch_panel_busy_s1_address;
  output           touch_panel_busy_s1_readdata_from_sa;
  output           touch_panel_busy_s1_reset_n;
  input            clk;
  input   [ 10: 0] peripheral_bridge_m1_address_to_slave;
  input            peripheral_bridge_m1_latency_counter;
  input   [  8: 0] peripheral_bridge_m1_nativeaddress;
  input            peripheral_bridge_m1_read;
  input            peripheral_bridge_m1_write;
  input            reset_n;
  input            touch_panel_busy_s1_readdata;

  reg              d1_reasons_to_wait;
  reg              d1_touch_panel_busy_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_touch_panel_busy_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             peripheral_bridge_m1_arbiterlock;
  wire             peripheral_bridge_m1_arbiterlock2;
  wire             peripheral_bridge_m1_continuerequest;
  wire             peripheral_bridge_m1_granted_touch_panel_busy_s1;
  wire             peripheral_bridge_m1_qualified_request_touch_panel_busy_s1;
  wire             peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1;
  wire             peripheral_bridge_m1_requests_touch_panel_busy_s1;
  wire             peripheral_bridge_m1_saved_grant_touch_panel_busy_s1;
  wire    [  1: 0] touch_panel_busy_s1_address;
  wire             touch_panel_busy_s1_allgrants;
  wire             touch_panel_busy_s1_allow_new_arb_cycle;
  wire             touch_panel_busy_s1_any_bursting_master_saved_grant;
  wire             touch_panel_busy_s1_any_continuerequest;
  wire             touch_panel_busy_s1_arb_counter_enable;
  reg              touch_panel_busy_s1_arb_share_counter;
  wire             touch_panel_busy_s1_arb_share_counter_next_value;
  wire             touch_panel_busy_s1_arb_share_set_values;
  wire             touch_panel_busy_s1_beginbursttransfer_internal;
  wire             touch_panel_busy_s1_begins_xfer;
  wire             touch_panel_busy_s1_end_xfer;
  wire             touch_panel_busy_s1_firsttransfer;
  wire             touch_panel_busy_s1_grant_vector;
  wire             touch_panel_busy_s1_in_a_read_cycle;
  wire             touch_panel_busy_s1_in_a_write_cycle;
  wire             touch_panel_busy_s1_master_qreq_vector;
  wire             touch_panel_busy_s1_non_bursting_master_requests;
  wire             touch_panel_busy_s1_readdata_from_sa;
  reg              touch_panel_busy_s1_reg_firsttransfer;
  wire             touch_panel_busy_s1_reset_n;
  reg              touch_panel_busy_s1_slavearbiterlockenable;
  wire             touch_panel_busy_s1_slavearbiterlockenable2;
  wire             touch_panel_busy_s1_unreg_firsttransfer;
  wire             touch_panel_busy_s1_waits_for_read;
  wire             touch_panel_busy_s1_waits_for_write;
  wire             wait_for_touch_panel_busy_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~touch_panel_busy_s1_end_xfer;
    end


  assign touch_panel_busy_s1_begins_xfer = ~d1_reasons_to_wait & ((peripheral_bridge_m1_qualified_request_touch_panel_busy_s1));
  //assign touch_panel_busy_s1_readdata_from_sa = touch_panel_busy_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign touch_panel_busy_s1_readdata_from_sa = touch_panel_busy_s1_readdata;

  assign peripheral_bridge_m1_requests_touch_panel_busy_s1 = (({peripheral_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h480) & (peripheral_bridge_m1_read | peripheral_bridge_m1_write)) & peripheral_bridge_m1_read;
  //touch_panel_busy_s1_arb_share_counter set values, which is an e_mux
  assign touch_panel_busy_s1_arb_share_set_values = 1;

  //touch_panel_busy_s1_non_bursting_master_requests mux, which is an e_mux
  assign touch_panel_busy_s1_non_bursting_master_requests = peripheral_bridge_m1_requests_touch_panel_busy_s1;

  //touch_panel_busy_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign touch_panel_busy_s1_any_bursting_master_saved_grant = 0;

  //touch_panel_busy_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign touch_panel_busy_s1_arb_share_counter_next_value = touch_panel_busy_s1_firsttransfer ? (touch_panel_busy_s1_arb_share_set_values - 1) : |touch_panel_busy_s1_arb_share_counter ? (touch_panel_busy_s1_arb_share_counter - 1) : 0;

  //touch_panel_busy_s1_allgrants all slave grants, which is an e_mux
  assign touch_panel_busy_s1_allgrants = |touch_panel_busy_s1_grant_vector;

  //touch_panel_busy_s1_end_xfer assignment, which is an e_assign
  assign touch_panel_busy_s1_end_xfer = ~(touch_panel_busy_s1_waits_for_read | touch_panel_busy_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_touch_panel_busy_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_touch_panel_busy_s1 = touch_panel_busy_s1_end_xfer & (~touch_panel_busy_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //touch_panel_busy_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign touch_panel_busy_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_touch_panel_busy_s1 & touch_panel_busy_s1_allgrants) | (end_xfer_arb_share_counter_term_touch_panel_busy_s1 & ~touch_panel_busy_s1_non_bursting_master_requests);

  //touch_panel_busy_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          touch_panel_busy_s1_arb_share_counter <= 0;
      else if (touch_panel_busy_s1_arb_counter_enable)
          touch_panel_busy_s1_arb_share_counter <= touch_panel_busy_s1_arb_share_counter_next_value;
    end


  //touch_panel_busy_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          touch_panel_busy_s1_slavearbiterlockenable <= 0;
      else if ((|touch_panel_busy_s1_master_qreq_vector & end_xfer_arb_share_counter_term_touch_panel_busy_s1) | (end_xfer_arb_share_counter_term_touch_panel_busy_s1 & ~touch_panel_busy_s1_non_bursting_master_requests))
          touch_panel_busy_s1_slavearbiterlockenable <= |touch_panel_busy_s1_arb_share_counter_next_value;
    end


  //peripheral_bridge/m1 touch_panel_busy/s1 arbiterlock, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock = touch_panel_busy_s1_slavearbiterlockenable & peripheral_bridge_m1_continuerequest;

  //touch_panel_busy_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign touch_panel_busy_s1_slavearbiterlockenable2 = |touch_panel_busy_s1_arb_share_counter_next_value;

  //peripheral_bridge/m1 touch_panel_busy/s1 arbiterlock2, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock2 = touch_panel_busy_s1_slavearbiterlockenable2 & peripheral_bridge_m1_continuerequest;

  //touch_panel_busy_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign touch_panel_busy_s1_any_continuerequest = 1;

  //peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign peripheral_bridge_m1_continuerequest = 1;

  assign peripheral_bridge_m1_qualified_request_touch_panel_busy_s1 = peripheral_bridge_m1_requests_touch_panel_busy_s1 & ~((peripheral_bridge_m1_read & ((peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1, which is an e_mux
  assign peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1 = peripheral_bridge_m1_granted_touch_panel_busy_s1 & peripheral_bridge_m1_read & ~touch_panel_busy_s1_waits_for_read;

  //master is always granted when requested
  assign peripheral_bridge_m1_granted_touch_panel_busy_s1 = peripheral_bridge_m1_qualified_request_touch_panel_busy_s1;

  //peripheral_bridge/m1 saved-grant touch_panel_busy/s1, which is an e_assign
  assign peripheral_bridge_m1_saved_grant_touch_panel_busy_s1 = peripheral_bridge_m1_requests_touch_panel_busy_s1;

  //allow new arb cycle for touch_panel_busy/s1, which is an e_assign
  assign touch_panel_busy_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign touch_panel_busy_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign touch_panel_busy_s1_master_qreq_vector = 1;

  //touch_panel_busy_s1_reset_n assignment, which is an e_assign
  assign touch_panel_busy_s1_reset_n = reset_n;

  //touch_panel_busy_s1_firsttransfer first transaction, which is an e_assign
  assign touch_panel_busy_s1_firsttransfer = touch_panel_busy_s1_begins_xfer ? touch_panel_busy_s1_unreg_firsttransfer : touch_panel_busy_s1_reg_firsttransfer;

  //touch_panel_busy_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign touch_panel_busy_s1_unreg_firsttransfer = ~(touch_panel_busy_s1_slavearbiterlockenable & touch_panel_busy_s1_any_continuerequest);

  //touch_panel_busy_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          touch_panel_busy_s1_reg_firsttransfer <= 1'b1;
      else if (touch_panel_busy_s1_begins_xfer)
          touch_panel_busy_s1_reg_firsttransfer <= touch_panel_busy_s1_unreg_firsttransfer;
    end


  //touch_panel_busy_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign touch_panel_busy_s1_beginbursttransfer_internal = touch_panel_busy_s1_begins_xfer;

  //touch_panel_busy_s1_address mux, which is an e_mux
  assign touch_panel_busy_s1_address = peripheral_bridge_m1_nativeaddress;

  //d1_touch_panel_busy_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_touch_panel_busy_s1_end_xfer <= 1;
      else 
        d1_touch_panel_busy_s1_end_xfer <= touch_panel_busy_s1_end_xfer;
    end


  //touch_panel_busy_s1_waits_for_read in a cycle, which is an e_mux
  assign touch_panel_busy_s1_waits_for_read = touch_panel_busy_s1_in_a_read_cycle & touch_panel_busy_s1_begins_xfer;

  //touch_panel_busy_s1_in_a_read_cycle assignment, which is an e_assign
  assign touch_panel_busy_s1_in_a_read_cycle = peripheral_bridge_m1_granted_touch_panel_busy_s1 & peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = touch_panel_busy_s1_in_a_read_cycle;

  //touch_panel_busy_s1_waits_for_write in a cycle, which is an e_mux
  assign touch_panel_busy_s1_waits_for_write = touch_panel_busy_s1_in_a_write_cycle & 0;

  //touch_panel_busy_s1_in_a_write_cycle assignment, which is an e_assign
  assign touch_panel_busy_s1_in_a_write_cycle = peripheral_bridge_m1_granted_touch_panel_busy_s1 & peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = touch_panel_busy_s1_in_a_write_cycle;

  assign wait_for_touch_panel_busy_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //touch_panel_busy/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module touch_panel_pen_irq_n_s1_arbitrator (
                                             // inputs:
                                              clk,
                                              peripheral_bridge_m1_address_to_slave,
                                              peripheral_bridge_m1_latency_counter,
                                              peripheral_bridge_m1_nativeaddress,
                                              peripheral_bridge_m1_read,
                                              peripheral_bridge_m1_write,
                                              peripheral_bridge_m1_writedata,
                                              reset_n,
                                              touch_panel_pen_irq_n_s1_irq,
                                              touch_panel_pen_irq_n_s1_readdata,

                                             // outputs:
                                              d1_touch_panel_pen_irq_n_s1_end_xfer,
                                              peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1,
                                              peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1,
                                              peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1,
                                              peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1,
                                              touch_panel_pen_irq_n_s1_address,
                                              touch_panel_pen_irq_n_s1_chipselect,
                                              touch_panel_pen_irq_n_s1_irq_from_sa,
                                              touch_panel_pen_irq_n_s1_readdata_from_sa,
                                              touch_panel_pen_irq_n_s1_reset_n,
                                              touch_panel_pen_irq_n_s1_write_n,
                                              touch_panel_pen_irq_n_s1_writedata
                                           )
;

  output           d1_touch_panel_pen_irq_n_s1_end_xfer;
  output           peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1;
  output           peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1;
  output           peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1;
  output           peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1;
  output  [  1: 0] touch_panel_pen_irq_n_s1_address;
  output           touch_panel_pen_irq_n_s1_chipselect;
  output           touch_panel_pen_irq_n_s1_irq_from_sa;
  output           touch_panel_pen_irq_n_s1_readdata_from_sa;
  output           touch_panel_pen_irq_n_s1_reset_n;
  output           touch_panel_pen_irq_n_s1_write_n;
  output           touch_panel_pen_irq_n_s1_writedata;
  input            clk;
  input   [ 10: 0] peripheral_bridge_m1_address_to_slave;
  input            peripheral_bridge_m1_latency_counter;
  input   [  8: 0] peripheral_bridge_m1_nativeaddress;
  input            peripheral_bridge_m1_read;
  input            peripheral_bridge_m1_write;
  input   [ 31: 0] peripheral_bridge_m1_writedata;
  input            reset_n;
  input            touch_panel_pen_irq_n_s1_irq;
  input            touch_panel_pen_irq_n_s1_readdata;

  reg              d1_reasons_to_wait;
  reg              d1_touch_panel_pen_irq_n_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_touch_panel_pen_irq_n_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             peripheral_bridge_m1_arbiterlock;
  wire             peripheral_bridge_m1_arbiterlock2;
  wire             peripheral_bridge_m1_continuerequest;
  wire             peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1;
  wire             peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1;
  wire             peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1;
  wire             peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1;
  wire             peripheral_bridge_m1_saved_grant_touch_panel_pen_irq_n_s1;
  wire    [  1: 0] touch_panel_pen_irq_n_s1_address;
  wire             touch_panel_pen_irq_n_s1_allgrants;
  wire             touch_panel_pen_irq_n_s1_allow_new_arb_cycle;
  wire             touch_panel_pen_irq_n_s1_any_bursting_master_saved_grant;
  wire             touch_panel_pen_irq_n_s1_any_continuerequest;
  wire             touch_panel_pen_irq_n_s1_arb_counter_enable;
  reg              touch_panel_pen_irq_n_s1_arb_share_counter;
  wire             touch_panel_pen_irq_n_s1_arb_share_counter_next_value;
  wire             touch_panel_pen_irq_n_s1_arb_share_set_values;
  wire             touch_panel_pen_irq_n_s1_beginbursttransfer_internal;
  wire             touch_panel_pen_irq_n_s1_begins_xfer;
  wire             touch_panel_pen_irq_n_s1_chipselect;
  wire             touch_panel_pen_irq_n_s1_end_xfer;
  wire             touch_panel_pen_irq_n_s1_firsttransfer;
  wire             touch_panel_pen_irq_n_s1_grant_vector;
  wire             touch_panel_pen_irq_n_s1_in_a_read_cycle;
  wire             touch_panel_pen_irq_n_s1_in_a_write_cycle;
  wire             touch_panel_pen_irq_n_s1_irq_from_sa;
  wire             touch_panel_pen_irq_n_s1_master_qreq_vector;
  wire             touch_panel_pen_irq_n_s1_non_bursting_master_requests;
  wire             touch_panel_pen_irq_n_s1_readdata_from_sa;
  reg              touch_panel_pen_irq_n_s1_reg_firsttransfer;
  wire             touch_panel_pen_irq_n_s1_reset_n;
  reg              touch_panel_pen_irq_n_s1_slavearbiterlockenable;
  wire             touch_panel_pen_irq_n_s1_slavearbiterlockenable2;
  wire             touch_panel_pen_irq_n_s1_unreg_firsttransfer;
  wire             touch_panel_pen_irq_n_s1_waits_for_read;
  wire             touch_panel_pen_irq_n_s1_waits_for_write;
  wire             touch_panel_pen_irq_n_s1_write_n;
  wire             touch_panel_pen_irq_n_s1_writedata;
  wire             wait_for_touch_panel_pen_irq_n_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~touch_panel_pen_irq_n_s1_end_xfer;
    end


  assign touch_panel_pen_irq_n_s1_begins_xfer = ~d1_reasons_to_wait & ((peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1));
  //assign touch_panel_pen_irq_n_s1_readdata_from_sa = touch_panel_pen_irq_n_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign touch_panel_pen_irq_n_s1_readdata_from_sa = touch_panel_pen_irq_n_s1_readdata;

  assign peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1 = ({peripheral_bridge_m1_address_to_slave[10 : 4] , 4'b0} == 11'h470) & (peripheral_bridge_m1_read | peripheral_bridge_m1_write);
  //touch_panel_pen_irq_n_s1_arb_share_counter set values, which is an e_mux
  assign touch_panel_pen_irq_n_s1_arb_share_set_values = 1;

  //touch_panel_pen_irq_n_s1_non_bursting_master_requests mux, which is an e_mux
  assign touch_panel_pen_irq_n_s1_non_bursting_master_requests = peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1;

  //touch_panel_pen_irq_n_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign touch_panel_pen_irq_n_s1_any_bursting_master_saved_grant = 0;

  //touch_panel_pen_irq_n_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign touch_panel_pen_irq_n_s1_arb_share_counter_next_value = touch_panel_pen_irq_n_s1_firsttransfer ? (touch_panel_pen_irq_n_s1_arb_share_set_values - 1) : |touch_panel_pen_irq_n_s1_arb_share_counter ? (touch_panel_pen_irq_n_s1_arb_share_counter - 1) : 0;

  //touch_panel_pen_irq_n_s1_allgrants all slave grants, which is an e_mux
  assign touch_panel_pen_irq_n_s1_allgrants = |touch_panel_pen_irq_n_s1_grant_vector;

  //touch_panel_pen_irq_n_s1_end_xfer assignment, which is an e_assign
  assign touch_panel_pen_irq_n_s1_end_xfer = ~(touch_panel_pen_irq_n_s1_waits_for_read | touch_panel_pen_irq_n_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_touch_panel_pen_irq_n_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_touch_panel_pen_irq_n_s1 = touch_panel_pen_irq_n_s1_end_xfer & (~touch_panel_pen_irq_n_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //touch_panel_pen_irq_n_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign touch_panel_pen_irq_n_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_touch_panel_pen_irq_n_s1 & touch_panel_pen_irq_n_s1_allgrants) | (end_xfer_arb_share_counter_term_touch_panel_pen_irq_n_s1 & ~touch_panel_pen_irq_n_s1_non_bursting_master_requests);

  //touch_panel_pen_irq_n_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          touch_panel_pen_irq_n_s1_arb_share_counter <= 0;
      else if (touch_panel_pen_irq_n_s1_arb_counter_enable)
          touch_panel_pen_irq_n_s1_arb_share_counter <= touch_panel_pen_irq_n_s1_arb_share_counter_next_value;
    end


  //touch_panel_pen_irq_n_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          touch_panel_pen_irq_n_s1_slavearbiterlockenable <= 0;
      else if ((|touch_panel_pen_irq_n_s1_master_qreq_vector & end_xfer_arb_share_counter_term_touch_panel_pen_irq_n_s1) | (end_xfer_arb_share_counter_term_touch_panel_pen_irq_n_s1 & ~touch_panel_pen_irq_n_s1_non_bursting_master_requests))
          touch_panel_pen_irq_n_s1_slavearbiterlockenable <= |touch_panel_pen_irq_n_s1_arb_share_counter_next_value;
    end


  //peripheral_bridge/m1 touch_panel_pen_irq_n/s1 arbiterlock, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock = touch_panel_pen_irq_n_s1_slavearbiterlockenable & peripheral_bridge_m1_continuerequest;

  //touch_panel_pen_irq_n_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign touch_panel_pen_irq_n_s1_slavearbiterlockenable2 = |touch_panel_pen_irq_n_s1_arb_share_counter_next_value;

  //peripheral_bridge/m1 touch_panel_pen_irq_n/s1 arbiterlock2, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock2 = touch_panel_pen_irq_n_s1_slavearbiterlockenable2 & peripheral_bridge_m1_continuerequest;

  //touch_panel_pen_irq_n_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign touch_panel_pen_irq_n_s1_any_continuerequest = 1;

  //peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign peripheral_bridge_m1_continuerequest = 1;

  assign peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1 = peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1 & ~((peripheral_bridge_m1_read & ((peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1, which is an e_mux
  assign peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1 = peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1 & peripheral_bridge_m1_read & ~touch_panel_pen_irq_n_s1_waits_for_read;

  //touch_panel_pen_irq_n_s1_writedata mux, which is an e_mux
  assign touch_panel_pen_irq_n_s1_writedata = peripheral_bridge_m1_writedata;

  //master is always granted when requested
  assign peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1 = peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1;

  //peripheral_bridge/m1 saved-grant touch_panel_pen_irq_n/s1, which is an e_assign
  assign peripheral_bridge_m1_saved_grant_touch_panel_pen_irq_n_s1 = peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1;

  //allow new arb cycle for touch_panel_pen_irq_n/s1, which is an e_assign
  assign touch_panel_pen_irq_n_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign touch_panel_pen_irq_n_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign touch_panel_pen_irq_n_s1_master_qreq_vector = 1;

  //touch_panel_pen_irq_n_s1_reset_n assignment, which is an e_assign
  assign touch_panel_pen_irq_n_s1_reset_n = reset_n;

  assign touch_panel_pen_irq_n_s1_chipselect = peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1;
  //touch_panel_pen_irq_n_s1_firsttransfer first transaction, which is an e_assign
  assign touch_panel_pen_irq_n_s1_firsttransfer = touch_panel_pen_irq_n_s1_begins_xfer ? touch_panel_pen_irq_n_s1_unreg_firsttransfer : touch_panel_pen_irq_n_s1_reg_firsttransfer;

  //touch_panel_pen_irq_n_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign touch_panel_pen_irq_n_s1_unreg_firsttransfer = ~(touch_panel_pen_irq_n_s1_slavearbiterlockenable & touch_panel_pen_irq_n_s1_any_continuerequest);

  //touch_panel_pen_irq_n_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          touch_panel_pen_irq_n_s1_reg_firsttransfer <= 1'b1;
      else if (touch_panel_pen_irq_n_s1_begins_xfer)
          touch_panel_pen_irq_n_s1_reg_firsttransfer <= touch_panel_pen_irq_n_s1_unreg_firsttransfer;
    end


  //touch_panel_pen_irq_n_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign touch_panel_pen_irq_n_s1_beginbursttransfer_internal = touch_panel_pen_irq_n_s1_begins_xfer;

  //~touch_panel_pen_irq_n_s1_write_n assignment, which is an e_mux
  assign touch_panel_pen_irq_n_s1_write_n = ~(peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1 & peripheral_bridge_m1_write);

  //touch_panel_pen_irq_n_s1_address mux, which is an e_mux
  assign touch_panel_pen_irq_n_s1_address = peripheral_bridge_m1_nativeaddress;

  //d1_touch_panel_pen_irq_n_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_touch_panel_pen_irq_n_s1_end_xfer <= 1;
      else 
        d1_touch_panel_pen_irq_n_s1_end_xfer <= touch_panel_pen_irq_n_s1_end_xfer;
    end


  //touch_panel_pen_irq_n_s1_waits_for_read in a cycle, which is an e_mux
  assign touch_panel_pen_irq_n_s1_waits_for_read = touch_panel_pen_irq_n_s1_in_a_read_cycle & touch_panel_pen_irq_n_s1_begins_xfer;

  //touch_panel_pen_irq_n_s1_in_a_read_cycle assignment, which is an e_assign
  assign touch_panel_pen_irq_n_s1_in_a_read_cycle = peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1 & peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = touch_panel_pen_irq_n_s1_in_a_read_cycle;

  //touch_panel_pen_irq_n_s1_waits_for_write in a cycle, which is an e_mux
  assign touch_panel_pen_irq_n_s1_waits_for_write = touch_panel_pen_irq_n_s1_in_a_write_cycle & 0;

  //touch_panel_pen_irq_n_s1_in_a_write_cycle assignment, which is an e_assign
  assign touch_panel_pen_irq_n_s1_in_a_write_cycle = peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1 & peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = touch_panel_pen_irq_n_s1_in_a_write_cycle;

  assign wait_for_touch_panel_pen_irq_n_s1_counter = 0;
  //assign touch_panel_pen_irq_n_s1_irq_from_sa = touch_panel_pen_irq_n_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign touch_panel_pen_irq_n_s1_irq_from_sa = touch_panel_pen_irq_n_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //touch_panel_pen_irq_n/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module touch_panel_spi_spi_control_port_arbitrator (
                                                     // inputs:
                                                      clk,
                                                      peripheral_bridge_m1_address_to_slave,
                                                      peripheral_bridge_m1_latency_counter,
                                                      peripheral_bridge_m1_nativeaddress,
                                                      peripheral_bridge_m1_read,
                                                      peripheral_bridge_m1_write,
                                                      peripheral_bridge_m1_writedata,
                                                      reset_n,
                                                      touch_panel_spi_spi_control_port_dataavailable,
                                                      touch_panel_spi_spi_control_port_endofpacket,
                                                      touch_panel_spi_spi_control_port_irq,
                                                      touch_panel_spi_spi_control_port_readdata,
                                                      touch_panel_spi_spi_control_port_readyfordata,

                                                     // outputs:
                                                      d1_touch_panel_spi_spi_control_port_end_xfer,
                                                      peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port,
                                                      peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port,
                                                      peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port,
                                                      peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port,
                                                      touch_panel_spi_spi_control_port_address,
                                                      touch_panel_spi_spi_control_port_chipselect,
                                                      touch_panel_spi_spi_control_port_dataavailable_from_sa,
                                                      touch_panel_spi_spi_control_port_endofpacket_from_sa,
                                                      touch_panel_spi_spi_control_port_irq_from_sa,
                                                      touch_panel_spi_spi_control_port_read_n,
                                                      touch_panel_spi_spi_control_port_readdata_from_sa,
                                                      touch_panel_spi_spi_control_port_readyfordata_from_sa,
                                                      touch_panel_spi_spi_control_port_reset_n,
                                                      touch_panel_spi_spi_control_port_write_n,
                                                      touch_panel_spi_spi_control_port_writedata
                                                   )
;

  output           d1_touch_panel_spi_spi_control_port_end_xfer;
  output           peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port;
  output           peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port;
  output           peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port;
  output           peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port;
  output  [  2: 0] touch_panel_spi_spi_control_port_address;
  output           touch_panel_spi_spi_control_port_chipselect;
  output           touch_panel_spi_spi_control_port_dataavailable_from_sa;
  output           touch_panel_spi_spi_control_port_endofpacket_from_sa;
  output           touch_panel_spi_spi_control_port_irq_from_sa;
  output           touch_panel_spi_spi_control_port_read_n;
  output  [ 15: 0] touch_panel_spi_spi_control_port_readdata_from_sa;
  output           touch_panel_spi_spi_control_port_readyfordata_from_sa;
  output           touch_panel_spi_spi_control_port_reset_n;
  output           touch_panel_spi_spi_control_port_write_n;
  output  [ 15: 0] touch_panel_spi_spi_control_port_writedata;
  input            clk;
  input   [ 10: 0] peripheral_bridge_m1_address_to_slave;
  input            peripheral_bridge_m1_latency_counter;
  input   [  8: 0] peripheral_bridge_m1_nativeaddress;
  input            peripheral_bridge_m1_read;
  input            peripheral_bridge_m1_write;
  input   [ 31: 0] peripheral_bridge_m1_writedata;
  input            reset_n;
  input            touch_panel_spi_spi_control_port_dataavailable;
  input            touch_panel_spi_spi_control_port_endofpacket;
  input            touch_panel_spi_spi_control_port_irq;
  input   [ 15: 0] touch_panel_spi_spi_control_port_readdata;
  input            touch_panel_spi_spi_control_port_readyfordata;

  reg              d1_reasons_to_wait;
  reg              d1_touch_panel_spi_spi_control_port_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_touch_panel_spi_spi_control_port;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             peripheral_bridge_m1_arbiterlock;
  wire             peripheral_bridge_m1_arbiterlock2;
  wire             peripheral_bridge_m1_continuerequest;
  wire             peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port;
  wire             peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port;
  wire             peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port;
  wire             peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port;
  wire             peripheral_bridge_m1_saved_grant_touch_panel_spi_spi_control_port;
  wire    [  2: 0] touch_panel_spi_spi_control_port_address;
  wire             touch_panel_spi_spi_control_port_allgrants;
  wire             touch_panel_spi_spi_control_port_allow_new_arb_cycle;
  wire             touch_panel_spi_spi_control_port_any_bursting_master_saved_grant;
  wire             touch_panel_spi_spi_control_port_any_continuerequest;
  wire             touch_panel_spi_spi_control_port_arb_counter_enable;
  reg              touch_panel_spi_spi_control_port_arb_share_counter;
  wire             touch_panel_spi_spi_control_port_arb_share_counter_next_value;
  wire             touch_panel_spi_spi_control_port_arb_share_set_values;
  wire             touch_panel_spi_spi_control_port_beginbursttransfer_internal;
  wire             touch_panel_spi_spi_control_port_begins_xfer;
  wire             touch_panel_spi_spi_control_port_chipselect;
  wire             touch_panel_spi_spi_control_port_dataavailable_from_sa;
  wire             touch_panel_spi_spi_control_port_end_xfer;
  wire             touch_panel_spi_spi_control_port_endofpacket_from_sa;
  wire             touch_panel_spi_spi_control_port_firsttransfer;
  wire             touch_panel_spi_spi_control_port_grant_vector;
  wire             touch_panel_spi_spi_control_port_in_a_read_cycle;
  wire             touch_panel_spi_spi_control_port_in_a_write_cycle;
  wire             touch_panel_spi_spi_control_port_irq_from_sa;
  wire             touch_panel_spi_spi_control_port_master_qreq_vector;
  wire             touch_panel_spi_spi_control_port_non_bursting_master_requests;
  wire             touch_panel_spi_spi_control_port_read_n;
  wire    [ 15: 0] touch_panel_spi_spi_control_port_readdata_from_sa;
  wire             touch_panel_spi_spi_control_port_readyfordata_from_sa;
  reg              touch_panel_spi_spi_control_port_reg_firsttransfer;
  wire             touch_panel_spi_spi_control_port_reset_n;
  reg              touch_panel_spi_spi_control_port_slavearbiterlockenable;
  wire             touch_panel_spi_spi_control_port_slavearbiterlockenable2;
  wire             touch_panel_spi_spi_control_port_unreg_firsttransfer;
  wire             touch_panel_spi_spi_control_port_waits_for_read;
  wire             touch_panel_spi_spi_control_port_waits_for_write;
  wire             touch_panel_spi_spi_control_port_write_n;
  wire    [ 15: 0] touch_panel_spi_spi_control_port_writedata;
  wire             wait_for_touch_panel_spi_spi_control_port_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~touch_panel_spi_spi_control_port_end_xfer;
    end


  assign touch_panel_spi_spi_control_port_begins_xfer = ~d1_reasons_to_wait & ((peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port));
  //assign touch_panel_spi_spi_control_port_readdata_from_sa = touch_panel_spi_spi_control_port_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign touch_panel_spi_spi_control_port_readdata_from_sa = touch_panel_spi_spi_control_port_readdata;

  assign peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port = ({peripheral_bridge_m1_address_to_slave[10 : 5] , 5'b0} == 11'h420) & (peripheral_bridge_m1_read | peripheral_bridge_m1_write);
  //assign touch_panel_spi_spi_control_port_dataavailable_from_sa = touch_panel_spi_spi_control_port_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign touch_panel_spi_spi_control_port_dataavailable_from_sa = touch_panel_spi_spi_control_port_dataavailable;

  //assign touch_panel_spi_spi_control_port_readyfordata_from_sa = touch_panel_spi_spi_control_port_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign touch_panel_spi_spi_control_port_readyfordata_from_sa = touch_panel_spi_spi_control_port_readyfordata;

  //touch_panel_spi_spi_control_port_arb_share_counter set values, which is an e_mux
  assign touch_panel_spi_spi_control_port_arb_share_set_values = 1;

  //touch_panel_spi_spi_control_port_non_bursting_master_requests mux, which is an e_mux
  assign touch_panel_spi_spi_control_port_non_bursting_master_requests = peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port;

  //touch_panel_spi_spi_control_port_any_bursting_master_saved_grant mux, which is an e_mux
  assign touch_panel_spi_spi_control_port_any_bursting_master_saved_grant = 0;

  //touch_panel_spi_spi_control_port_arb_share_counter_next_value assignment, which is an e_assign
  assign touch_panel_spi_spi_control_port_arb_share_counter_next_value = touch_panel_spi_spi_control_port_firsttransfer ? (touch_panel_spi_spi_control_port_arb_share_set_values - 1) : |touch_panel_spi_spi_control_port_arb_share_counter ? (touch_panel_spi_spi_control_port_arb_share_counter - 1) : 0;

  //touch_panel_spi_spi_control_port_allgrants all slave grants, which is an e_mux
  assign touch_panel_spi_spi_control_port_allgrants = |touch_panel_spi_spi_control_port_grant_vector;

  //touch_panel_spi_spi_control_port_end_xfer assignment, which is an e_assign
  assign touch_panel_spi_spi_control_port_end_xfer = ~(touch_panel_spi_spi_control_port_waits_for_read | touch_panel_spi_spi_control_port_waits_for_write);

  //end_xfer_arb_share_counter_term_touch_panel_spi_spi_control_port arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_touch_panel_spi_spi_control_port = touch_panel_spi_spi_control_port_end_xfer & (~touch_panel_spi_spi_control_port_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //touch_panel_spi_spi_control_port_arb_share_counter arbitration counter enable, which is an e_assign
  assign touch_panel_spi_spi_control_port_arb_counter_enable = (end_xfer_arb_share_counter_term_touch_panel_spi_spi_control_port & touch_panel_spi_spi_control_port_allgrants) | (end_xfer_arb_share_counter_term_touch_panel_spi_spi_control_port & ~touch_panel_spi_spi_control_port_non_bursting_master_requests);

  //touch_panel_spi_spi_control_port_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          touch_panel_spi_spi_control_port_arb_share_counter <= 0;
      else if (touch_panel_spi_spi_control_port_arb_counter_enable)
          touch_panel_spi_spi_control_port_arb_share_counter <= touch_panel_spi_spi_control_port_arb_share_counter_next_value;
    end


  //touch_panel_spi_spi_control_port_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          touch_panel_spi_spi_control_port_slavearbiterlockenable <= 0;
      else if ((|touch_panel_spi_spi_control_port_master_qreq_vector & end_xfer_arb_share_counter_term_touch_panel_spi_spi_control_port) | (end_xfer_arb_share_counter_term_touch_panel_spi_spi_control_port & ~touch_panel_spi_spi_control_port_non_bursting_master_requests))
          touch_panel_spi_spi_control_port_slavearbiterlockenable <= |touch_panel_spi_spi_control_port_arb_share_counter_next_value;
    end


  //peripheral_bridge/m1 touch_panel_spi/spi_control_port arbiterlock, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock = touch_panel_spi_spi_control_port_slavearbiterlockenable & peripheral_bridge_m1_continuerequest;

  //touch_panel_spi_spi_control_port_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign touch_panel_spi_spi_control_port_slavearbiterlockenable2 = |touch_panel_spi_spi_control_port_arb_share_counter_next_value;

  //peripheral_bridge/m1 touch_panel_spi/spi_control_port arbiterlock2, which is an e_assign
  assign peripheral_bridge_m1_arbiterlock2 = touch_panel_spi_spi_control_port_slavearbiterlockenable2 & peripheral_bridge_m1_continuerequest;

  //touch_panel_spi_spi_control_port_any_continuerequest at least one master continues requesting, which is an e_assign
  assign touch_panel_spi_spi_control_port_any_continuerequest = 1;

  //peripheral_bridge_m1_continuerequest continued request, which is an e_assign
  assign peripheral_bridge_m1_continuerequest = 1;

  assign peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port = peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port & ~((peripheral_bridge_m1_read & ((peripheral_bridge_m1_latency_counter != 0))));
  //local readdatavalid peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port, which is an e_mux
  assign peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port = peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port & peripheral_bridge_m1_read & ~touch_panel_spi_spi_control_port_waits_for_read;

  //touch_panel_spi_spi_control_port_writedata mux, which is an e_mux
  assign touch_panel_spi_spi_control_port_writedata = peripheral_bridge_m1_writedata;

  //assign touch_panel_spi_spi_control_port_endofpacket_from_sa = touch_panel_spi_spi_control_port_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign touch_panel_spi_spi_control_port_endofpacket_from_sa = touch_panel_spi_spi_control_port_endofpacket;

  //master is always granted when requested
  assign peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port = peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port;

  //peripheral_bridge/m1 saved-grant touch_panel_spi/spi_control_port, which is an e_assign
  assign peripheral_bridge_m1_saved_grant_touch_panel_spi_spi_control_port = peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port;

  //allow new arb cycle for touch_panel_spi/spi_control_port, which is an e_assign
  assign touch_panel_spi_spi_control_port_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign touch_panel_spi_spi_control_port_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign touch_panel_spi_spi_control_port_master_qreq_vector = 1;

  //touch_panel_spi_spi_control_port_reset_n assignment, which is an e_assign
  assign touch_panel_spi_spi_control_port_reset_n = reset_n;

  assign touch_panel_spi_spi_control_port_chipselect = peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port;
  //touch_panel_spi_spi_control_port_firsttransfer first transaction, which is an e_assign
  assign touch_panel_spi_spi_control_port_firsttransfer = touch_panel_spi_spi_control_port_begins_xfer ? touch_panel_spi_spi_control_port_unreg_firsttransfer : touch_panel_spi_spi_control_port_reg_firsttransfer;

  //touch_panel_spi_spi_control_port_unreg_firsttransfer first transaction, which is an e_assign
  assign touch_panel_spi_spi_control_port_unreg_firsttransfer = ~(touch_panel_spi_spi_control_port_slavearbiterlockenable & touch_panel_spi_spi_control_port_any_continuerequest);

  //touch_panel_spi_spi_control_port_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          touch_panel_spi_spi_control_port_reg_firsttransfer <= 1'b1;
      else if (touch_panel_spi_spi_control_port_begins_xfer)
          touch_panel_spi_spi_control_port_reg_firsttransfer <= touch_panel_spi_spi_control_port_unreg_firsttransfer;
    end


  //touch_panel_spi_spi_control_port_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign touch_panel_spi_spi_control_port_beginbursttransfer_internal = touch_panel_spi_spi_control_port_begins_xfer;

  //~touch_panel_spi_spi_control_port_read_n assignment, which is an e_mux
  assign touch_panel_spi_spi_control_port_read_n = ~(peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port & peripheral_bridge_m1_read);

  //~touch_panel_spi_spi_control_port_write_n assignment, which is an e_mux
  assign touch_panel_spi_spi_control_port_write_n = ~(peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port & peripheral_bridge_m1_write);

  //touch_panel_spi_spi_control_port_address mux, which is an e_mux
  assign touch_panel_spi_spi_control_port_address = peripheral_bridge_m1_nativeaddress;

  //d1_touch_panel_spi_spi_control_port_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_touch_panel_spi_spi_control_port_end_xfer <= 1;
      else 
        d1_touch_panel_spi_spi_control_port_end_xfer <= touch_panel_spi_spi_control_port_end_xfer;
    end


  //touch_panel_spi_spi_control_port_waits_for_read in a cycle, which is an e_mux
  assign touch_panel_spi_spi_control_port_waits_for_read = touch_panel_spi_spi_control_port_in_a_read_cycle & touch_panel_spi_spi_control_port_begins_xfer;

  //touch_panel_spi_spi_control_port_in_a_read_cycle assignment, which is an e_assign
  assign touch_panel_spi_spi_control_port_in_a_read_cycle = peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port & peripheral_bridge_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = touch_panel_spi_spi_control_port_in_a_read_cycle;

  //touch_panel_spi_spi_control_port_waits_for_write in a cycle, which is an e_mux
  assign touch_panel_spi_spi_control_port_waits_for_write = touch_panel_spi_spi_control_port_in_a_write_cycle & touch_panel_spi_spi_control_port_begins_xfer;

  //touch_panel_spi_spi_control_port_in_a_write_cycle assignment, which is an e_assign
  assign touch_panel_spi_spi_control_port_in_a_write_cycle = peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port & peripheral_bridge_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = touch_panel_spi_spi_control_port_in_a_write_cycle;

  assign wait_for_touch_panel_spi_spi_control_port_counter = 0;
  //assign touch_panel_spi_spi_control_port_irq_from_sa = touch_panel_spi_spi_control_port_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign touch_panel_spi_spi_control_port_irq_from_sa = touch_panel_spi_spi_control_port_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //touch_panel_spi/spi_control_port enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_flash_avalon_slave_arbitrator (
                                                        // inputs:
                                                         clk,
                                                         cpu_data_master_address_to_slave,
                                                         cpu_data_master_byteenable,
                                                         cpu_data_master_dbs_address,
                                                         cpu_data_master_dbs_write_8,
                                                         cpu_data_master_latency_counter,
                                                         cpu_data_master_read,
                                                         cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register,
                                                         cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                                         cpu_data_master_write,
                                                         cpu_instruction_master_address_to_slave,
                                                         cpu_instruction_master_dbs_address,
                                                         cpu_instruction_master_latency_counter,
                                                         cpu_instruction_master_read,
                                                         cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                                                         reset_n,

                                                        // outputs:
                                                         cfi_flash_s1_wait_counter_eq_0,
                                                         cpu_data_master_byteenable_cfi_flash_s1,
                                                         cpu_data_master_granted_cfi_flash_s1,
                                                         cpu_data_master_qualified_request_cfi_flash_s1,
                                                         cpu_data_master_read_data_valid_cfi_flash_s1,
                                                         cpu_data_master_requests_cfi_flash_s1,
                                                         cpu_instruction_master_granted_cfi_flash_s1,
                                                         cpu_instruction_master_qualified_request_cfi_flash_s1,
                                                         cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                                         cpu_instruction_master_requests_cfi_flash_s1,
                                                         d1_tri_state_bridge_flash_avalon_slave_end_xfer,
                                                         incoming_tri_state_bridge_flash_data,
                                                         incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0,
                                                         read_n_to_the_cfi_flash,
                                                         select_n_to_the_cfi_flash,
                                                         tri_state_bridge_flash_address,
                                                         tri_state_bridge_flash_data,
                                                         write_n_to_the_cfi_flash
                                                      )
;

  output           cfi_flash_s1_wait_counter_eq_0;
  output           cpu_data_master_byteenable_cfi_flash_s1;
  output           cpu_data_master_granted_cfi_flash_s1;
  output           cpu_data_master_qualified_request_cfi_flash_s1;
  output           cpu_data_master_read_data_valid_cfi_flash_s1;
  output           cpu_data_master_requests_cfi_flash_s1;
  output           cpu_instruction_master_granted_cfi_flash_s1;
  output           cpu_instruction_master_qualified_request_cfi_flash_s1;
  output           cpu_instruction_master_read_data_valid_cfi_flash_s1;
  output           cpu_instruction_master_requests_cfi_flash_s1;
  output           d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  output  [  7: 0] incoming_tri_state_bridge_flash_data;
  output  [  7: 0] incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  output  [ 22: 0] tri_state_bridge_flash_address;
  inout   [  7: 0] tri_state_bridge_flash_data;
  output           write_n_to_the_cfi_flash;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [  7: 0] cpu_data_master_dbs_write_8;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 27: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  input            reset_n;

  wire    [  4: 0] cfi_flash_s1_counter_load_value;
  wire             cfi_flash_s1_in_a_read_cycle;
  wire             cfi_flash_s1_in_a_write_cycle;
  wire             cfi_flash_s1_pretend_byte_enable;
  reg     [  4: 0] cfi_flash_s1_wait_counter;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             cfi_flash_s1_waits_for_read;
  wire             cfi_flash_s1_waits_for_write;
  wire             cfi_flash_s1_with_write_latency;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_byteenable_cfi_flash_s1;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_0;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_1;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_2;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_3;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_saved_grant_cfi_flash_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_saved_grant_cfi_flash_s1;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [  7: 0] d1_outgoing_tri_state_bridge_flash_data /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [  7: 0] incoming_tri_state_bridge_flash_data /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_tri_state_bridge_flash_data_bit_0_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_1_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_2_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_3_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_4_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_5_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_6_is_x;
  wire             incoming_tri_state_bridge_flash_data_bit_7_is_x;
  wire    [  7: 0] incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;
  reg              last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
  wire    [  7: 0] outgoing_tri_state_bridge_flash_data;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             p1_read_n_to_the_cfi_flash;
  wire             p1_select_n_to_the_cfi_flash;
  wire    [ 22: 0] p1_tri_state_bridge_flash_address;
  wire             p1_write_n_to_the_cfi_flash;
  reg              read_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              select_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  reg     [ 22: 0] tri_state_bridge_flash_address /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             tri_state_bridge_flash_avalon_slave_allgrants;
  wire             tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle;
  wire             tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant;
  wire             tri_state_bridge_flash_avalon_slave_any_continuerequest;
  reg     [  1: 0] tri_state_bridge_flash_avalon_slave_arb_addend;
  wire             tri_state_bridge_flash_avalon_slave_arb_counter_enable;
  reg     [  2: 0] tri_state_bridge_flash_avalon_slave_arb_share_counter;
  wire    [  2: 0] tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] tri_state_bridge_flash_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_arb_winner;
  wire             tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal;
  wire             tri_state_bridge_flash_avalon_slave_beginbursttransfer_internal;
  wire             tri_state_bridge_flash_avalon_slave_begins_xfer;
  wire    [  3: 0] tri_state_bridge_flash_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_chosen_master_rot_left;
  wire             tri_state_bridge_flash_avalon_slave_end_xfer;
  wire             tri_state_bridge_flash_avalon_slave_firsttransfer;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_grant_vector;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_master_qreq_vector;
  wire             tri_state_bridge_flash_avalon_slave_non_bursting_master_requests;
  wire             tri_state_bridge_flash_avalon_slave_read_pending;
  reg              tri_state_bridge_flash_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector;
  reg              tri_state_bridge_flash_avalon_slave_slavearbiterlockenable;
  wire             tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2;
  wire             tri_state_bridge_flash_avalon_slave_unreg_firsttransfer;
  wire             tri_state_bridge_flash_avalon_slave_write_pending;
  wire    [  7: 0] tri_state_bridge_flash_data;
  wire             wait_for_cfi_flash_s1_counter;
  reg              write_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tri_state_bridge_flash_avalon_slave_end_xfer;
    end


  assign tri_state_bridge_flash_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1));
  assign cpu_data_master_requests_cfi_flash_s1 = ({cpu_data_master_address_to_slave[27 : 23] , 23'b0} == 28'h9800000) & (cpu_data_master_read | cpu_data_master_write);
  //~select_n_to_the_cfi_flash of type chipselect to ~p1_select_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_cfi_flash <= ~0;
      else 
        select_n_to_the_cfi_flash <= p1_select_n_to_the_cfi_flash;
    end


  assign tri_state_bridge_flash_avalon_slave_write_pending = 0;
  //tri_state_bridge_flash/avalon_slave read pending calc, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_read_pending = 0;

  //tri_state_bridge_flash_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_arb_share_set_values = (cpu_data_master_granted_cfi_flash_s1)? 4 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 4 :
    (cpu_data_master_granted_cfi_flash_s1)? 4 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 4 :
    1;

  //tri_state_bridge_flash_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1 |
    cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1;

  //tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant = 0;

  //tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value = tri_state_bridge_flash_avalon_slave_firsttransfer ? (tri_state_bridge_flash_avalon_slave_arb_share_set_values - 1) : |tri_state_bridge_flash_avalon_slave_arb_share_counter ? (tri_state_bridge_flash_avalon_slave_arb_share_counter - 1) : 0;

  //tri_state_bridge_flash_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_allgrants = (|tri_state_bridge_flash_avalon_slave_grant_vector) |
    (|tri_state_bridge_flash_avalon_slave_grant_vector) |
    (|tri_state_bridge_flash_avalon_slave_grant_vector) |
    (|tri_state_bridge_flash_avalon_slave_grant_vector);

  //tri_state_bridge_flash_avalon_slave_end_xfer assignment, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_end_xfer = ~(cfi_flash_s1_waits_for_read | cfi_flash_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave = tri_state_bridge_flash_avalon_slave_end_xfer & (~tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tri_state_bridge_flash_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave & tri_state_bridge_flash_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave & ~tri_state_bridge_flash_avalon_slave_non_bursting_master_requests);

  //tri_state_bridge_flash_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_arb_share_counter <= 0;
      else if (tri_state_bridge_flash_avalon_slave_arb_counter_enable)
          tri_state_bridge_flash_avalon_slave_arb_share_counter <= tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;
    end


  //tri_state_bridge_flash_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tri_state_bridge_flash_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave) | (end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave & ~tri_state_bridge_flash_avalon_slave_non_bursting_master_requests))
          tri_state_bridge_flash_avalon_slave_slavearbiterlockenable <= |tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master tri_state_bridge_flash/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 = |tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master tri_state_bridge_flash/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master tri_state_bridge_flash/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master tri_state_bridge_flash/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= cpu_instruction_master_saved_grant_cfi_flash_s1 ? 1 : (tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 & cpu_instruction_master_requests_cfi_flash_s1;

  //tri_state_bridge_flash_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cfi_flash_s1 = cpu_data_master_requests_cfi_flash_s1 & ~((cpu_data_master_read & (tri_state_bridge_flash_avalon_slave_write_pending | (tri_state_bridge_flash_avalon_slave_read_pending) | (2 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | ((tri_state_bridge_flash_avalon_slave_read_pending | !cpu_data_master_byteenable_cfi_flash_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read & ~cfi_flash_s1_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_data_master_read_data_valid_cfi_flash_s1_shift_register, cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1 = cpu_data_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //tri_state_bridge_flash_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_tri_state_bridge_flash_data <= 0;
      else 
        incoming_tri_state_bridge_flash_data <= tri_state_bridge_flash_data;
    end


  //cfi_flash_s1_with_write_latency assignment, which is an e_assign
  assign cfi_flash_s1_with_write_latency = in_a_write_cycle & (cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (cfi_flash_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_tri_state_bridge_flash_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_tri_state_bridge_flash_data <= 0;
      else 
        d1_outgoing_tri_state_bridge_flash_data <= outgoing_tri_state_bridge_flash_data;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_tri_state_bridge_flash_data tristate driver, which is an e_assign
  assign tri_state_bridge_flash_data = (d1_in_a_write_cycle)? d1_outgoing_tri_state_bridge_flash_data:{8{1'bz}};

  //outgoing_tri_state_bridge_flash_data mux, which is an e_mux
  assign outgoing_tri_state_bridge_flash_data = cpu_data_master_dbs_write_8;

  assign cpu_instruction_master_requests_cfi_flash_s1 = (({cpu_instruction_master_address_to_slave[27 : 23] , 23'b0} == 28'h9800000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= cpu_data_master_saved_grant_cfi_flash_s1 ? 1 : (tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 & cpu_data_master_requests_cfi_flash_s1;

  assign cpu_instruction_master_qualified_request_cfi_flash_s1 = cpu_instruction_master_requests_cfi_flash_s1 & ~((cpu_instruction_master_read & (tri_state_bridge_flash_avalon_slave_write_pending | (tri_state_bridge_flash_avalon_slave_read_pending) | (2 < cpu_instruction_master_latency_counter) | (|cpu_instruction_master_read_data_valid_sdram_s1_shift_register))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read & ~cfi_flash_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register, cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1 = cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //allow new arb cycle for tri_state_bridge_flash/avalon_slave, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cfi_flash_s1;

  //cpu/instruction_master grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_granted_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_cfi_flash_s1;

  //cpu/data_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_cfi_flash_s1;

  //cpu/data_master grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_granted_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_saved_grant_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_arb_winner[1] && cpu_data_master_requests_cfi_flash_s1;

  //tri_state_bridge_flash/avalon_slave chosen-master double-vector, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_chosen_master_double_vector = {tri_state_bridge_flash_avalon_slave_master_qreq_vector, tri_state_bridge_flash_avalon_slave_master_qreq_vector} & ({~tri_state_bridge_flash_avalon_slave_master_qreq_vector, ~tri_state_bridge_flash_avalon_slave_master_qreq_vector} + tri_state_bridge_flash_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tri_state_bridge_flash_avalon_slave_arb_winner = (tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle & | tri_state_bridge_flash_avalon_slave_grant_vector) ? tri_state_bridge_flash_avalon_slave_grant_vector : tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector;

  //saved tri_state_bridge_flash_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle)
          tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector <= |tri_state_bridge_flash_avalon_slave_grant_vector ? tri_state_bridge_flash_avalon_slave_grant_vector : tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tri_state_bridge_flash_avalon_slave_grant_vector = {(tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[1] | tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[3]),
    (tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[0] | tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[2])};

  //tri_state_bridge_flash/avalon_slave chosen master rotated left, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_chosen_master_rot_left = (tri_state_bridge_flash_avalon_slave_arb_winner << 1) ? (tri_state_bridge_flash_avalon_slave_arb_winner << 1) : 1;

  //tri_state_bridge_flash/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_arb_addend <= 1;
      else if (|tri_state_bridge_flash_avalon_slave_grant_vector)
          tri_state_bridge_flash_avalon_slave_arb_addend <= tri_state_bridge_flash_avalon_slave_end_xfer? tri_state_bridge_flash_avalon_slave_chosen_master_rot_left : tri_state_bridge_flash_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_cfi_flash = ~(cpu_data_master_granted_cfi_flash_s1 | cpu_instruction_master_granted_cfi_flash_s1);
  //tri_state_bridge_flash_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_firsttransfer = tri_state_bridge_flash_avalon_slave_begins_xfer ? tri_state_bridge_flash_avalon_slave_unreg_firsttransfer : tri_state_bridge_flash_avalon_slave_reg_firsttransfer;

  //tri_state_bridge_flash_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_unreg_firsttransfer = ~(tri_state_bridge_flash_avalon_slave_slavearbiterlockenable & tri_state_bridge_flash_avalon_slave_any_continuerequest);

  //tri_state_bridge_flash_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tri_state_bridge_flash_avalon_slave_begins_xfer)
          tri_state_bridge_flash_avalon_slave_reg_firsttransfer <= tri_state_bridge_flash_avalon_slave_unreg_firsttransfer;
    end


  //tri_state_bridge_flash_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_beginbursttransfer_internal = tri_state_bridge_flash_avalon_slave_begins_xfer;

  //tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal = tri_state_bridge_flash_avalon_slave_begins_xfer & tri_state_bridge_flash_avalon_slave_firsttransfer;

  //~read_n_to_the_cfi_flash of type read to ~p1_read_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_cfi_flash <= ~0;
      else 
        read_n_to_the_cfi_flash <= p1_read_n_to_the_cfi_flash;
    end


  //~p1_read_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_read_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read))& ~tri_state_bridge_flash_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter < 16));

  //~write_n_to_the_cfi_flash of type write to ~p1_write_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_cfi_flash <= ~0;
      else 
        write_n_to_the_cfi_flash <= p1_write_n_to_the_cfi_flash;
    end


  //~p1_write_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_write_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write)) & ~tri_state_bridge_flash_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter >= 6) & (cfi_flash_s1_wait_counter < 22) & cfi_flash_s1_pretend_byte_enable);

  //tri_state_bridge_flash_address of type address to p1_tri_state_bridge_flash_address, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_address <= 0;
      else 
        tri_state_bridge_flash_address <= p1_tri_state_bridge_flash_address;
    end


  //p1_tri_state_bridge_flash_address mux, which is an e_mux
  assign p1_tri_state_bridge_flash_address = (cpu_data_master_granted_cfi_flash_s1)? ({cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1 : 0]}) :
    ({cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1 : 0]});

  //d1_tri_state_bridge_flash_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tri_state_bridge_flash_avalon_slave_end_xfer <= 1;
      else 
        d1_tri_state_bridge_flash_avalon_slave_end_xfer <= tri_state_bridge_flash_avalon_slave_end_xfer;
    end


  //cfi_flash_s1_waits_for_read in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_read = cfi_flash_s1_in_a_read_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_read_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_read_cycle = (cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cfi_flash_s1_in_a_read_cycle;

  //cfi_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_write = cfi_flash_s1_in_a_write_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_write_cycle = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cfi_flash_s1_in_a_write_cycle;

  assign cfi_flash_s1_wait_counter_eq_0 = cfi_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cfi_flash_s1_wait_counter <= 0;
      else 
        cfi_flash_s1_wait_counter <= cfi_flash_s1_counter_load_value;
    end


  assign cfi_flash_s1_counter_load_value = ((cfi_flash_s1_in_a_read_cycle & tri_state_bridge_flash_avalon_slave_begins_xfer))? 20 :
    ((cfi_flash_s1_in_a_write_cycle & tri_state_bridge_flash_avalon_slave_begins_xfer))? 26 :
    (~cfi_flash_s1_wait_counter_eq_0)? cfi_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_cfi_flash_s1_counter = tri_state_bridge_flash_avalon_slave_begins_xfer | ~cfi_flash_s1_wait_counter_eq_0;
  //cfi_flash_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign cfi_flash_s1_pretend_byte_enable = (cpu_data_master_granted_cfi_flash_s1)? cpu_data_master_byteenable_cfi_flash_s1 :
    -1;

  assign {cpu_data_master_byteenable_cfi_flash_s1_segment_3,
cpu_data_master_byteenable_cfi_flash_s1_segment_2,
cpu_data_master_byteenable_cfi_flash_s1_segment_1,
cpu_data_master_byteenable_cfi_flash_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_cfi_flash_s1 = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_byteenable_cfi_flash_s1_segment_0 :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_byteenable_cfi_flash_s1_segment_1 :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_byteenable_cfi_flash_s1_segment_2 :
    cpu_data_master_byteenable_cfi_flash_s1_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_tri_state_bridge_flash_data_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_0_is_x = ^(incoming_tri_state_bridge_flash_data[0]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[0] = incoming_tri_state_bridge_flash_data_bit_0_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[0];

  //incoming_tri_state_bridge_flash_data_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_1_is_x = ^(incoming_tri_state_bridge_flash_data[1]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[1] = incoming_tri_state_bridge_flash_data_bit_1_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[1];

  //incoming_tri_state_bridge_flash_data_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_2_is_x = ^(incoming_tri_state_bridge_flash_data[2]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[2] = incoming_tri_state_bridge_flash_data_bit_2_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[2];

  //incoming_tri_state_bridge_flash_data_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_3_is_x = ^(incoming_tri_state_bridge_flash_data[3]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[3] = incoming_tri_state_bridge_flash_data_bit_3_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[3];

  //incoming_tri_state_bridge_flash_data_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_4_is_x = ^(incoming_tri_state_bridge_flash_data[4]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[4] = incoming_tri_state_bridge_flash_data_bit_4_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[4];

  //incoming_tri_state_bridge_flash_data_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_5_is_x = ^(incoming_tri_state_bridge_flash_data[5]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[5] = incoming_tri_state_bridge_flash_data_bit_5_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[5];

  //incoming_tri_state_bridge_flash_data_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_6_is_x = ^(incoming_tri_state_bridge_flash_data[6]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[6] = incoming_tri_state_bridge_flash_data_bit_6_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[6];

  //incoming_tri_state_bridge_flash_data_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_flash_data_bit_7_is_x = ^(incoming_tri_state_bridge_flash_data[7]) === 1'bx;

  //Crush incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0[7] = incoming_tri_state_bridge_flash_data_bit_7_is_x ? 1'b0 : incoming_tri_state_bridge_flash_data[7];

  //cfi_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cfi_flash_s1 + cpu_instruction_master_granted_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cfi_flash_s1 + cpu_instruction_master_saved_grant_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0 = incoming_tri_state_bridge_flash_data;
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_flash_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_sync_generator_in_arbitrator (
                                            // inputs:
                                             clk,
                                             pixel_converter_out_data,
                                             pixel_converter_out_empty,
                                             pixel_converter_out_endofpacket,
                                             pixel_converter_out_startofpacket,
                                             pixel_converter_out_valid,
                                             reset_n,
                                             video_sync_generator_in_ready,

                                            // outputs:
                                             video_sync_generator_in_data,
                                             video_sync_generator_in_empty,
                                             video_sync_generator_in_endofpacket,
                                             video_sync_generator_in_ready_from_sa,
                                             video_sync_generator_in_reset_n,
                                             video_sync_generator_in_startofpacket,
                                             video_sync_generator_in_valid
                                          )
;

  output  [ 23: 0] video_sync_generator_in_data;
  output           video_sync_generator_in_empty;
  output           video_sync_generator_in_endofpacket;
  output           video_sync_generator_in_ready_from_sa;
  output           video_sync_generator_in_reset_n;
  output           video_sync_generator_in_startofpacket;
  output           video_sync_generator_in_valid;
  input            clk;
  input   [ 23: 0] pixel_converter_out_data;
  input            pixel_converter_out_empty;
  input            pixel_converter_out_endofpacket;
  input            pixel_converter_out_startofpacket;
  input            pixel_converter_out_valid;
  input            reset_n;
  input            video_sync_generator_in_ready;

  wire    [ 23: 0] video_sync_generator_in_data;
  wire             video_sync_generator_in_empty;
  wire             video_sync_generator_in_endofpacket;
  wire             video_sync_generator_in_ready_from_sa;
  wire             video_sync_generator_in_reset_n;
  wire             video_sync_generator_in_startofpacket;
  wire             video_sync_generator_in_valid;
  //mux video_sync_generator_in_data, which is an e_mux
  assign video_sync_generator_in_data = pixel_converter_out_data;

  //mux video_sync_generator_in_empty, which is an e_mux
  assign video_sync_generator_in_empty = pixel_converter_out_empty;

  //mux video_sync_generator_in_endofpacket, which is an e_mux
  assign video_sync_generator_in_endofpacket = pixel_converter_out_endofpacket;

  //assign video_sync_generator_in_ready_from_sa = video_sync_generator_in_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_sync_generator_in_ready_from_sa = video_sync_generator_in_ready;

  //mux video_sync_generator_in_startofpacket, which is an e_mux
  assign video_sync_generator_in_startofpacket = pixel_converter_out_startofpacket;

  //mux video_sync_generator_in_valid, which is an e_mux
  assign video_sync_generator_in_valid = pixel_converter_out_valid;

  //video_sync_generator_in_reset_n assignment, which is an e_assign
  assign video_sync_generator_in_reset_n = reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_simple_reset_clk_sys_domain_synch_module (
                                                       // inputs:
                                                        clk,
                                                        data_in,
                                                        reset_n,

                                                       // outputs:
                                                        data_out
                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_simple_reset_clk_pixel_domain_synch_module (
                                                         // inputs:
                                                          clk,
                                                          data_in,
                                                          reset_n,

                                                         // outputs:
                                                          data_out
                                                       )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_simple_reset_clk_peripheral_domain_synch_module (
                                                              // inputs:
                                                               clk,
                                                               data_in,
                                                               reset_n,

                                                              // outputs:
                                                               data_out
                                                            )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_simple_reset_clk_ext_domain_synch_module (
                                                       // inputs:
                                                        clk,
                                                        data_in,
                                                        reset_n,

                                                       // outputs:
                                                        data_out
                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_simple (
                     // 1) global signals:
                      clk_ext,
                      clk_peripheral,
                      clk_pixel,
                      clk_sdram,
                      clk_sys,
                      reset_n,

                     // the_lcd_i2c_en
                      out_port_from_the_lcd_i2c_en,

                     // the_lcd_i2c_scl
                      out_port_from_the_lcd_i2c_scl,

                     // the_lcd_i2c_sda
                      bidir_port_to_and_from_the_lcd_i2c_sda,

                     // the_pll
                      locked_from_the_pll,
                      phasedone_from_the_pll,

                     // the_sd_card_controller
                      spi_clk_from_the_sd_card_controller,
                      spi_cs_n_from_the_sd_card_controller,
                      spi_data_in_to_the_sd_card_controller,
                      spi_data_out_from_the_sd_card_controller,

                     // the_sdram
                      zs_addr_from_the_sdram,
                      zs_ba_from_the_sdram,
                      zs_cas_n_from_the_sdram,
                      zs_cke_from_the_sdram,
                      zs_cs_n_from_the_sdram,
                      zs_dq_to_and_from_the_sdram,
                      zs_dqm_from_the_sdram,
                      zs_ras_n_from_the_sdram,
                      zs_we_n_from_the_sdram,

                     // the_sram
                      SRAM_ADDR_from_the_sram,
                      SRAM_CE_n_from_the_sram,
                      SRAM_DQ_to_and_from_the_sram,
                      SRAM_LB_n_from_the_sram,
                      SRAM_OE_n_from_the_sram,
                      SRAM_UB_n_from_the_sram,
                      SRAM_WE_n_from_the_sram,

                     // the_touch_panel_busy
                      in_port_to_the_touch_panel_busy,

                     // the_touch_panel_pen_irq_n
                      in_port_to_the_touch_panel_pen_irq_n,

                     // the_touch_panel_spi
                      MISO_to_the_touch_panel_spi,
                      MOSI_from_the_touch_panel_spi,
                      SCLK_from_the_touch_panel_spi,
                      SS_n_from_the_touch_panel_spi,

                     // the_tri_state_bridge_flash_avalon_slave
                      read_n_to_the_cfi_flash,
                      select_n_to_the_cfi_flash,
                      tri_state_bridge_flash_address,
                      tri_state_bridge_flash_data,
                      write_n_to_the_cfi_flash,

                     // the_video_sync_generator
                      DEN_from_the_video_sync_generator,
                      HD_from_the_video_sync_generator,
                      RGB_OUT_from_the_video_sync_generator,
                      VD_from_the_video_sync_generator
                   )
;

  output           DEN_from_the_video_sync_generator;
  output           HD_from_the_video_sync_generator;
  output           MOSI_from_the_touch_panel_spi;
  output  [ 23: 0] RGB_OUT_from_the_video_sync_generator;
  output           SCLK_from_the_touch_panel_spi;
  output  [ 19: 0] SRAM_ADDR_from_the_sram;
  output           SRAM_CE_n_from_the_sram;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  output           SRAM_LB_n_from_the_sram;
  output           SRAM_OE_n_from_the_sram;
  output           SRAM_UB_n_from_the_sram;
  output           SRAM_WE_n_from_the_sram;
  output           SS_n_from_the_touch_panel_spi;
  output           VD_from_the_video_sync_generator;
  inout            bidir_port_to_and_from_the_lcd_i2c_sda;
  output           clk_peripheral;
  output           clk_pixel;
  output           clk_sdram;
  output           clk_sys;
  output           locked_from_the_pll;
  output           out_port_from_the_lcd_i2c_en;
  output           out_port_from_the_lcd_i2c_scl;
  output           phasedone_from_the_pll;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  output           spi_clk_from_the_sd_card_controller;
  output           spi_cs_n_from_the_sd_card_controller;
  output           spi_data_out_from_the_sd_card_controller;
  output  [ 22: 0] tri_state_bridge_flash_address;
  inout   [  7: 0] tri_state_bridge_flash_data;
  output           write_n_to_the_cfi_flash;
  output  [ 12: 0] zs_addr_from_the_sdram;
  output  [  1: 0] zs_ba_from_the_sdram;
  output           zs_cas_n_from_the_sdram;
  output           zs_cke_from_the_sdram;
  output           zs_cs_n_from_the_sdram;
  inout   [ 31: 0] zs_dq_to_and_from_the_sdram;
  output  [  3: 0] zs_dqm_from_the_sdram;
  output           zs_ras_n_from_the_sdram;
  output           zs_we_n_from_the_sdram;
  input            MISO_to_the_touch_panel_spi;
  input            clk_ext;
  input            in_port_to_the_touch_panel_busy;
  input            in_port_to_the_touch_panel_pen_irq_n;
  input            reset_n;
  input            spi_data_in_to_the_sd_card_controller;

  wire             DEN_from_the_video_sync_generator;
  wire             HD_from_the_video_sync_generator;
  wire             MOSI_from_the_touch_panel_spi;
  wire    [ 23: 0] RGB_OUT_from_the_video_sync_generator;
  wire             SCLK_from_the_touch_panel_spi;
  wire    [ 19: 0] SRAM_ADDR_from_the_sram;
  wire             SRAM_CE_n_from_the_sram;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  wire             SRAM_LB_n_from_the_sram;
  wire             SRAM_OE_n_from_the_sram;
  wire             SRAM_UB_n_from_the_sram;
  wire             SRAM_WE_n_from_the_sram;
  wire             SS_n_from_the_touch_panel_spi;
  wire             VD_from_the_video_sync_generator;
  wire             bidir_port_to_and_from_the_lcd_i2c_sda;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             clk_ext_reset_n;
  wire             clk_peripheral;
  wire             clk_peripheral_reset_n;
  wire             clk_pixel;
  wire             clk_pixel_reset_n;
  wire             clk_sdram;
  wire             clk_sys;
  wire             clk_sys_reset_n;
  wire    [ 27: 0] cpu_data_master_address;
  wire    [ 27: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_byteenable_cfi_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_descriptor_mem_s1;
  wire             cpu_data_master_granted_fifo_in_csr;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_nios_simple_clock_0_in;
  wire             cpu_data_master_granted_peripheral_bridge_s1;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_granted_sgdma_pixel_csr;
  wire             cpu_data_master_granted_sram_avalon_slave;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire    [ 31: 0] cpu_data_master_irq;
  wire    [  1: 0] cpu_data_master_latency_counter;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_descriptor_mem_s1;
  wire             cpu_data_master_qualified_request_fifo_in_csr;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_nios_simple_clock_0_in;
  wire             cpu_data_master_qualified_request_peripheral_bridge_s1;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_qualified_request_sgdma_pixel_csr;
  wire             cpu_data_master_qualified_request_sram_avalon_slave;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_descriptor_mem_s1;
  wire             cpu_data_master_read_data_valid_fifo_in_csr;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_nios_simple_clock_0_in;
  wire             cpu_data_master_read_data_valid_peripheral_bridge_s1;
  wire             cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_read_data_valid_sgdma_pixel_csr;
  wire             cpu_data_master_read_data_valid_sram_avalon_slave;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_descriptor_mem_s1;
  wire             cpu_data_master_requests_fifo_in_csr;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_nios_simple_clock_0_in;
  wire             cpu_data_master_requests_peripheral_bridge_s1;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_requests_sgdma_pixel_csr;
  wire             cpu_data_master_requests_sram_avalon_slave;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 27: 0] cpu_instruction_master_address;
  wire    [ 27: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_sdram_s1;
  wire             cpu_instruction_master_granted_sram_avalon_slave;
  wire    [  1: 0] cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_sdram_s1;
  wire             cpu_instruction_master_qualified_request_sram_avalon_slave;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_sram_avalon_slave;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_sdram_s1;
  wire             cpu_instruction_master_requests_sram_avalon_slave;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_descriptor_mem_s1_end_xfer;
  wire             d1_fifo_in_csr_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_lcd_i2c_en_s1_end_xfer;
  wire             d1_lcd_i2c_scl_s1_end_xfer;
  wire             d1_lcd_i2c_sda_s1_end_xfer;
  wire             d1_nios_simple_clock_0_in_end_xfer;
  wire             d1_peripheral_bridge_s1_end_xfer;
  wire             d1_pll_pll_slave_end_xfer;
  wire             d1_sd_card_controller_avalon_slave_end_xfer;
  wire             d1_sdram_s1_end_xfer;
  wire             d1_sgdma_pixel_csr_end_xfer;
  wire             d1_sram_avalon_slave_end_xfer;
  wire             d1_sys_clk_timer_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_touch_panel_busy_s1_end_xfer;
  wire             d1_touch_panel_pen_irq_n_s1_end_xfer;
  wire             d1_touch_panel_spi_spi_control_port_end_xfer;
  wire             d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  wire    [ 13: 0] descriptor_mem_s1_address;
  wire    [  3: 0] descriptor_mem_s1_byteenable;
  wire             descriptor_mem_s1_chipselect;
  wire             descriptor_mem_s1_clken;
  wire    [ 31: 0] descriptor_mem_s1_readdata;
  wire    [ 31: 0] descriptor_mem_s1_readdata_from_sa;
  wire             descriptor_mem_s1_reset;
  wire             descriptor_mem_s1_write;
  wire    [ 31: 0] descriptor_mem_s1_writedata;
  wire    [  2: 0] fifo_in_csr_address;
  wire             fifo_in_csr_irq;
  wire             fifo_in_csr_irq_from_sa;
  wire             fifo_in_csr_read;
  wire    [ 31: 0] fifo_in_csr_readdata;
  wire    [ 31: 0] fifo_in_csr_readdata_from_sa;
  wire             fifo_in_csr_write;
  wire    [ 31: 0] fifo_in_csr_writedata;
  wire    [ 31: 0] fifo_in_data;
  wire    [  1: 0] fifo_in_empty;
  wire             fifo_in_endofpacket;
  wire             fifo_in_ready;
  wire             fifo_in_ready_from_sa;
  wire             fifo_in_reset_n;
  wire             fifo_in_startofpacket;
  wire             fifo_in_valid;
  wire    [ 31: 0] fifo_out_data;
  wire    [  1: 0] fifo_out_empty;
  wire             fifo_out_endofpacket;
  wire             fifo_out_ready;
  wire             fifo_out_reset_n;
  wire             fifo_out_startofpacket;
  wire             fifo_out_valid;
  wire    [ 31: 0] fifo_to_pixel_converter_in_data;
  wire    [  1: 0] fifo_to_pixel_converter_in_empty;
  wire             fifo_to_pixel_converter_in_endofpacket;
  wire             fifo_to_pixel_converter_in_ready;
  wire             fifo_to_pixel_converter_in_ready_from_sa;
  wire             fifo_to_pixel_converter_in_reset_n;
  wire             fifo_to_pixel_converter_in_startofpacket;
  wire             fifo_to_pixel_converter_in_valid;
  wire    [ 31: 0] fifo_to_pixel_converter_out_data;
  wire    [  1: 0] fifo_to_pixel_converter_out_empty;
  wire             fifo_to_pixel_converter_out_endofpacket;
  wire             fifo_to_pixel_converter_out_ready;
  wire             fifo_to_pixel_converter_out_startofpacket;
  wire             fifo_to_pixel_converter_out_valid;
  wire    [  7: 0] incoming_tri_state_bridge_flash_data;
  wire    [  7: 0] incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [  1: 0] lcd_i2c_en_s1_address;
  wire             lcd_i2c_en_s1_chipselect;
  wire             lcd_i2c_en_s1_readdata;
  wire             lcd_i2c_en_s1_readdata_from_sa;
  wire             lcd_i2c_en_s1_reset_n;
  wire             lcd_i2c_en_s1_write_n;
  wire             lcd_i2c_en_s1_writedata;
  wire    [  1: 0] lcd_i2c_scl_s1_address;
  wire             lcd_i2c_scl_s1_chipselect;
  wire             lcd_i2c_scl_s1_readdata;
  wire             lcd_i2c_scl_s1_readdata_from_sa;
  wire             lcd_i2c_scl_s1_reset_n;
  wire             lcd_i2c_scl_s1_write_n;
  wire             lcd_i2c_scl_s1_writedata;
  wire    [  1: 0] lcd_i2c_sda_s1_address;
  wire             lcd_i2c_sda_s1_chipselect;
  wire             lcd_i2c_sda_s1_readdata;
  wire             lcd_i2c_sda_s1_readdata_from_sa;
  wire             lcd_i2c_sda_s1_reset_n;
  wire             lcd_i2c_sda_s1_write_n;
  wire             lcd_i2c_sda_s1_writedata;
  wire             locked_from_the_pll;
  wire    [  3: 0] nios_simple_clock_0_in_address;
  wire    [  3: 0] nios_simple_clock_0_in_byteenable;
  wire             nios_simple_clock_0_in_endofpacket;
  wire             nios_simple_clock_0_in_endofpacket_from_sa;
  wire    [  1: 0] nios_simple_clock_0_in_nativeaddress;
  wire             nios_simple_clock_0_in_read;
  wire    [ 31: 0] nios_simple_clock_0_in_readdata;
  wire    [ 31: 0] nios_simple_clock_0_in_readdata_from_sa;
  wire             nios_simple_clock_0_in_reset_n;
  wire             nios_simple_clock_0_in_waitrequest;
  wire             nios_simple_clock_0_in_waitrequest_from_sa;
  wire             nios_simple_clock_0_in_write;
  wire    [ 31: 0] nios_simple_clock_0_in_writedata;
  wire    [  3: 0] nios_simple_clock_0_out_address;
  wire    [  3: 0] nios_simple_clock_0_out_address_to_slave;
  wire    [  3: 0] nios_simple_clock_0_out_byteenable;
  wire             nios_simple_clock_0_out_endofpacket;
  wire             nios_simple_clock_0_out_granted_pll_pll_slave;
  wire    [  1: 0] nios_simple_clock_0_out_nativeaddress;
  wire             nios_simple_clock_0_out_qualified_request_pll_pll_slave;
  wire             nios_simple_clock_0_out_read;
  wire             nios_simple_clock_0_out_read_data_valid_pll_pll_slave;
  wire    [ 31: 0] nios_simple_clock_0_out_readdata;
  wire             nios_simple_clock_0_out_requests_pll_pll_slave;
  wire             nios_simple_clock_0_out_reset_n;
  wire             nios_simple_clock_0_out_waitrequest;
  wire             nios_simple_clock_0_out_write;
  wire    [ 31: 0] nios_simple_clock_0_out_writedata;
  wire             out_clk_pll_c0;
  wire             out_clk_pll_c1;
  wire             out_clk_pll_c2;
  wire             out_clk_pll_c3;
  wire             out_port_from_the_lcd_i2c_en;
  wire             out_port_from_the_lcd_i2c_scl;
  wire    [ 10: 0] peripheral_bridge_m1_address;
  wire    [ 10: 0] peripheral_bridge_m1_address_to_slave;
  wire    [  3: 0] peripheral_bridge_m1_byteenable;
  wire             peripheral_bridge_m1_endofpacket;
  wire             peripheral_bridge_m1_granted_lcd_i2c_en_s1;
  wire             peripheral_bridge_m1_granted_lcd_i2c_scl_s1;
  wire             peripheral_bridge_m1_granted_lcd_i2c_sda_s1;
  wire             peripheral_bridge_m1_granted_sd_card_controller_avalon_slave;
  wire             peripheral_bridge_m1_granted_sys_clk_timer_s1;
  wire             peripheral_bridge_m1_granted_touch_panel_busy_s1;
  wire             peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1;
  wire             peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port;
  wire             peripheral_bridge_m1_latency_counter;
  wire    [  8: 0] peripheral_bridge_m1_nativeaddress;
  wire             peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1;
  wire             peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1;
  wire             peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1;
  wire             peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave;
  wire             peripheral_bridge_m1_qualified_request_sys_clk_timer_s1;
  wire             peripheral_bridge_m1_qualified_request_touch_panel_busy_s1;
  wire             peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1;
  wire             peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port;
  wire             peripheral_bridge_m1_read;
  wire             peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1;
  wire             peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1;
  wire             peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1;
  wire             peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave;
  wire             peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1;
  wire             peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1;
  wire             peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1;
  wire             peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port;
  wire    [ 31: 0] peripheral_bridge_m1_readdata;
  wire             peripheral_bridge_m1_readdatavalid;
  wire             peripheral_bridge_m1_requests_lcd_i2c_en_s1;
  wire             peripheral_bridge_m1_requests_lcd_i2c_scl_s1;
  wire             peripheral_bridge_m1_requests_lcd_i2c_sda_s1;
  wire             peripheral_bridge_m1_requests_sd_card_controller_avalon_slave;
  wire             peripheral_bridge_m1_requests_sys_clk_timer_s1;
  wire             peripheral_bridge_m1_requests_touch_panel_busy_s1;
  wire             peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1;
  wire             peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port;
  wire             peripheral_bridge_m1_reset_n;
  wire             peripheral_bridge_m1_waitrequest;
  wire             peripheral_bridge_m1_write;
  wire    [ 31: 0] peripheral_bridge_m1_writedata;
  wire    [  8: 0] peripheral_bridge_s1_address;
  wire    [  3: 0] peripheral_bridge_s1_byteenable;
  wire             peripheral_bridge_s1_endofpacket;
  wire             peripheral_bridge_s1_endofpacket_from_sa;
  wire    [  8: 0] peripheral_bridge_s1_nativeaddress;
  wire             peripheral_bridge_s1_read;
  wire    [ 31: 0] peripheral_bridge_s1_readdata;
  wire    [ 31: 0] peripheral_bridge_s1_readdata_from_sa;
  wire             peripheral_bridge_s1_readdatavalid;
  wire             peripheral_bridge_s1_reset_n;
  wire             peripheral_bridge_s1_waitrequest;
  wire             peripheral_bridge_s1_waitrequest_from_sa;
  wire             peripheral_bridge_s1_write;
  wire    [ 31: 0] peripheral_bridge_s1_writedata;
  wire             phasedone_from_the_pll;
  wire    [ 31: 0] pixel_converter_in_data;
  wire    [  1: 0] pixel_converter_in_empty;
  wire             pixel_converter_in_endofpacket;
  wire             pixel_converter_in_ready;
  wire             pixel_converter_in_ready_from_sa;
  wire             pixel_converter_in_reset_n;
  wire             pixel_converter_in_startofpacket;
  wire             pixel_converter_in_valid;
  wire    [ 23: 0] pixel_converter_out_data;
  wire             pixel_converter_out_empty;
  wire             pixel_converter_out_endofpacket;
  wire             pixel_converter_out_ready;
  wire             pixel_converter_out_startofpacket;
  wire             pixel_converter_out_valid;
  wire    [  1: 0] pll_pll_slave_address;
  wire             pll_pll_slave_read;
  wire    [ 31: 0] pll_pll_slave_readdata;
  wire    [ 31: 0] pll_pll_slave_readdata_from_sa;
  wire             pll_pll_slave_reset;
  wire             pll_pll_slave_write;
  wire    [ 31: 0] pll_pll_slave_writedata;
  wire             read_n_to_the_cfi_flash;
  wire             reset_n_sources;
  wire    [  7: 0] sd_card_controller_avalon_slave_address;
  wire    [  3: 0] sd_card_controller_avalon_slave_byteenable;
  wire             sd_card_controller_avalon_slave_chipselect;
  wire             sd_card_controller_avalon_slave_read;
  wire    [ 31: 0] sd_card_controller_avalon_slave_readdata;
  wire    [ 31: 0] sd_card_controller_avalon_slave_readdata_from_sa;
  wire             sd_card_controller_avalon_slave_reset_n;
  wire             sd_card_controller_avalon_slave_write;
  wire    [ 31: 0] sd_card_controller_avalon_slave_writedata;
  wire    [ 24: 0] sdram_s1_address;
  wire    [  3: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire             sdram_s1_read_n;
  wire    [ 31: 0] sdram_s1_readdata;
  wire    [ 31: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid;
  wire             sdram_s1_reset_n;
  wire             sdram_s1_waitrequest;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_write_n;
  wire    [ 31: 0] sdram_s1_writedata;
  wire             select_n_to_the_cfi_flash;
  wire    [  3: 0] sgdma_pixel_csr_address;
  wire             sgdma_pixel_csr_chipselect;
  wire             sgdma_pixel_csr_irq;
  wire             sgdma_pixel_csr_irq_from_sa;
  wire             sgdma_pixel_csr_read;
  wire    [ 31: 0] sgdma_pixel_csr_readdata;
  wire    [ 31: 0] sgdma_pixel_csr_readdata_from_sa;
  wire             sgdma_pixel_csr_reset_n;
  wire             sgdma_pixel_csr_write;
  wire    [ 31: 0] sgdma_pixel_csr_writedata;
  wire    [ 31: 0] sgdma_pixel_descriptor_read_address;
  wire    [ 31: 0] sgdma_pixel_descriptor_read_address_to_slave;
  wire             sgdma_pixel_descriptor_read_granted_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_read_latency_counter;
  wire             sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_read_read;
  wire             sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1;
  wire    [ 31: 0] sgdma_pixel_descriptor_read_readdata;
  wire             sgdma_pixel_descriptor_read_readdatavalid;
  wire             sgdma_pixel_descriptor_read_requests_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_read_waitrequest;
  wire    [ 31: 0] sgdma_pixel_descriptor_write_address;
  wire    [ 31: 0] sgdma_pixel_descriptor_write_address_to_slave;
  wire             sgdma_pixel_descriptor_write_granted_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_write_requests_descriptor_mem_s1;
  wire             sgdma_pixel_descriptor_write_waitrequest;
  wire             sgdma_pixel_descriptor_write_write;
  wire    [ 31: 0] sgdma_pixel_descriptor_write_writedata;
  wire    [ 31: 0] sgdma_pixel_m_read_address;
  wire    [ 31: 0] sgdma_pixel_m_read_address_to_slave;
  wire             sgdma_pixel_m_read_granted_sdram_s1;
  wire             sgdma_pixel_m_read_latency_counter;
  wire             sgdma_pixel_m_read_qualified_request_sdram_s1;
  wire             sgdma_pixel_m_read_read;
  wire             sgdma_pixel_m_read_read_data_valid_sdram_s1;
  wire             sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register;
  wire    [ 31: 0] sgdma_pixel_m_read_readdata;
  wire             sgdma_pixel_m_read_readdatavalid;
  wire             sgdma_pixel_m_read_requests_sdram_s1;
  wire             sgdma_pixel_m_read_waitrequest;
  wire    [ 31: 0] sgdma_pixel_out_data;
  wire    [  1: 0] sgdma_pixel_out_empty;
  wire             sgdma_pixel_out_endofpacket;
  wire             sgdma_pixel_out_ready;
  wire             sgdma_pixel_out_startofpacket;
  wire             sgdma_pixel_out_valid;
  wire             spi_clk_from_the_sd_card_controller;
  wire             spi_cs_n_from_the_sd_card_controller;
  wire             spi_data_out_from_the_sd_card_controller;
  wire    [ 19: 0] sram_avalon_slave_address;
  wire    [  1: 0] sram_avalon_slave_byteenable_n;
  wire             sram_avalon_slave_chipselect_n;
  wire             sram_avalon_slave_read_n;
  wire    [ 15: 0] sram_avalon_slave_readdata;
  wire    [ 15: 0] sram_avalon_slave_readdata_from_sa;
  wire             sram_avalon_slave_reset_n;
  wire             sram_avalon_slave_wait_counter_eq_0;
  wire             sram_avalon_slave_write_n;
  wire    [ 15: 0] sram_avalon_slave_writedata;
  wire    [  2: 0] sys_clk_timer_s1_address;
  wire             sys_clk_timer_s1_chipselect;
  wire             sys_clk_timer_s1_irq;
  wire             sys_clk_timer_s1_irq_from_sa;
  wire    [ 15: 0] sys_clk_timer_s1_readdata;
  wire    [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  wire             sys_clk_timer_s1_reset_n;
  wire             sys_clk_timer_s1_write_n;
  wire    [ 15: 0] sys_clk_timer_s1_writedata;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [ 31: 0] timing_adapter_in_data;
  wire    [  1: 0] timing_adapter_in_empty;
  wire             timing_adapter_in_endofpacket;
  wire             timing_adapter_in_ready;
  wire             timing_adapter_in_ready_from_sa;
  wire             timing_adapter_in_reset_n;
  wire             timing_adapter_in_startofpacket;
  wire             timing_adapter_in_valid;
  wire    [ 31: 0] timing_adapter_out_data;
  wire    [  1: 0] timing_adapter_out_empty;
  wire             timing_adapter_out_endofpacket;
  wire             timing_adapter_out_ready;
  wire             timing_adapter_out_startofpacket;
  wire             timing_adapter_out_valid;
  wire    [  1: 0] touch_panel_busy_s1_address;
  wire             touch_panel_busy_s1_readdata;
  wire             touch_panel_busy_s1_readdata_from_sa;
  wire             touch_panel_busy_s1_reset_n;
  wire    [  1: 0] touch_panel_pen_irq_n_s1_address;
  wire             touch_panel_pen_irq_n_s1_chipselect;
  wire             touch_panel_pen_irq_n_s1_irq;
  wire             touch_panel_pen_irq_n_s1_irq_from_sa;
  wire             touch_panel_pen_irq_n_s1_readdata;
  wire             touch_panel_pen_irq_n_s1_readdata_from_sa;
  wire             touch_panel_pen_irq_n_s1_reset_n;
  wire             touch_panel_pen_irq_n_s1_write_n;
  wire             touch_panel_pen_irq_n_s1_writedata;
  wire    [  2: 0] touch_panel_spi_spi_control_port_address;
  wire             touch_panel_spi_spi_control_port_chipselect;
  wire             touch_panel_spi_spi_control_port_dataavailable;
  wire             touch_panel_spi_spi_control_port_dataavailable_from_sa;
  wire             touch_panel_spi_spi_control_port_endofpacket;
  wire             touch_panel_spi_spi_control_port_endofpacket_from_sa;
  wire             touch_panel_spi_spi_control_port_irq;
  wire             touch_panel_spi_spi_control_port_irq_from_sa;
  wire             touch_panel_spi_spi_control_port_read_n;
  wire    [ 15: 0] touch_panel_spi_spi_control_port_readdata;
  wire    [ 15: 0] touch_panel_spi_spi_control_port_readdata_from_sa;
  wire             touch_panel_spi_spi_control_port_readyfordata;
  wire             touch_panel_spi_spi_control_port_readyfordata_from_sa;
  wire             touch_panel_spi_spi_control_port_reset_n;
  wire             touch_panel_spi_spi_control_port_write_n;
  wire    [ 15: 0] touch_panel_spi_spi_control_port_writedata;
  wire    [ 22: 0] tri_state_bridge_flash_address;
  wire    [  7: 0] tri_state_bridge_flash_data;
  wire    [ 23: 0] video_sync_generator_in_data;
  wire             video_sync_generator_in_empty;
  wire             video_sync_generator_in_endofpacket;
  wire             video_sync_generator_in_ready;
  wire             video_sync_generator_in_ready_from_sa;
  wire             video_sync_generator_in_reset_n;
  wire             video_sync_generator_in_startofpacket;
  wire             video_sync_generator_in_valid;
  wire             write_n_to_the_cfi_flash;
  wire    [ 12: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 31: 0] zs_dq_to_and_from_the_sdram;
  wire    [  3: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;
  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                         (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                       (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module             (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module               (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_cpu_jtag_debug_module                      (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                             (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                              (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module      (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                         (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module        (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register      (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_requests_cpu_jtag_debug_module               (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                       (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                                 (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                                    (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                                    (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                                   (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                      (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                              (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                       (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                                  (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                          (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                         (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                     (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                                   (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                             (clk_sys_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .cfi_flash_s1_wait_counter_eq_0                                      (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                 (clk_sys),
      .clk_sys                                                             (clk_sys),
      .clk_sys_reset_n                                                     (clk_sys_reset_n),
      .cpu_data_master_address                                             (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_cfi_flash_s1                             (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_byteenable_sram_avalon_slave                        (cpu_data_master_byteenable_sram_avalon_slave),
      .cpu_data_master_dbs_address                                         (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                        (cpu_data_master_dbs_write_16),
      .cpu_data_master_dbs_write_8                                         (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_cfi_flash_s1                                (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_granted_cpu_jtag_debug_module                       (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_descriptor_mem_s1                           (cpu_data_master_granted_descriptor_mem_s1),
      .cpu_data_master_granted_fifo_in_csr                                 (cpu_data_master_granted_fifo_in_csr),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                 (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_nios_simple_clock_0_in                      (cpu_data_master_granted_nios_simple_clock_0_in),
      .cpu_data_master_granted_peripheral_bridge_s1                        (cpu_data_master_granted_peripheral_bridge_s1),
      .cpu_data_master_granted_sdram_s1                                    (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_granted_sgdma_pixel_csr                             (cpu_data_master_granted_sgdma_pixel_csr),
      .cpu_data_master_granted_sram_avalon_slave                           (cpu_data_master_granted_sram_avalon_slave),
      .cpu_data_master_granted_sysid_control_slave                         (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_irq                                                 (cpu_data_master_irq),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cfi_flash_s1                      (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module             (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_descriptor_mem_s1                 (cpu_data_master_qualified_request_descriptor_mem_s1),
      .cpu_data_master_qualified_request_fifo_in_csr                       (cpu_data_master_qualified_request_fifo_in_csr),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave       (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_nios_simple_clock_0_in            (cpu_data_master_qualified_request_nios_simple_clock_0_in),
      .cpu_data_master_qualified_request_peripheral_bridge_s1              (cpu_data_master_qualified_request_peripheral_bridge_s1),
      .cpu_data_master_qualified_request_sdram_s1                          (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_qualified_request_sgdma_pixel_csr                   (cpu_data_master_qualified_request_sgdma_pixel_csr),
      .cpu_data_master_qualified_request_sram_avalon_slave                 (cpu_data_master_qualified_request_sram_avalon_slave),
      .cpu_data_master_qualified_request_sysid_control_slave               (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cfi_flash_s1                        (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module               (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_descriptor_mem_s1                   (cpu_data_master_read_data_valid_descriptor_mem_s1),
      .cpu_data_master_read_data_valid_fifo_in_csr                         (cpu_data_master_read_data_valid_fifo_in_csr),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave         (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_nios_simple_clock_0_in              (cpu_data_master_read_data_valid_nios_simple_clock_0_in),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1                (cpu_data_master_read_data_valid_peripheral_bridge_s1),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1                            (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_sgdma_pixel_csr                     (cpu_data_master_read_data_valid_sgdma_pixel_csr),
      .cpu_data_master_read_data_valid_sram_avalon_slave                   (cpu_data_master_read_data_valid_sram_avalon_slave),
      .cpu_data_master_read_data_valid_sysid_control_slave                 (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_readdata                                            (cpu_data_master_readdata),
      .cpu_data_master_readdatavalid                                       (cpu_data_master_readdatavalid),
      .cpu_data_master_requests_cfi_flash_s1                               (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_requests_cpu_jtag_debug_module                      (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_descriptor_mem_s1                          (cpu_data_master_requests_descriptor_mem_s1),
      .cpu_data_master_requests_fifo_in_csr                                (cpu_data_master_requests_fifo_in_csr),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_nios_simple_clock_0_in                     (cpu_data_master_requests_nios_simple_clock_0_in),
      .cpu_data_master_requests_peripheral_bridge_s1                       (cpu_data_master_requests_peripheral_bridge_s1),
      .cpu_data_master_requests_sdram_s1                                   (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_requests_sgdma_pixel_csr                            (cpu_data_master_requests_sgdma_pixel_csr),
      .cpu_data_master_requests_sram_avalon_slave                          (cpu_data_master_requests_sram_avalon_slave),
      .cpu_data_master_requests_sysid_control_slave                        (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_waitrequest                                         (cpu_data_master_waitrequest),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                              (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                                   (d1_cpu_jtag_debug_module_end_xfer),
      .d1_descriptor_mem_s1_end_xfer                                       (d1_descriptor_mem_s1_end_xfer),
      .d1_fifo_in_csr_end_xfer                                             (d1_fifo_in_csr_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                             (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_nios_simple_clock_0_in_end_xfer                                  (d1_nios_simple_clock_0_in_end_xfer),
      .d1_peripheral_bridge_s1_end_xfer                                    (d1_peripheral_bridge_s1_end_xfer),
      .d1_sdram_s1_end_xfer                                                (d1_sdram_s1_end_xfer),
      .d1_sgdma_pixel_csr_end_xfer                                         (d1_sgdma_pixel_csr_end_xfer),
      .d1_sram_avalon_slave_end_xfer                                       (d1_sram_avalon_slave_end_xfer),
      .d1_sysid_control_slave_end_xfer                                     (d1_sysid_control_slave_end_xfer),
      .d1_tri_state_bridge_flash_avalon_slave_end_xfer                     (d1_tri_state_bridge_flash_avalon_slave_end_xfer),
      .descriptor_mem_s1_readdata_from_sa                                  (descriptor_mem_s1_readdata_from_sa),
      .fifo_in_csr_irq_from_sa                                             (fifo_in_csr_irq_from_sa),
      .fifo_in_csr_readdata_from_sa                                        (fifo_in_csr_readdata_from_sa),
      .incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0         (incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                             (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                        (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                     (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .nios_simple_clock_0_in_readdata_from_sa                             (nios_simple_clock_0_in_readdata_from_sa),
      .nios_simple_clock_0_in_waitrequest_from_sa                          (nios_simple_clock_0_in_waitrequest_from_sa),
      .peripheral_bridge_s1_readdata_from_sa                               (peripheral_bridge_s1_readdata_from_sa),
      .peripheral_bridge_s1_waitrequest_from_sa                            (peripheral_bridge_s1_waitrequest_from_sa),
      .reset_n                                                             (clk_sys_reset_n),
      .sdram_s1_readdata_from_sa                                           (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                        (sdram_s1_waitrequest_from_sa),
      .sgdma_pixel_csr_irq_from_sa                                         (sgdma_pixel_csr_irq_from_sa),
      .sgdma_pixel_csr_readdata_from_sa                                    (sgdma_pixel_csr_readdata_from_sa),
      .sram_avalon_slave_readdata_from_sa                                  (sram_avalon_slave_readdata_from_sa),
      .sram_avalon_slave_wait_counter_eq_0                                 (sram_avalon_slave_wait_counter_eq_0),
      .sys_clk_timer_s1_irq_from_sa                                        (sys_clk_timer_s1_irq_from_sa),
      .sysid_control_slave_readdata_from_sa                                (sysid_control_slave_readdata_from_sa),
      .touch_panel_pen_irq_n_s1_irq_from_sa                                (touch_panel_pen_irq_n_s1_irq_from_sa),
      .touch_panel_spi_spi_control_port_irq_from_sa                        (touch_panel_spi_spi_control_port_irq_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .cfi_flash_s1_wait_counter_eq_0                                 (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                            (clk_sys),
      .cpu_instruction_master_address                                 (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                    (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_sdram_s1                        (cpu_instruction_master_granted_sdram_s1),
      .cpu_instruction_master_granted_sram_avalon_slave               (cpu_instruction_master_granted_sram_avalon_slave),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cfi_flash_s1          (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_sdram_s1              (cpu_instruction_master_qualified_request_sdram_s1),
      .cpu_instruction_master_qualified_request_sram_avalon_slave     (cpu_instruction_master_qualified_request_sram_avalon_slave),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1            (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_sdram_s1                (cpu_instruction_master_read_data_valid_sdram_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_read_data_valid_sram_avalon_slave       (cpu_instruction_master_read_data_valid_sram_avalon_slave),
      .cpu_instruction_master_readdata                                (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                           (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_cfi_flash_s1                   (cpu_instruction_master_requests_cfi_flash_s1),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_sdram_s1                       (cpu_instruction_master_requests_sdram_s1),
      .cpu_instruction_master_requests_sram_avalon_slave              (cpu_instruction_master_requests_sram_avalon_slave),
      .cpu_instruction_master_waitrequest                             (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_sdram_s1_end_xfer                                           (d1_sdram_s1_end_xfer),
      .d1_sram_avalon_slave_end_xfer                                  (d1_sram_avalon_slave_end_xfer),
      .d1_tri_state_bridge_flash_avalon_slave_end_xfer                (d1_tri_state_bridge_flash_avalon_slave_end_xfer),
      .incoming_tri_state_bridge_flash_data                           (incoming_tri_state_bridge_flash_data),
      .reset_n                                                        (clk_sys_reset_n),
      .sdram_s1_readdata_from_sa                                      (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                   (sdram_s1_waitrequest_from_sa),
      .sram_avalon_slave_readdata_from_sa                             (sram_avalon_slave_readdata_from_sa),
      .sram_avalon_slave_wait_counter_eq_0                            (sram_avalon_slave_wait_counter_eq_0)
    );

  cpu the_cpu
    (
      .clk                                   (clk_sys),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_readdatavalid                       (cpu_data_master_readdatavalid),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  descriptor_mem_s1_arbitrator the_descriptor_mem_s1
    (
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_granted_descriptor_mem_s1                           (cpu_data_master_granted_descriptor_mem_s1),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_descriptor_mem_s1                 (cpu_data_master_qualified_request_descriptor_mem_s1),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_descriptor_mem_s1                   (cpu_data_master_read_data_valid_descriptor_mem_s1),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_descriptor_mem_s1                          (cpu_data_master_requests_descriptor_mem_s1),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_descriptor_mem_s1_end_xfer                                       (d1_descriptor_mem_s1_end_xfer),
      .descriptor_mem_s1_address                                           (descriptor_mem_s1_address),
      .descriptor_mem_s1_byteenable                                        (descriptor_mem_s1_byteenable),
      .descriptor_mem_s1_chipselect                                        (descriptor_mem_s1_chipselect),
      .descriptor_mem_s1_clken                                             (descriptor_mem_s1_clken),
      .descriptor_mem_s1_readdata                                          (descriptor_mem_s1_readdata),
      .descriptor_mem_s1_readdata_from_sa                                  (descriptor_mem_s1_readdata_from_sa),
      .descriptor_mem_s1_reset                                             (descriptor_mem_s1_reset),
      .descriptor_mem_s1_write                                             (descriptor_mem_s1_write),
      .descriptor_mem_s1_writedata                                         (descriptor_mem_s1_writedata),
      .reset_n                                                             (clk_sys_reset_n),
      .sgdma_pixel_descriptor_read_address_to_slave                        (sgdma_pixel_descriptor_read_address_to_slave),
      .sgdma_pixel_descriptor_read_granted_descriptor_mem_s1               (sgdma_pixel_descriptor_read_granted_descriptor_mem_s1),
      .sgdma_pixel_descriptor_read_latency_counter                         (sgdma_pixel_descriptor_read_latency_counter),
      .sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1     (sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1),
      .sgdma_pixel_descriptor_read_read                                    (sgdma_pixel_descriptor_read_read),
      .sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1       (sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1),
      .sgdma_pixel_descriptor_read_requests_descriptor_mem_s1              (sgdma_pixel_descriptor_read_requests_descriptor_mem_s1),
      .sgdma_pixel_descriptor_write_address_to_slave                       (sgdma_pixel_descriptor_write_address_to_slave),
      .sgdma_pixel_descriptor_write_granted_descriptor_mem_s1              (sgdma_pixel_descriptor_write_granted_descriptor_mem_s1),
      .sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1    (sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1),
      .sgdma_pixel_descriptor_write_requests_descriptor_mem_s1             (sgdma_pixel_descriptor_write_requests_descriptor_mem_s1),
      .sgdma_pixel_descriptor_write_write                                  (sgdma_pixel_descriptor_write_write),
      .sgdma_pixel_descriptor_write_writedata                              (sgdma_pixel_descriptor_write_writedata)
    );

  descriptor_mem the_descriptor_mem
    (
      .address    (descriptor_mem_s1_address),
      .byteenable (descriptor_mem_s1_byteenable),
      .chipselect (descriptor_mem_s1_chipselect),
      .clk        (clk_sys),
      .clken      (descriptor_mem_s1_clken),
      .readdata   (descriptor_mem_s1_readdata),
      .reset      (descriptor_mem_s1_reset),
      .write      (descriptor_mem_s1_write),
      .writedata  (descriptor_mem_s1_writedata)
    );

  fifo_in_arbitrator the_fifo_in
    (
      .clk                              (clk_sys),
      .fifo_in_data                     (fifo_in_data),
      .fifo_in_empty                    (fifo_in_empty),
      .fifo_in_endofpacket              (fifo_in_endofpacket),
      .fifo_in_ready                    (fifo_in_ready),
      .fifo_in_ready_from_sa            (fifo_in_ready_from_sa),
      .fifo_in_reset_n                  (fifo_in_reset_n),
      .fifo_in_startofpacket            (fifo_in_startofpacket),
      .fifo_in_valid                    (fifo_in_valid),
      .reset_n                          (clk_sys_reset_n),
      .timing_adapter_out_data          (timing_adapter_out_data),
      .timing_adapter_out_empty         (timing_adapter_out_empty),
      .timing_adapter_out_endofpacket   (timing_adapter_out_endofpacket),
      .timing_adapter_out_startofpacket (timing_adapter_out_startofpacket),
      .timing_adapter_out_valid         (timing_adapter_out_valid)
    );

  fifo_in_csr_arbitrator the_fifo_in_csr
    (
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_fifo_in_csr                                 (cpu_data_master_granted_fifo_in_csr),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_fifo_in_csr                       (cpu_data_master_qualified_request_fifo_in_csr),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_fifo_in_csr                         (cpu_data_master_read_data_valid_fifo_in_csr),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_fifo_in_csr                                (cpu_data_master_requests_fifo_in_csr),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_fifo_in_csr_end_xfer                                             (d1_fifo_in_csr_end_xfer),
      .fifo_in_csr_address                                                 (fifo_in_csr_address),
      .fifo_in_csr_irq                                                     (fifo_in_csr_irq),
      .fifo_in_csr_irq_from_sa                                             (fifo_in_csr_irq_from_sa),
      .fifo_in_csr_read                                                    (fifo_in_csr_read),
      .fifo_in_csr_readdata                                                (fifo_in_csr_readdata),
      .fifo_in_csr_readdata_from_sa                                        (fifo_in_csr_readdata_from_sa),
      .fifo_in_csr_write                                                   (fifo_in_csr_write),
      .fifo_in_csr_writedata                                               (fifo_in_csr_writedata),
      .reset_n                                                             (clk_sys_reset_n)
    );

  fifo_out_arbitrator the_fifo_out
    (
      .clk                                      (clk_pixel),
      .fifo_out_data                            (fifo_out_data),
      .fifo_out_empty                           (fifo_out_empty),
      .fifo_out_endofpacket                     (fifo_out_endofpacket),
      .fifo_out_ready                           (fifo_out_ready),
      .fifo_out_reset_n                         (fifo_out_reset_n),
      .fifo_out_startofpacket                   (fifo_out_startofpacket),
      .fifo_out_valid                           (fifo_out_valid),
      .fifo_to_pixel_converter_in_ready_from_sa (fifo_to_pixel_converter_in_ready_from_sa),
      .reset_n                                  (clk_pixel_reset_n)
    );

  fifo the_fifo
    (
      .avalonst_sink_data            (fifo_in_data),
      .avalonst_sink_empty           (fifo_in_empty),
      .avalonst_sink_endofpacket     (fifo_in_endofpacket),
      .avalonst_sink_ready           (fifo_in_ready),
      .avalonst_sink_startofpacket   (fifo_in_startofpacket),
      .avalonst_sink_valid           (fifo_in_valid),
      .avalonst_source_data          (fifo_out_data),
      .avalonst_source_empty         (fifo_out_empty),
      .avalonst_source_endofpacket   (fifo_out_endofpacket),
      .avalonst_source_ready         (fifo_out_ready),
      .avalonst_source_startofpacket (fifo_out_startofpacket),
      .avalonst_source_valid         (fifo_out_valid),
      .rdclock                       (clk_pixel),
      .rdreset_n                     (fifo_out_reset_n),
      .wrclk_control_slave_address   (fifo_in_csr_address),
      .wrclk_control_slave_irq       (fifo_in_csr_irq),
      .wrclk_control_slave_read      (fifo_in_csr_read),
      .wrclk_control_slave_readdata  (fifo_in_csr_readdata),
      .wrclk_control_slave_write     (fifo_in_csr_write),
      .wrclk_control_slave_writedata (fifo_in_csr_writedata),
      .wrclock                       (clk_sys),
      .wrreset_n                     (fifo_in_reset_n)
    );

  fifo_to_pixel_converter_in_arbitrator the_fifo_to_pixel_converter_in
    (
      .clk                                      (clk_pixel),
      .fifo_out_data                            (fifo_out_data),
      .fifo_out_empty                           (fifo_out_empty),
      .fifo_out_endofpacket                     (fifo_out_endofpacket),
      .fifo_out_startofpacket                   (fifo_out_startofpacket),
      .fifo_out_valid                           (fifo_out_valid),
      .fifo_to_pixel_converter_in_data          (fifo_to_pixel_converter_in_data),
      .fifo_to_pixel_converter_in_empty         (fifo_to_pixel_converter_in_empty),
      .fifo_to_pixel_converter_in_endofpacket   (fifo_to_pixel_converter_in_endofpacket),
      .fifo_to_pixel_converter_in_ready         (fifo_to_pixel_converter_in_ready),
      .fifo_to_pixel_converter_in_ready_from_sa (fifo_to_pixel_converter_in_ready_from_sa),
      .fifo_to_pixel_converter_in_reset_n       (fifo_to_pixel_converter_in_reset_n),
      .fifo_to_pixel_converter_in_startofpacket (fifo_to_pixel_converter_in_startofpacket),
      .fifo_to_pixel_converter_in_valid         (fifo_to_pixel_converter_in_valid),
      .reset_n                                  (clk_pixel_reset_n)
    );

  fifo_to_pixel_converter_out_arbitrator the_fifo_to_pixel_converter_out
    (
      .clk                                       (clk_pixel),
      .fifo_to_pixel_converter_out_data          (fifo_to_pixel_converter_out_data),
      .fifo_to_pixel_converter_out_empty         (fifo_to_pixel_converter_out_empty),
      .fifo_to_pixel_converter_out_endofpacket   (fifo_to_pixel_converter_out_endofpacket),
      .fifo_to_pixel_converter_out_ready         (fifo_to_pixel_converter_out_ready),
      .fifo_to_pixel_converter_out_startofpacket (fifo_to_pixel_converter_out_startofpacket),
      .fifo_to_pixel_converter_out_valid         (fifo_to_pixel_converter_out_valid),
      .pixel_converter_in_ready_from_sa          (pixel_converter_in_ready_from_sa),
      .reset_n                                   (clk_pixel_reset_n)
    );

  fifo_to_pixel_converter the_fifo_to_pixel_converter
    (
      .clk               (clk_pixel),
      .in_data           (fifo_to_pixel_converter_in_data),
      .in_empty          (fifo_to_pixel_converter_in_empty),
      .in_endofpacket    (fifo_to_pixel_converter_in_endofpacket),
      .in_ready          (fifo_to_pixel_converter_in_ready),
      .in_startofpacket  (fifo_to_pixel_converter_in_startofpacket),
      .in_valid          (fifo_to_pixel_converter_in_valid),
      .out_data          (fifo_to_pixel_converter_out_data),
      .out_empty         (fifo_to_pixel_converter_out_empty),
      .out_endofpacket   (fifo_to_pixel_converter_out_endofpacket),
      .out_ready         (fifo_to_pixel_converter_out_ready),
      .out_startofpacket (fifo_to_pixel_converter_out_startofpacket),
      .out_valid         (fifo_to_pixel_converter_out_valid),
      .reset_n           (fifo_to_pixel_converter_in_reset_n)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                 (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave       (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave         (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                             (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                                 (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                              (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                           (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa                   (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                                     (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                             (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                                  (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                                (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                        (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                            (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa                    (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                                 (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                             (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                     (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                                 (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                               (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                             (clk_sys_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (clk_sys),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  lcd_i2c_en_s1_arbitrator the_lcd_i2c_en_s1
    (
      .clk                                                  (clk_peripheral),
      .d1_lcd_i2c_en_s1_end_xfer                            (d1_lcd_i2c_en_s1_end_xfer),
      .lcd_i2c_en_s1_address                                (lcd_i2c_en_s1_address),
      .lcd_i2c_en_s1_chipselect                             (lcd_i2c_en_s1_chipselect),
      .lcd_i2c_en_s1_readdata                               (lcd_i2c_en_s1_readdata),
      .lcd_i2c_en_s1_readdata_from_sa                       (lcd_i2c_en_s1_readdata_from_sa),
      .lcd_i2c_en_s1_reset_n                                (lcd_i2c_en_s1_reset_n),
      .lcd_i2c_en_s1_write_n                                (lcd_i2c_en_s1_write_n),
      .lcd_i2c_en_s1_writedata                              (lcd_i2c_en_s1_writedata),
      .peripheral_bridge_m1_address_to_slave                (peripheral_bridge_m1_address_to_slave),
      .peripheral_bridge_m1_granted_lcd_i2c_en_s1           (peripheral_bridge_m1_granted_lcd_i2c_en_s1),
      .peripheral_bridge_m1_latency_counter                 (peripheral_bridge_m1_latency_counter),
      .peripheral_bridge_m1_nativeaddress                   (peripheral_bridge_m1_nativeaddress),
      .peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1 (peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1),
      .peripheral_bridge_m1_read                            (peripheral_bridge_m1_read),
      .peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1   (peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1),
      .peripheral_bridge_m1_requests_lcd_i2c_en_s1          (peripheral_bridge_m1_requests_lcd_i2c_en_s1),
      .peripheral_bridge_m1_write                           (peripheral_bridge_m1_write),
      .peripheral_bridge_m1_writedata                       (peripheral_bridge_m1_writedata),
      .reset_n                                              (clk_peripheral_reset_n)
    );

  lcd_i2c_en the_lcd_i2c_en
    (
      .address    (lcd_i2c_en_s1_address),
      .chipselect (lcd_i2c_en_s1_chipselect),
      .clk        (clk_peripheral),
      .out_port   (out_port_from_the_lcd_i2c_en),
      .readdata   (lcd_i2c_en_s1_readdata),
      .reset_n    (lcd_i2c_en_s1_reset_n),
      .write_n    (lcd_i2c_en_s1_write_n),
      .writedata  (lcd_i2c_en_s1_writedata)
    );

  lcd_i2c_scl_s1_arbitrator the_lcd_i2c_scl_s1
    (
      .clk                                                   (clk_peripheral),
      .d1_lcd_i2c_scl_s1_end_xfer                            (d1_lcd_i2c_scl_s1_end_xfer),
      .lcd_i2c_scl_s1_address                                (lcd_i2c_scl_s1_address),
      .lcd_i2c_scl_s1_chipselect                             (lcd_i2c_scl_s1_chipselect),
      .lcd_i2c_scl_s1_readdata                               (lcd_i2c_scl_s1_readdata),
      .lcd_i2c_scl_s1_readdata_from_sa                       (lcd_i2c_scl_s1_readdata_from_sa),
      .lcd_i2c_scl_s1_reset_n                                (lcd_i2c_scl_s1_reset_n),
      .lcd_i2c_scl_s1_write_n                                (lcd_i2c_scl_s1_write_n),
      .lcd_i2c_scl_s1_writedata                              (lcd_i2c_scl_s1_writedata),
      .peripheral_bridge_m1_address_to_slave                 (peripheral_bridge_m1_address_to_slave),
      .peripheral_bridge_m1_granted_lcd_i2c_scl_s1           (peripheral_bridge_m1_granted_lcd_i2c_scl_s1),
      .peripheral_bridge_m1_latency_counter                  (peripheral_bridge_m1_latency_counter),
      .peripheral_bridge_m1_nativeaddress                    (peripheral_bridge_m1_nativeaddress),
      .peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1 (peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1),
      .peripheral_bridge_m1_read                             (peripheral_bridge_m1_read),
      .peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1   (peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1),
      .peripheral_bridge_m1_requests_lcd_i2c_scl_s1          (peripheral_bridge_m1_requests_lcd_i2c_scl_s1),
      .peripheral_bridge_m1_write                            (peripheral_bridge_m1_write),
      .peripheral_bridge_m1_writedata                        (peripheral_bridge_m1_writedata),
      .reset_n                                               (clk_peripheral_reset_n)
    );

  lcd_i2c_scl the_lcd_i2c_scl
    (
      .address    (lcd_i2c_scl_s1_address),
      .chipselect (lcd_i2c_scl_s1_chipselect),
      .clk        (clk_peripheral),
      .out_port   (out_port_from_the_lcd_i2c_scl),
      .readdata   (lcd_i2c_scl_s1_readdata),
      .reset_n    (lcd_i2c_scl_s1_reset_n),
      .write_n    (lcd_i2c_scl_s1_write_n),
      .writedata  (lcd_i2c_scl_s1_writedata)
    );

  lcd_i2c_sda_s1_arbitrator the_lcd_i2c_sda_s1
    (
      .clk                                                   (clk_peripheral),
      .d1_lcd_i2c_sda_s1_end_xfer                            (d1_lcd_i2c_sda_s1_end_xfer),
      .lcd_i2c_sda_s1_address                                (lcd_i2c_sda_s1_address),
      .lcd_i2c_sda_s1_chipselect                             (lcd_i2c_sda_s1_chipselect),
      .lcd_i2c_sda_s1_readdata                               (lcd_i2c_sda_s1_readdata),
      .lcd_i2c_sda_s1_readdata_from_sa                       (lcd_i2c_sda_s1_readdata_from_sa),
      .lcd_i2c_sda_s1_reset_n                                (lcd_i2c_sda_s1_reset_n),
      .lcd_i2c_sda_s1_write_n                                (lcd_i2c_sda_s1_write_n),
      .lcd_i2c_sda_s1_writedata                              (lcd_i2c_sda_s1_writedata),
      .peripheral_bridge_m1_address_to_slave                 (peripheral_bridge_m1_address_to_slave),
      .peripheral_bridge_m1_granted_lcd_i2c_sda_s1           (peripheral_bridge_m1_granted_lcd_i2c_sda_s1),
      .peripheral_bridge_m1_latency_counter                  (peripheral_bridge_m1_latency_counter),
      .peripheral_bridge_m1_nativeaddress                    (peripheral_bridge_m1_nativeaddress),
      .peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1 (peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1),
      .peripheral_bridge_m1_read                             (peripheral_bridge_m1_read),
      .peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1   (peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1),
      .peripheral_bridge_m1_requests_lcd_i2c_sda_s1          (peripheral_bridge_m1_requests_lcd_i2c_sda_s1),
      .peripheral_bridge_m1_write                            (peripheral_bridge_m1_write),
      .peripheral_bridge_m1_writedata                        (peripheral_bridge_m1_writedata),
      .reset_n                                               (clk_peripheral_reset_n)
    );

  lcd_i2c_sda the_lcd_i2c_sda
    (
      .address    (lcd_i2c_sda_s1_address),
      .bidir_port (bidir_port_to_and_from_the_lcd_i2c_sda),
      .chipselect (lcd_i2c_sda_s1_chipselect),
      .clk        (clk_peripheral),
      .readdata   (lcd_i2c_sda_s1_readdata),
      .reset_n    (lcd_i2c_sda_s1_reset_n),
      .write_n    (lcd_i2c_sda_s1_write_n),
      .writedata  (lcd_i2c_sda_s1_writedata)
    );

  nios_simple_clock_0_in_arbitrator the_nios_simple_clock_0_in
    (
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_granted_nios_simple_clock_0_in                      (cpu_data_master_granted_nios_simple_clock_0_in),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_nios_simple_clock_0_in            (cpu_data_master_qualified_request_nios_simple_clock_0_in),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_nios_simple_clock_0_in              (cpu_data_master_read_data_valid_nios_simple_clock_0_in),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_nios_simple_clock_0_in                     (cpu_data_master_requests_nios_simple_clock_0_in),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_nios_simple_clock_0_in_end_xfer                                  (d1_nios_simple_clock_0_in_end_xfer),
      .nios_simple_clock_0_in_address                                      (nios_simple_clock_0_in_address),
      .nios_simple_clock_0_in_byteenable                                   (nios_simple_clock_0_in_byteenable),
      .nios_simple_clock_0_in_endofpacket                                  (nios_simple_clock_0_in_endofpacket),
      .nios_simple_clock_0_in_endofpacket_from_sa                          (nios_simple_clock_0_in_endofpacket_from_sa),
      .nios_simple_clock_0_in_nativeaddress                                (nios_simple_clock_0_in_nativeaddress),
      .nios_simple_clock_0_in_read                                         (nios_simple_clock_0_in_read),
      .nios_simple_clock_0_in_readdata                                     (nios_simple_clock_0_in_readdata),
      .nios_simple_clock_0_in_readdata_from_sa                             (nios_simple_clock_0_in_readdata_from_sa),
      .nios_simple_clock_0_in_reset_n                                      (nios_simple_clock_0_in_reset_n),
      .nios_simple_clock_0_in_waitrequest                                  (nios_simple_clock_0_in_waitrequest),
      .nios_simple_clock_0_in_waitrequest_from_sa                          (nios_simple_clock_0_in_waitrequest_from_sa),
      .nios_simple_clock_0_in_write                                        (nios_simple_clock_0_in_write),
      .nios_simple_clock_0_in_writedata                                    (nios_simple_clock_0_in_writedata),
      .reset_n                                                             (clk_sys_reset_n)
    );

  nios_simple_clock_0_out_arbitrator the_nios_simple_clock_0_out
    (
      .clk                                                     (clk_ext),
      .d1_pll_pll_slave_end_xfer                               (d1_pll_pll_slave_end_xfer),
      .nios_simple_clock_0_out_address                         (nios_simple_clock_0_out_address),
      .nios_simple_clock_0_out_address_to_slave                (nios_simple_clock_0_out_address_to_slave),
      .nios_simple_clock_0_out_byteenable                      (nios_simple_clock_0_out_byteenable),
      .nios_simple_clock_0_out_granted_pll_pll_slave           (nios_simple_clock_0_out_granted_pll_pll_slave),
      .nios_simple_clock_0_out_qualified_request_pll_pll_slave (nios_simple_clock_0_out_qualified_request_pll_pll_slave),
      .nios_simple_clock_0_out_read                            (nios_simple_clock_0_out_read),
      .nios_simple_clock_0_out_read_data_valid_pll_pll_slave   (nios_simple_clock_0_out_read_data_valid_pll_pll_slave),
      .nios_simple_clock_0_out_readdata                        (nios_simple_clock_0_out_readdata),
      .nios_simple_clock_0_out_requests_pll_pll_slave          (nios_simple_clock_0_out_requests_pll_pll_slave),
      .nios_simple_clock_0_out_reset_n                         (nios_simple_clock_0_out_reset_n),
      .nios_simple_clock_0_out_waitrequest                     (nios_simple_clock_0_out_waitrequest),
      .nios_simple_clock_0_out_write                           (nios_simple_clock_0_out_write),
      .nios_simple_clock_0_out_writedata                       (nios_simple_clock_0_out_writedata),
      .pll_pll_slave_readdata_from_sa                          (pll_pll_slave_readdata_from_sa),
      .reset_n                                                 (clk_ext_reset_n)
    );

  nios_simple_clock_0 the_nios_simple_clock_0
    (
      .master_address       (nios_simple_clock_0_out_address),
      .master_byteenable    (nios_simple_clock_0_out_byteenable),
      .master_clk           (clk_ext),
      .master_endofpacket   (nios_simple_clock_0_out_endofpacket),
      .master_nativeaddress (nios_simple_clock_0_out_nativeaddress),
      .master_read          (nios_simple_clock_0_out_read),
      .master_readdata      (nios_simple_clock_0_out_readdata),
      .master_reset_n       (nios_simple_clock_0_out_reset_n),
      .master_waitrequest   (nios_simple_clock_0_out_waitrequest),
      .master_write         (nios_simple_clock_0_out_write),
      .master_writedata     (nios_simple_clock_0_out_writedata),
      .slave_address        (nios_simple_clock_0_in_address),
      .slave_byteenable     (nios_simple_clock_0_in_byteenable),
      .slave_clk            (clk_sys),
      .slave_endofpacket    (nios_simple_clock_0_in_endofpacket),
      .slave_nativeaddress  (nios_simple_clock_0_in_nativeaddress),
      .slave_read           (nios_simple_clock_0_in_read),
      .slave_readdata       (nios_simple_clock_0_in_readdata),
      .slave_reset_n        (nios_simple_clock_0_in_reset_n),
      .slave_waitrequest    (nios_simple_clock_0_in_waitrequest),
      .slave_write          (nios_simple_clock_0_in_write),
      .slave_writedata      (nios_simple_clock_0_in_writedata)
    );

  peripheral_bridge_s1_arbitrator the_peripheral_bridge_s1
    (
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_granted_peripheral_bridge_s1                        (cpu_data_master_granted_peripheral_bridge_s1),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_peripheral_bridge_s1              (cpu_data_master_qualified_request_peripheral_bridge_s1),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1                (cpu_data_master_read_data_valid_peripheral_bridge_s1),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_peripheral_bridge_s1                       (cpu_data_master_requests_peripheral_bridge_s1),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_peripheral_bridge_s1_end_xfer                                    (d1_peripheral_bridge_s1_end_xfer),
      .peripheral_bridge_s1_address                                        (peripheral_bridge_s1_address),
      .peripheral_bridge_s1_byteenable                                     (peripheral_bridge_s1_byteenable),
      .peripheral_bridge_s1_endofpacket                                    (peripheral_bridge_s1_endofpacket),
      .peripheral_bridge_s1_endofpacket_from_sa                            (peripheral_bridge_s1_endofpacket_from_sa),
      .peripheral_bridge_s1_nativeaddress                                  (peripheral_bridge_s1_nativeaddress),
      .peripheral_bridge_s1_read                                           (peripheral_bridge_s1_read),
      .peripheral_bridge_s1_readdata                                       (peripheral_bridge_s1_readdata),
      .peripheral_bridge_s1_readdata_from_sa                               (peripheral_bridge_s1_readdata_from_sa),
      .peripheral_bridge_s1_readdatavalid                                  (peripheral_bridge_s1_readdatavalid),
      .peripheral_bridge_s1_reset_n                                        (peripheral_bridge_s1_reset_n),
      .peripheral_bridge_s1_waitrequest                                    (peripheral_bridge_s1_waitrequest),
      .peripheral_bridge_s1_waitrequest_from_sa                            (peripheral_bridge_s1_waitrequest_from_sa),
      .peripheral_bridge_s1_write                                          (peripheral_bridge_s1_write),
      .peripheral_bridge_s1_writedata                                      (peripheral_bridge_s1_writedata),
      .reset_n                                                             (clk_sys_reset_n)
    );

  peripheral_bridge_m1_arbitrator the_peripheral_bridge_m1
    (
      .clk                                                                     (clk_peripheral),
      .d1_lcd_i2c_en_s1_end_xfer                                               (d1_lcd_i2c_en_s1_end_xfer),
      .d1_lcd_i2c_scl_s1_end_xfer                                              (d1_lcd_i2c_scl_s1_end_xfer),
      .d1_lcd_i2c_sda_s1_end_xfer                                              (d1_lcd_i2c_sda_s1_end_xfer),
      .d1_sd_card_controller_avalon_slave_end_xfer                             (d1_sd_card_controller_avalon_slave_end_xfer),
      .d1_sys_clk_timer_s1_end_xfer                                            (d1_sys_clk_timer_s1_end_xfer),
      .d1_touch_panel_busy_s1_end_xfer                                         (d1_touch_panel_busy_s1_end_xfer),
      .d1_touch_panel_pen_irq_n_s1_end_xfer                                    (d1_touch_panel_pen_irq_n_s1_end_xfer),
      .d1_touch_panel_spi_spi_control_port_end_xfer                            (d1_touch_panel_spi_spi_control_port_end_xfer),
      .lcd_i2c_en_s1_readdata_from_sa                                          (lcd_i2c_en_s1_readdata_from_sa),
      .lcd_i2c_scl_s1_readdata_from_sa                                         (lcd_i2c_scl_s1_readdata_from_sa),
      .lcd_i2c_sda_s1_readdata_from_sa                                         (lcd_i2c_sda_s1_readdata_from_sa),
      .peripheral_bridge_m1_address                                            (peripheral_bridge_m1_address),
      .peripheral_bridge_m1_address_to_slave                                   (peripheral_bridge_m1_address_to_slave),
      .peripheral_bridge_m1_byteenable                                         (peripheral_bridge_m1_byteenable),
      .peripheral_bridge_m1_endofpacket                                        (peripheral_bridge_m1_endofpacket),
      .peripheral_bridge_m1_granted_lcd_i2c_en_s1                              (peripheral_bridge_m1_granted_lcd_i2c_en_s1),
      .peripheral_bridge_m1_granted_lcd_i2c_scl_s1                             (peripheral_bridge_m1_granted_lcd_i2c_scl_s1),
      .peripheral_bridge_m1_granted_lcd_i2c_sda_s1                             (peripheral_bridge_m1_granted_lcd_i2c_sda_s1),
      .peripheral_bridge_m1_granted_sd_card_controller_avalon_slave            (peripheral_bridge_m1_granted_sd_card_controller_avalon_slave),
      .peripheral_bridge_m1_granted_sys_clk_timer_s1                           (peripheral_bridge_m1_granted_sys_clk_timer_s1),
      .peripheral_bridge_m1_granted_touch_panel_busy_s1                        (peripheral_bridge_m1_granted_touch_panel_busy_s1),
      .peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1                   (peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1),
      .peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port           (peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port),
      .peripheral_bridge_m1_latency_counter                                    (peripheral_bridge_m1_latency_counter),
      .peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1                    (peripheral_bridge_m1_qualified_request_lcd_i2c_en_s1),
      .peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1                   (peripheral_bridge_m1_qualified_request_lcd_i2c_scl_s1),
      .peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1                   (peripheral_bridge_m1_qualified_request_lcd_i2c_sda_s1),
      .peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave  (peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave),
      .peripheral_bridge_m1_qualified_request_sys_clk_timer_s1                 (peripheral_bridge_m1_qualified_request_sys_clk_timer_s1),
      .peripheral_bridge_m1_qualified_request_touch_panel_busy_s1              (peripheral_bridge_m1_qualified_request_touch_panel_busy_s1),
      .peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1         (peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1),
      .peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port (peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port),
      .peripheral_bridge_m1_read                                               (peripheral_bridge_m1_read),
      .peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1                      (peripheral_bridge_m1_read_data_valid_lcd_i2c_en_s1),
      .peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1                     (peripheral_bridge_m1_read_data_valid_lcd_i2c_scl_s1),
      .peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1                     (peripheral_bridge_m1_read_data_valid_lcd_i2c_sda_s1),
      .peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave    (peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave),
      .peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1                   (peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1),
      .peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1                (peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1),
      .peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1           (peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1),
      .peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port   (peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port),
      .peripheral_bridge_m1_readdata                                           (peripheral_bridge_m1_readdata),
      .peripheral_bridge_m1_readdatavalid                                      (peripheral_bridge_m1_readdatavalid),
      .peripheral_bridge_m1_requests_lcd_i2c_en_s1                             (peripheral_bridge_m1_requests_lcd_i2c_en_s1),
      .peripheral_bridge_m1_requests_lcd_i2c_scl_s1                            (peripheral_bridge_m1_requests_lcd_i2c_scl_s1),
      .peripheral_bridge_m1_requests_lcd_i2c_sda_s1                            (peripheral_bridge_m1_requests_lcd_i2c_sda_s1),
      .peripheral_bridge_m1_requests_sd_card_controller_avalon_slave           (peripheral_bridge_m1_requests_sd_card_controller_avalon_slave),
      .peripheral_bridge_m1_requests_sys_clk_timer_s1                          (peripheral_bridge_m1_requests_sys_clk_timer_s1),
      .peripheral_bridge_m1_requests_touch_panel_busy_s1                       (peripheral_bridge_m1_requests_touch_panel_busy_s1),
      .peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1                  (peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1),
      .peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port          (peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port),
      .peripheral_bridge_m1_reset_n                                            (peripheral_bridge_m1_reset_n),
      .peripheral_bridge_m1_waitrequest                                        (peripheral_bridge_m1_waitrequest),
      .peripheral_bridge_m1_write                                              (peripheral_bridge_m1_write),
      .peripheral_bridge_m1_writedata                                          (peripheral_bridge_m1_writedata),
      .reset_n                                                                 (clk_peripheral_reset_n),
      .sd_card_controller_avalon_slave_readdata_from_sa                        (sd_card_controller_avalon_slave_readdata_from_sa),
      .sys_clk_timer_s1_readdata_from_sa                                       (sys_clk_timer_s1_readdata_from_sa),
      .touch_panel_busy_s1_readdata_from_sa                                    (touch_panel_busy_s1_readdata_from_sa),
      .touch_panel_pen_irq_n_s1_readdata_from_sa                               (touch_panel_pen_irq_n_s1_readdata_from_sa),
      .touch_panel_spi_spi_control_port_endofpacket_from_sa                    (touch_panel_spi_spi_control_port_endofpacket_from_sa),
      .touch_panel_spi_spi_control_port_readdata_from_sa                       (touch_panel_spi_spi_control_port_readdata_from_sa)
    );

  peripheral_bridge the_peripheral_bridge
    (
      .master_address       (peripheral_bridge_m1_address),
      .master_byteenable    (peripheral_bridge_m1_byteenable),
      .master_clk           (clk_peripheral),
      .master_endofpacket   (peripheral_bridge_m1_endofpacket),
      .master_nativeaddress (peripheral_bridge_m1_nativeaddress),
      .master_read          (peripheral_bridge_m1_read),
      .master_readdata      (peripheral_bridge_m1_readdata),
      .master_readdatavalid (peripheral_bridge_m1_readdatavalid),
      .master_reset_n       (peripheral_bridge_m1_reset_n),
      .master_waitrequest   (peripheral_bridge_m1_waitrequest),
      .master_write         (peripheral_bridge_m1_write),
      .master_writedata     (peripheral_bridge_m1_writedata),
      .slave_address        (peripheral_bridge_s1_address),
      .slave_byteenable     (peripheral_bridge_s1_byteenable),
      .slave_clk            (clk_sys),
      .slave_endofpacket    (peripheral_bridge_s1_endofpacket),
      .slave_nativeaddress  (peripheral_bridge_s1_nativeaddress),
      .slave_read           (peripheral_bridge_s1_read),
      .slave_readdata       (peripheral_bridge_s1_readdata),
      .slave_readdatavalid  (peripheral_bridge_s1_readdatavalid),
      .slave_reset_n        (peripheral_bridge_s1_reset_n),
      .slave_waitrequest    (peripheral_bridge_s1_waitrequest),
      .slave_write          (peripheral_bridge_s1_write),
      .slave_writedata      (peripheral_bridge_s1_writedata)
    );

  pixel_converter_in_arbitrator the_pixel_converter_in
    (
      .clk                                       (clk_pixel),
      .fifo_to_pixel_converter_out_data          (fifo_to_pixel_converter_out_data),
      .fifo_to_pixel_converter_out_empty         (fifo_to_pixel_converter_out_empty),
      .fifo_to_pixel_converter_out_endofpacket   (fifo_to_pixel_converter_out_endofpacket),
      .fifo_to_pixel_converter_out_startofpacket (fifo_to_pixel_converter_out_startofpacket),
      .fifo_to_pixel_converter_out_valid         (fifo_to_pixel_converter_out_valid),
      .pixel_converter_in_data                   (pixel_converter_in_data),
      .pixel_converter_in_empty                  (pixel_converter_in_empty),
      .pixel_converter_in_endofpacket            (pixel_converter_in_endofpacket),
      .pixel_converter_in_ready                  (pixel_converter_in_ready),
      .pixel_converter_in_ready_from_sa          (pixel_converter_in_ready_from_sa),
      .pixel_converter_in_reset_n                (pixel_converter_in_reset_n),
      .pixel_converter_in_startofpacket          (pixel_converter_in_startofpacket),
      .pixel_converter_in_valid                  (pixel_converter_in_valid),
      .reset_n                                   (clk_pixel_reset_n)
    );

  pixel_converter_out_arbitrator the_pixel_converter_out
    (
      .clk                                   (clk_pixel),
      .pixel_converter_out_data              (pixel_converter_out_data),
      .pixel_converter_out_empty             (pixel_converter_out_empty),
      .pixel_converter_out_endofpacket       (pixel_converter_out_endofpacket),
      .pixel_converter_out_ready             (pixel_converter_out_ready),
      .pixel_converter_out_startofpacket     (pixel_converter_out_startofpacket),
      .pixel_converter_out_valid             (pixel_converter_out_valid),
      .reset_n                               (clk_pixel_reset_n),
      .video_sync_generator_in_ready_from_sa (video_sync_generator_in_ready_from_sa)
    );

  pixel_converter the_pixel_converter
    (
      .clk       (clk_pixel),
      .data_in   (pixel_converter_in_data),
      .data_out  (pixel_converter_out_data),
      .empty_in  (pixel_converter_in_empty),
      .empty_out (pixel_converter_out_empty),
      .eop_in    (pixel_converter_in_endofpacket),
      .eop_out   (pixel_converter_out_endofpacket),
      .ready_in  (pixel_converter_out_ready),
      .ready_out (pixel_converter_in_ready),
      .reset_n   (pixel_converter_in_reset_n),
      .sop_in    (pixel_converter_in_startofpacket),
      .sop_out   (pixel_converter_out_startofpacket),
      .valid_in  (pixel_converter_in_valid),
      .valid_out (pixel_converter_out_valid)
    );

  pll_pll_slave_arbitrator the_pll_pll_slave
    (
      .clk                                                     (clk_ext),
      .d1_pll_pll_slave_end_xfer                               (d1_pll_pll_slave_end_xfer),
      .nios_simple_clock_0_out_address_to_slave                (nios_simple_clock_0_out_address_to_slave),
      .nios_simple_clock_0_out_granted_pll_pll_slave           (nios_simple_clock_0_out_granted_pll_pll_slave),
      .nios_simple_clock_0_out_qualified_request_pll_pll_slave (nios_simple_clock_0_out_qualified_request_pll_pll_slave),
      .nios_simple_clock_0_out_read                            (nios_simple_clock_0_out_read),
      .nios_simple_clock_0_out_read_data_valid_pll_pll_slave   (nios_simple_clock_0_out_read_data_valid_pll_pll_slave),
      .nios_simple_clock_0_out_requests_pll_pll_slave          (nios_simple_clock_0_out_requests_pll_pll_slave),
      .nios_simple_clock_0_out_write                           (nios_simple_clock_0_out_write),
      .nios_simple_clock_0_out_writedata                       (nios_simple_clock_0_out_writedata),
      .pll_pll_slave_address                                   (pll_pll_slave_address),
      .pll_pll_slave_read                                      (pll_pll_slave_read),
      .pll_pll_slave_readdata                                  (pll_pll_slave_readdata),
      .pll_pll_slave_readdata_from_sa                          (pll_pll_slave_readdata_from_sa),
      .pll_pll_slave_reset                                     (pll_pll_slave_reset),
      .pll_pll_slave_write                                     (pll_pll_slave_write),
      .pll_pll_slave_writedata                                 (pll_pll_slave_writedata),
      .reset_n                                                 (clk_ext_reset_n)
    );

  //clk_sdram out_clk assignment, which is an e_assign
  assign clk_sdram = out_clk_pll_c0;

  //clk_pixel out_clk assignment, which is an e_assign
  assign clk_pixel = out_clk_pll_c1;

  //clk_sys out_clk assignment, which is an e_assign
  assign clk_sys = out_clk_pll_c2;

  //clk_peripheral out_clk assignment, which is an e_assign
  assign clk_peripheral = out_clk_pll_c3;

  pll the_pll
    (
      .address   (pll_pll_slave_address),
      .c0        (out_clk_pll_c0),
      .c1        (out_clk_pll_c1),
      .c2        (out_clk_pll_c2),
      .c3        (out_clk_pll_c3),
      .clk       (clk_ext),
      .locked    (locked_from_the_pll),
      .phasedone (phasedone_from_the_pll),
      .read      (pll_pll_slave_read),
      .readdata  (pll_pll_slave_readdata),
      .reset     (pll_pll_slave_reset),
      .write     (pll_pll_slave_write),
      .writedata (pll_pll_slave_writedata)
    );

  sd_card_controller_avalon_slave_arbitrator the_sd_card_controller_avalon_slave
    (
      .clk                                                                    (clk_peripheral),
      .d1_sd_card_controller_avalon_slave_end_xfer                            (d1_sd_card_controller_avalon_slave_end_xfer),
      .peripheral_bridge_m1_address_to_slave                                  (peripheral_bridge_m1_address_to_slave),
      .peripheral_bridge_m1_byteenable                                        (peripheral_bridge_m1_byteenable),
      .peripheral_bridge_m1_granted_sd_card_controller_avalon_slave           (peripheral_bridge_m1_granted_sd_card_controller_avalon_slave),
      .peripheral_bridge_m1_latency_counter                                   (peripheral_bridge_m1_latency_counter),
      .peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave (peripheral_bridge_m1_qualified_request_sd_card_controller_avalon_slave),
      .peripheral_bridge_m1_read                                              (peripheral_bridge_m1_read),
      .peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave   (peripheral_bridge_m1_read_data_valid_sd_card_controller_avalon_slave),
      .peripheral_bridge_m1_requests_sd_card_controller_avalon_slave          (peripheral_bridge_m1_requests_sd_card_controller_avalon_slave),
      .peripheral_bridge_m1_write                                             (peripheral_bridge_m1_write),
      .peripheral_bridge_m1_writedata                                         (peripheral_bridge_m1_writedata),
      .reset_n                                                                (clk_peripheral_reset_n),
      .sd_card_controller_avalon_slave_address                                (sd_card_controller_avalon_slave_address),
      .sd_card_controller_avalon_slave_byteenable                             (sd_card_controller_avalon_slave_byteenable),
      .sd_card_controller_avalon_slave_chipselect                             (sd_card_controller_avalon_slave_chipselect),
      .sd_card_controller_avalon_slave_read                                   (sd_card_controller_avalon_slave_read),
      .sd_card_controller_avalon_slave_readdata                               (sd_card_controller_avalon_slave_readdata),
      .sd_card_controller_avalon_slave_readdata_from_sa                       (sd_card_controller_avalon_slave_readdata_from_sa),
      .sd_card_controller_avalon_slave_reset_n                                (sd_card_controller_avalon_slave_reset_n),
      .sd_card_controller_avalon_slave_write                                  (sd_card_controller_avalon_slave_write),
      .sd_card_controller_avalon_slave_writedata                              (sd_card_controller_avalon_slave_writedata)
    );

  sd_card_controller the_sd_card_controller
    (
      .avalon_slave_address    (sd_card_controller_avalon_slave_address),
      .avalon_slave_byteenable (sd_card_controller_avalon_slave_byteenable),
      .avalon_slave_chipselect (sd_card_controller_avalon_slave_chipselect),
      .avalon_slave_read       (sd_card_controller_avalon_slave_read),
      .avalon_slave_readdata   (sd_card_controller_avalon_slave_readdata),
      .avalon_slave_write      (sd_card_controller_avalon_slave_write),
      .avalon_slave_writedata  (sd_card_controller_avalon_slave_writedata),
      .clk                     (clk_peripheral),
      .reset_n                 (sd_card_controller_avalon_slave_reset_n),
      .spi_clk                 (spi_clk_from_the_sd_card_controller),
      .spi_cs_n                (spi_cs_n_from_the_sd_card_controller),
      .spi_data_in             (spi_data_in_to_the_sd_card_controller),
      .spi_data_out            (spi_data_out_from_the_sd_card_controller)
    );

  sdram_s1_arbitrator the_sdram_s1
    (
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_granted_sdram_s1                                    (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_sdram_s1                          (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1                            (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_sdram_s1                                   (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                             (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_sdram_s1                             (cpu_instruction_master_granted_sdram_s1),
      .cpu_instruction_master_latency_counter                              (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_sdram_s1                   (cpu_instruction_master_qualified_request_sdram_s1),
      .cpu_instruction_master_read                                         (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_sdram_s1                     (cpu_instruction_master_read_data_valid_sdram_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register      (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_requests_sdram_s1                            (cpu_instruction_master_requests_sdram_s1),
      .d1_sdram_s1_end_xfer                                                (d1_sdram_s1_end_xfer),
      .reset_n                                                             (clk_sys_reset_n),
      .sdram_s1_address                                                    (sdram_s1_address),
      .sdram_s1_byteenable_n                                               (sdram_s1_byteenable_n),
      .sdram_s1_chipselect                                                 (sdram_s1_chipselect),
      .sdram_s1_read_n                                                     (sdram_s1_read_n),
      .sdram_s1_readdata                                                   (sdram_s1_readdata),
      .sdram_s1_readdata_from_sa                                           (sdram_s1_readdata_from_sa),
      .sdram_s1_readdatavalid                                              (sdram_s1_readdatavalid),
      .sdram_s1_reset_n                                                    (sdram_s1_reset_n),
      .sdram_s1_waitrequest                                                (sdram_s1_waitrequest),
      .sdram_s1_waitrequest_from_sa                                        (sdram_s1_waitrequest_from_sa),
      .sdram_s1_write_n                                                    (sdram_s1_write_n),
      .sdram_s1_writedata                                                  (sdram_s1_writedata),
      .sgdma_pixel_m_read_address_to_slave                                 (sgdma_pixel_m_read_address_to_slave),
      .sgdma_pixel_m_read_granted_sdram_s1                                 (sgdma_pixel_m_read_granted_sdram_s1),
      .sgdma_pixel_m_read_latency_counter                                  (sgdma_pixel_m_read_latency_counter),
      .sgdma_pixel_m_read_qualified_request_sdram_s1                       (sgdma_pixel_m_read_qualified_request_sdram_s1),
      .sgdma_pixel_m_read_read                                             (sgdma_pixel_m_read_read),
      .sgdma_pixel_m_read_read_data_valid_sdram_s1                         (sgdma_pixel_m_read_read_data_valid_sdram_s1),
      .sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register          (sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register),
      .sgdma_pixel_m_read_requests_sdram_s1                                (sgdma_pixel_m_read_requests_sdram_s1)
    );

  sdram the_sdram
    (
      .az_addr        (sdram_s1_address),
      .az_be_n        (sdram_s1_byteenable_n),
      .az_cs          (sdram_s1_chipselect),
      .az_data        (sdram_s1_writedata),
      .az_rd_n        (sdram_s1_read_n),
      .az_wr_n        (sdram_s1_write_n),
      .clk            (clk_sys),
      .reset_n        (sdram_s1_reset_n),
      .za_data        (sdram_s1_readdata),
      .za_valid       (sdram_s1_readdatavalid),
      .za_waitrequest (sdram_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram),
      .zs_ba          (zs_ba_from_the_sdram),
      .zs_cas_n       (zs_cas_n_from_the_sdram),
      .zs_cke         (zs_cke_from_the_sdram),
      .zs_cs_n        (zs_cs_n_from_the_sdram),
      .zs_dq          (zs_dq_to_and_from_the_sdram),
      .zs_dqm         (zs_dqm_from_the_sdram),
      .zs_ras_n       (zs_ras_n_from_the_sdram),
      .zs_we_n        (zs_we_n_from_the_sdram)
    );

  sgdma_pixel_csr_arbitrator the_sgdma_pixel_csr
    (
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sgdma_pixel_csr                             (cpu_data_master_granted_sgdma_pixel_csr),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_sgdma_pixel_csr                   (cpu_data_master_qualified_request_sgdma_pixel_csr),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_sgdma_pixel_csr                     (cpu_data_master_read_data_valid_sgdma_pixel_csr),
      .cpu_data_master_requests_sgdma_pixel_csr                            (cpu_data_master_requests_sgdma_pixel_csr),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_sgdma_pixel_csr_end_xfer                                         (d1_sgdma_pixel_csr_end_xfer),
      .reset_n                                                             (clk_sys_reset_n),
      .sgdma_pixel_csr_address                                             (sgdma_pixel_csr_address),
      .sgdma_pixel_csr_chipselect                                          (sgdma_pixel_csr_chipselect),
      .sgdma_pixel_csr_irq                                                 (sgdma_pixel_csr_irq),
      .sgdma_pixel_csr_irq_from_sa                                         (sgdma_pixel_csr_irq_from_sa),
      .sgdma_pixel_csr_read                                                (sgdma_pixel_csr_read),
      .sgdma_pixel_csr_readdata                                            (sgdma_pixel_csr_readdata),
      .sgdma_pixel_csr_readdata_from_sa                                    (sgdma_pixel_csr_readdata_from_sa),
      .sgdma_pixel_csr_reset_n                                             (sgdma_pixel_csr_reset_n),
      .sgdma_pixel_csr_write                                               (sgdma_pixel_csr_write),
      .sgdma_pixel_csr_writedata                                           (sgdma_pixel_csr_writedata)
    );

  sgdma_pixel_descriptor_read_arbitrator the_sgdma_pixel_descriptor_read
    (
      .clk                                                             (clk_sys),
      .d1_descriptor_mem_s1_end_xfer                                   (d1_descriptor_mem_s1_end_xfer),
      .descriptor_mem_s1_readdata_from_sa                              (descriptor_mem_s1_readdata_from_sa),
      .reset_n                                                         (clk_sys_reset_n),
      .sgdma_pixel_descriptor_read_address                             (sgdma_pixel_descriptor_read_address),
      .sgdma_pixel_descriptor_read_address_to_slave                    (sgdma_pixel_descriptor_read_address_to_slave),
      .sgdma_pixel_descriptor_read_granted_descriptor_mem_s1           (sgdma_pixel_descriptor_read_granted_descriptor_mem_s1),
      .sgdma_pixel_descriptor_read_latency_counter                     (sgdma_pixel_descriptor_read_latency_counter),
      .sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1 (sgdma_pixel_descriptor_read_qualified_request_descriptor_mem_s1),
      .sgdma_pixel_descriptor_read_read                                (sgdma_pixel_descriptor_read_read),
      .sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1   (sgdma_pixel_descriptor_read_read_data_valid_descriptor_mem_s1),
      .sgdma_pixel_descriptor_read_readdata                            (sgdma_pixel_descriptor_read_readdata),
      .sgdma_pixel_descriptor_read_readdatavalid                       (sgdma_pixel_descriptor_read_readdatavalid),
      .sgdma_pixel_descriptor_read_requests_descriptor_mem_s1          (sgdma_pixel_descriptor_read_requests_descriptor_mem_s1),
      .sgdma_pixel_descriptor_read_waitrequest                         (sgdma_pixel_descriptor_read_waitrequest)
    );

  sgdma_pixel_descriptor_write_arbitrator the_sgdma_pixel_descriptor_write
    (
      .clk                                                              (clk_sys),
      .d1_descriptor_mem_s1_end_xfer                                    (d1_descriptor_mem_s1_end_xfer),
      .reset_n                                                          (clk_sys_reset_n),
      .sgdma_pixel_descriptor_write_address                             (sgdma_pixel_descriptor_write_address),
      .sgdma_pixel_descriptor_write_address_to_slave                    (sgdma_pixel_descriptor_write_address_to_slave),
      .sgdma_pixel_descriptor_write_granted_descriptor_mem_s1           (sgdma_pixel_descriptor_write_granted_descriptor_mem_s1),
      .sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1 (sgdma_pixel_descriptor_write_qualified_request_descriptor_mem_s1),
      .sgdma_pixel_descriptor_write_requests_descriptor_mem_s1          (sgdma_pixel_descriptor_write_requests_descriptor_mem_s1),
      .sgdma_pixel_descriptor_write_waitrequest                         (sgdma_pixel_descriptor_write_waitrequest),
      .sgdma_pixel_descriptor_write_write                               (sgdma_pixel_descriptor_write_write),
      .sgdma_pixel_descriptor_write_writedata                           (sgdma_pixel_descriptor_write_writedata)
    );

  sgdma_pixel_m_read_arbitrator the_sgdma_pixel_m_read
    (
      .clk                                                        (clk_sys),
      .d1_sdram_s1_end_xfer                                       (d1_sdram_s1_end_xfer),
      .reset_n                                                    (clk_sys_reset_n),
      .sdram_s1_readdata_from_sa                                  (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                               (sdram_s1_waitrequest_from_sa),
      .sgdma_pixel_m_read_address                                 (sgdma_pixel_m_read_address),
      .sgdma_pixel_m_read_address_to_slave                        (sgdma_pixel_m_read_address_to_slave),
      .sgdma_pixel_m_read_granted_sdram_s1                        (sgdma_pixel_m_read_granted_sdram_s1),
      .sgdma_pixel_m_read_latency_counter                         (sgdma_pixel_m_read_latency_counter),
      .sgdma_pixel_m_read_qualified_request_sdram_s1              (sgdma_pixel_m_read_qualified_request_sdram_s1),
      .sgdma_pixel_m_read_read                                    (sgdma_pixel_m_read_read),
      .sgdma_pixel_m_read_read_data_valid_sdram_s1                (sgdma_pixel_m_read_read_data_valid_sdram_s1),
      .sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register (sgdma_pixel_m_read_read_data_valid_sdram_s1_shift_register),
      .sgdma_pixel_m_read_readdata                                (sgdma_pixel_m_read_readdata),
      .sgdma_pixel_m_read_readdatavalid                           (sgdma_pixel_m_read_readdatavalid),
      .sgdma_pixel_m_read_requests_sdram_s1                       (sgdma_pixel_m_read_requests_sdram_s1),
      .sgdma_pixel_m_read_waitrequest                             (sgdma_pixel_m_read_waitrequest)
    );

  sgdma_pixel_out_arbitrator the_sgdma_pixel_out
    (
      .clk                             (clk_sys),
      .reset_n                         (clk_sys_reset_n),
      .sgdma_pixel_out_data            (sgdma_pixel_out_data),
      .sgdma_pixel_out_empty           (sgdma_pixel_out_empty),
      .sgdma_pixel_out_endofpacket     (sgdma_pixel_out_endofpacket),
      .sgdma_pixel_out_ready           (sgdma_pixel_out_ready),
      .sgdma_pixel_out_startofpacket   (sgdma_pixel_out_startofpacket),
      .sgdma_pixel_out_valid           (sgdma_pixel_out_valid),
      .timing_adapter_in_ready_from_sa (timing_adapter_in_ready_from_sa)
    );

  sgdma_pixel the_sgdma_pixel
    (
      .clk                           (clk_sys),
      .csr_address                   (sgdma_pixel_csr_address),
      .csr_chipselect                (sgdma_pixel_csr_chipselect),
      .csr_irq                       (sgdma_pixel_csr_irq),
      .csr_read                      (sgdma_pixel_csr_read),
      .csr_readdata                  (sgdma_pixel_csr_readdata),
      .csr_write                     (sgdma_pixel_csr_write),
      .csr_writedata                 (sgdma_pixel_csr_writedata),
      .descriptor_read_address       (sgdma_pixel_descriptor_read_address),
      .descriptor_read_read          (sgdma_pixel_descriptor_read_read),
      .descriptor_read_readdata      (sgdma_pixel_descriptor_read_readdata),
      .descriptor_read_readdatavalid (sgdma_pixel_descriptor_read_readdatavalid),
      .descriptor_read_waitrequest   (sgdma_pixel_descriptor_read_waitrequest),
      .descriptor_write_address      (sgdma_pixel_descriptor_write_address),
      .descriptor_write_waitrequest  (sgdma_pixel_descriptor_write_waitrequest),
      .descriptor_write_write        (sgdma_pixel_descriptor_write_write),
      .descriptor_write_writedata    (sgdma_pixel_descriptor_write_writedata),
      .m_read_address                (sgdma_pixel_m_read_address),
      .m_read_read                   (sgdma_pixel_m_read_read),
      .m_read_readdata               (sgdma_pixel_m_read_readdata),
      .m_read_readdatavalid          (sgdma_pixel_m_read_readdatavalid),
      .m_read_waitrequest            (sgdma_pixel_m_read_waitrequest),
      .out_data                      (sgdma_pixel_out_data),
      .out_empty                     (sgdma_pixel_out_empty),
      .out_endofpacket               (sgdma_pixel_out_endofpacket),
      .out_ready                     (sgdma_pixel_out_ready),
      .out_startofpacket             (sgdma_pixel_out_startofpacket),
      .out_valid                     (sgdma_pixel_out_valid),
      .system_reset_n                (sgdma_pixel_csr_reset_n)
    );

  sram_avalon_slave_arbitrator the_sram_avalon_slave
    (
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_sram_avalon_slave                        (cpu_data_master_byteenable_sram_avalon_slave),
      .cpu_data_master_dbs_address                                         (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                        (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_sram_avalon_slave                           (cpu_data_master_granted_sram_avalon_slave),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_sram_avalon_slave                 (cpu_data_master_qualified_request_sram_avalon_slave),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_sram_avalon_slave                   (cpu_data_master_read_data_valid_sram_avalon_slave),
      .cpu_data_master_requests_sram_avalon_slave                          (cpu_data_master_requests_sram_avalon_slave),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                             (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                  (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_sram_avalon_slave                    (cpu_instruction_master_granted_sram_avalon_slave),
      .cpu_instruction_master_latency_counter                              (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_sram_avalon_slave          (cpu_instruction_master_qualified_request_sram_avalon_slave),
      .cpu_instruction_master_read                                         (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register      (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_read_data_valid_sram_avalon_slave            (cpu_instruction_master_read_data_valid_sram_avalon_slave),
      .cpu_instruction_master_requests_sram_avalon_slave                   (cpu_instruction_master_requests_sram_avalon_slave),
      .d1_sram_avalon_slave_end_xfer                                       (d1_sram_avalon_slave_end_xfer),
      .reset_n                                                             (clk_sys_reset_n),
      .sram_avalon_slave_address                                           (sram_avalon_slave_address),
      .sram_avalon_slave_byteenable_n                                      (sram_avalon_slave_byteenable_n),
      .sram_avalon_slave_chipselect_n                                      (sram_avalon_slave_chipselect_n),
      .sram_avalon_slave_read_n                                            (sram_avalon_slave_read_n),
      .sram_avalon_slave_readdata                                          (sram_avalon_slave_readdata),
      .sram_avalon_slave_readdata_from_sa                                  (sram_avalon_slave_readdata_from_sa),
      .sram_avalon_slave_reset_n                                           (sram_avalon_slave_reset_n),
      .sram_avalon_slave_wait_counter_eq_0                                 (sram_avalon_slave_wait_counter_eq_0),
      .sram_avalon_slave_write_n                                           (sram_avalon_slave_write_n),
      .sram_avalon_slave_writedata                                         (sram_avalon_slave_writedata)
    );

  sram the_sram
    (
      .SRAM_ADDR      (SRAM_ADDR_from_the_sram),
      .SRAM_CE_n      (SRAM_CE_n_from_the_sram),
      .SRAM_DQ        (SRAM_DQ_to_and_from_the_sram),
      .SRAM_LB_n      (SRAM_LB_n_from_the_sram),
      .SRAM_OE_n      (SRAM_OE_n_from_the_sram),
      .SRAM_UB_n      (SRAM_UB_n_from_the_sram),
      .SRAM_WE_n      (SRAM_WE_n_from_the_sram),
      .clk            (clk_sys),
      .reset_n        (sram_avalon_slave_reset_n),
      .s_address      (sram_avalon_slave_address),
      .s_byteenable_n (sram_avalon_slave_byteenable_n),
      .s_chipselect_n (sram_avalon_slave_chipselect_n),
      .s_read_n       (sram_avalon_slave_read_n),
      .s_readdata     (sram_avalon_slave_readdata),
      .s_write_n      (sram_avalon_slave_write_n),
      .s_writedata    (sram_avalon_slave_writedata)
    );

  sys_clk_timer_s1_arbitrator the_sys_clk_timer_s1
    (
      .clk                                                     (clk_peripheral),
      .d1_sys_clk_timer_s1_end_xfer                            (d1_sys_clk_timer_s1_end_xfer),
      .peripheral_bridge_m1_address_to_slave                   (peripheral_bridge_m1_address_to_slave),
      .peripheral_bridge_m1_granted_sys_clk_timer_s1           (peripheral_bridge_m1_granted_sys_clk_timer_s1),
      .peripheral_bridge_m1_latency_counter                    (peripheral_bridge_m1_latency_counter),
      .peripheral_bridge_m1_nativeaddress                      (peripheral_bridge_m1_nativeaddress),
      .peripheral_bridge_m1_qualified_request_sys_clk_timer_s1 (peripheral_bridge_m1_qualified_request_sys_clk_timer_s1),
      .peripheral_bridge_m1_read                               (peripheral_bridge_m1_read),
      .peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1   (peripheral_bridge_m1_read_data_valid_sys_clk_timer_s1),
      .peripheral_bridge_m1_requests_sys_clk_timer_s1          (peripheral_bridge_m1_requests_sys_clk_timer_s1),
      .peripheral_bridge_m1_write                              (peripheral_bridge_m1_write),
      .peripheral_bridge_m1_writedata                          (peripheral_bridge_m1_writedata),
      .reset_n                                                 (clk_peripheral_reset_n),
      .sys_clk_timer_s1_address                                (sys_clk_timer_s1_address),
      .sys_clk_timer_s1_chipselect                             (sys_clk_timer_s1_chipselect),
      .sys_clk_timer_s1_irq                                    (sys_clk_timer_s1_irq),
      .sys_clk_timer_s1_irq_from_sa                            (sys_clk_timer_s1_irq_from_sa),
      .sys_clk_timer_s1_readdata                               (sys_clk_timer_s1_readdata),
      .sys_clk_timer_s1_readdata_from_sa                       (sys_clk_timer_s1_readdata_from_sa),
      .sys_clk_timer_s1_reset_n                                (sys_clk_timer_s1_reset_n),
      .sys_clk_timer_s1_write_n                                (sys_clk_timer_s1_write_n),
      .sys_clk_timer_s1_writedata                              (sys_clk_timer_s1_writedata)
    );

  sys_clk_timer the_sys_clk_timer
    (
      .address    (sys_clk_timer_s1_address),
      .chipselect (sys_clk_timer_s1_chipselect),
      .clk        (clk_peripheral),
      .irq        (sys_clk_timer_s1_irq),
      .readdata   (sys_clk_timer_s1_readdata),
      .reset_n    (sys_clk_timer_s1_reset_n),
      .write_n    (sys_clk_timer_s1_write_n),
      .writedata  (sys_clk_timer_s1_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sysid_control_slave                         (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_sysid_control_slave               (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_sysid_control_slave                 (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_requests_sysid_control_slave                        (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .d1_sysid_control_slave_end_xfer                                     (d1_sysid_control_slave_end_xfer),
      .reset_n                                                             (clk_sys_reset_n),
      .sysid_control_slave_address                                         (sysid_control_slave_address),
      .sysid_control_slave_readdata                                        (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                                (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                                         (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  timing_adapter_in_arbitrator the_timing_adapter_in
    (
      .clk                             (clk_sys),
      .reset_n                         (clk_sys_reset_n),
      .sgdma_pixel_out_data            (sgdma_pixel_out_data),
      .sgdma_pixel_out_empty           (sgdma_pixel_out_empty),
      .sgdma_pixel_out_endofpacket     (sgdma_pixel_out_endofpacket),
      .sgdma_pixel_out_startofpacket   (sgdma_pixel_out_startofpacket),
      .sgdma_pixel_out_valid           (sgdma_pixel_out_valid),
      .timing_adapter_in_data          (timing_adapter_in_data),
      .timing_adapter_in_empty         (timing_adapter_in_empty),
      .timing_adapter_in_endofpacket   (timing_adapter_in_endofpacket),
      .timing_adapter_in_ready         (timing_adapter_in_ready),
      .timing_adapter_in_ready_from_sa (timing_adapter_in_ready_from_sa),
      .timing_adapter_in_reset_n       (timing_adapter_in_reset_n),
      .timing_adapter_in_startofpacket (timing_adapter_in_startofpacket),
      .timing_adapter_in_valid         (timing_adapter_in_valid)
    );

  timing_adapter_out_arbitrator the_timing_adapter_out
    (
      .clk                              (clk_sys),
      .fifo_in_ready_from_sa            (fifo_in_ready_from_sa),
      .reset_n                          (clk_sys_reset_n),
      .timing_adapter_out_data          (timing_adapter_out_data),
      .timing_adapter_out_empty         (timing_adapter_out_empty),
      .timing_adapter_out_endofpacket   (timing_adapter_out_endofpacket),
      .timing_adapter_out_ready         (timing_adapter_out_ready),
      .timing_adapter_out_startofpacket (timing_adapter_out_startofpacket),
      .timing_adapter_out_valid         (timing_adapter_out_valid)
    );

  timing_adapter the_timing_adapter
    (
      .clk               (clk_sys),
      .in_data           (timing_adapter_in_data),
      .in_empty          (timing_adapter_in_empty),
      .in_endofpacket    (timing_adapter_in_endofpacket),
      .in_ready          (timing_adapter_in_ready),
      .in_startofpacket  (timing_adapter_in_startofpacket),
      .in_valid          (timing_adapter_in_valid),
      .out_data          (timing_adapter_out_data),
      .out_empty         (timing_adapter_out_empty),
      .out_endofpacket   (timing_adapter_out_endofpacket),
      .out_ready         (timing_adapter_out_ready),
      .out_startofpacket (timing_adapter_out_startofpacket),
      .out_valid         (timing_adapter_out_valid),
      .reset_n           (timing_adapter_in_reset_n)
    );

  touch_panel_busy_s1_arbitrator the_touch_panel_busy_s1
    (
      .clk                                                        (clk_peripheral),
      .d1_touch_panel_busy_s1_end_xfer                            (d1_touch_panel_busy_s1_end_xfer),
      .peripheral_bridge_m1_address_to_slave                      (peripheral_bridge_m1_address_to_slave),
      .peripheral_bridge_m1_granted_touch_panel_busy_s1           (peripheral_bridge_m1_granted_touch_panel_busy_s1),
      .peripheral_bridge_m1_latency_counter                       (peripheral_bridge_m1_latency_counter),
      .peripheral_bridge_m1_nativeaddress                         (peripheral_bridge_m1_nativeaddress),
      .peripheral_bridge_m1_qualified_request_touch_panel_busy_s1 (peripheral_bridge_m1_qualified_request_touch_panel_busy_s1),
      .peripheral_bridge_m1_read                                  (peripheral_bridge_m1_read),
      .peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1   (peripheral_bridge_m1_read_data_valid_touch_panel_busy_s1),
      .peripheral_bridge_m1_requests_touch_panel_busy_s1          (peripheral_bridge_m1_requests_touch_panel_busy_s1),
      .peripheral_bridge_m1_write                                 (peripheral_bridge_m1_write),
      .reset_n                                                    (clk_peripheral_reset_n),
      .touch_panel_busy_s1_address                                (touch_panel_busy_s1_address),
      .touch_panel_busy_s1_readdata                               (touch_panel_busy_s1_readdata),
      .touch_panel_busy_s1_readdata_from_sa                       (touch_panel_busy_s1_readdata_from_sa),
      .touch_panel_busy_s1_reset_n                                (touch_panel_busy_s1_reset_n)
    );

  touch_panel_busy the_touch_panel_busy
    (
      .address  (touch_panel_busy_s1_address),
      .clk      (clk_peripheral),
      .in_port  (in_port_to_the_touch_panel_busy),
      .readdata (touch_panel_busy_s1_readdata),
      .reset_n  (touch_panel_busy_s1_reset_n)
    );

  touch_panel_pen_irq_n_s1_arbitrator the_touch_panel_pen_irq_n_s1
    (
      .clk                                                             (clk_peripheral),
      .d1_touch_panel_pen_irq_n_s1_end_xfer                            (d1_touch_panel_pen_irq_n_s1_end_xfer),
      .peripheral_bridge_m1_address_to_slave                           (peripheral_bridge_m1_address_to_slave),
      .peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1           (peripheral_bridge_m1_granted_touch_panel_pen_irq_n_s1),
      .peripheral_bridge_m1_latency_counter                            (peripheral_bridge_m1_latency_counter),
      .peripheral_bridge_m1_nativeaddress                              (peripheral_bridge_m1_nativeaddress),
      .peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1 (peripheral_bridge_m1_qualified_request_touch_panel_pen_irq_n_s1),
      .peripheral_bridge_m1_read                                       (peripheral_bridge_m1_read),
      .peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1   (peripheral_bridge_m1_read_data_valid_touch_panel_pen_irq_n_s1),
      .peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1          (peripheral_bridge_m1_requests_touch_panel_pen_irq_n_s1),
      .peripheral_bridge_m1_write                                      (peripheral_bridge_m1_write),
      .peripheral_bridge_m1_writedata                                  (peripheral_bridge_m1_writedata),
      .reset_n                                                         (clk_peripheral_reset_n),
      .touch_panel_pen_irq_n_s1_address                                (touch_panel_pen_irq_n_s1_address),
      .touch_panel_pen_irq_n_s1_chipselect                             (touch_panel_pen_irq_n_s1_chipselect),
      .touch_panel_pen_irq_n_s1_irq                                    (touch_panel_pen_irq_n_s1_irq),
      .touch_panel_pen_irq_n_s1_irq_from_sa                            (touch_panel_pen_irq_n_s1_irq_from_sa),
      .touch_panel_pen_irq_n_s1_readdata                               (touch_panel_pen_irq_n_s1_readdata),
      .touch_panel_pen_irq_n_s1_readdata_from_sa                       (touch_panel_pen_irq_n_s1_readdata_from_sa),
      .touch_panel_pen_irq_n_s1_reset_n                                (touch_panel_pen_irq_n_s1_reset_n),
      .touch_panel_pen_irq_n_s1_write_n                                (touch_panel_pen_irq_n_s1_write_n),
      .touch_panel_pen_irq_n_s1_writedata                              (touch_panel_pen_irq_n_s1_writedata)
    );

  touch_panel_pen_irq_n the_touch_panel_pen_irq_n
    (
      .address    (touch_panel_pen_irq_n_s1_address),
      .chipselect (touch_panel_pen_irq_n_s1_chipselect),
      .clk        (clk_peripheral),
      .in_port    (in_port_to_the_touch_panel_pen_irq_n),
      .irq        (touch_panel_pen_irq_n_s1_irq),
      .readdata   (touch_panel_pen_irq_n_s1_readdata),
      .reset_n    (touch_panel_pen_irq_n_s1_reset_n),
      .write_n    (touch_panel_pen_irq_n_s1_write_n),
      .writedata  (touch_panel_pen_irq_n_s1_writedata)
    );

  touch_panel_spi_spi_control_port_arbitrator the_touch_panel_spi_spi_control_port
    (
      .clk                                                                     (clk_peripheral),
      .d1_touch_panel_spi_spi_control_port_end_xfer                            (d1_touch_panel_spi_spi_control_port_end_xfer),
      .peripheral_bridge_m1_address_to_slave                                   (peripheral_bridge_m1_address_to_slave),
      .peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port           (peripheral_bridge_m1_granted_touch_panel_spi_spi_control_port),
      .peripheral_bridge_m1_latency_counter                                    (peripheral_bridge_m1_latency_counter),
      .peripheral_bridge_m1_nativeaddress                                      (peripheral_bridge_m1_nativeaddress),
      .peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port (peripheral_bridge_m1_qualified_request_touch_panel_spi_spi_control_port),
      .peripheral_bridge_m1_read                                               (peripheral_bridge_m1_read),
      .peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port   (peripheral_bridge_m1_read_data_valid_touch_panel_spi_spi_control_port),
      .peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port          (peripheral_bridge_m1_requests_touch_panel_spi_spi_control_port),
      .peripheral_bridge_m1_write                                              (peripheral_bridge_m1_write),
      .peripheral_bridge_m1_writedata                                          (peripheral_bridge_m1_writedata),
      .reset_n                                                                 (clk_peripheral_reset_n),
      .touch_panel_spi_spi_control_port_address                                (touch_panel_spi_spi_control_port_address),
      .touch_panel_spi_spi_control_port_chipselect                             (touch_panel_spi_spi_control_port_chipselect),
      .touch_panel_spi_spi_control_port_dataavailable                          (touch_panel_spi_spi_control_port_dataavailable),
      .touch_panel_spi_spi_control_port_dataavailable_from_sa                  (touch_panel_spi_spi_control_port_dataavailable_from_sa),
      .touch_panel_spi_spi_control_port_endofpacket                            (touch_panel_spi_spi_control_port_endofpacket),
      .touch_panel_spi_spi_control_port_endofpacket_from_sa                    (touch_panel_spi_spi_control_port_endofpacket_from_sa),
      .touch_panel_spi_spi_control_port_irq                                    (touch_panel_spi_spi_control_port_irq),
      .touch_panel_spi_spi_control_port_irq_from_sa                            (touch_panel_spi_spi_control_port_irq_from_sa),
      .touch_panel_spi_spi_control_port_read_n                                 (touch_panel_spi_spi_control_port_read_n),
      .touch_panel_spi_spi_control_port_readdata                               (touch_panel_spi_spi_control_port_readdata),
      .touch_panel_spi_spi_control_port_readdata_from_sa                       (touch_panel_spi_spi_control_port_readdata_from_sa),
      .touch_panel_spi_spi_control_port_readyfordata                           (touch_panel_spi_spi_control_port_readyfordata),
      .touch_panel_spi_spi_control_port_readyfordata_from_sa                   (touch_panel_spi_spi_control_port_readyfordata_from_sa),
      .touch_panel_spi_spi_control_port_reset_n                                (touch_panel_spi_spi_control_port_reset_n),
      .touch_panel_spi_spi_control_port_write_n                                (touch_panel_spi_spi_control_port_write_n),
      .touch_panel_spi_spi_control_port_writedata                              (touch_panel_spi_spi_control_port_writedata)
    );

  touch_panel_spi the_touch_panel_spi
    (
      .MISO          (MISO_to_the_touch_panel_spi),
      .MOSI          (MOSI_from_the_touch_panel_spi),
      .SCLK          (SCLK_from_the_touch_panel_spi),
      .SS_n          (SS_n_from_the_touch_panel_spi),
      .clk           (clk_peripheral),
      .data_from_cpu (touch_panel_spi_spi_control_port_writedata),
      .data_to_cpu   (touch_panel_spi_spi_control_port_readdata),
      .dataavailable (touch_panel_spi_spi_control_port_dataavailable),
      .endofpacket   (touch_panel_spi_spi_control_port_endofpacket),
      .irq           (touch_panel_spi_spi_control_port_irq),
      .mem_addr      (touch_panel_spi_spi_control_port_address),
      .read_n        (touch_panel_spi_spi_control_port_read_n),
      .readyfordata  (touch_panel_spi_spi_control_port_readyfordata),
      .reset_n       (touch_panel_spi_spi_control_port_reset_n),
      .spi_select    (touch_panel_spi_spi_control_port_chipselect),
      .write_n       (touch_panel_spi_spi_control_port_write_n)
    );

  tri_state_bridge_flash_avalon_slave_arbitrator the_tri_state_bridge_flash_avalon_slave
    (
      .cfi_flash_s1_wait_counter_eq_0                                      (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                 (clk_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_cfi_flash_s1                             (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_dbs_address                                         (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_8                                         (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_cfi_flash_s1                                (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cfi_flash_s1                      (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cfi_flash_s1                        (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register (cpu_data_master_read_data_valid_peripheral_bridge_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_cfi_flash_s1                               (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                             (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                  (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                         (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_latency_counter                              (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cfi_flash_s1               (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_read                                         (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1                 (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register      (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_requests_cfi_flash_s1                        (cpu_instruction_master_requests_cfi_flash_s1),
      .d1_tri_state_bridge_flash_avalon_slave_end_xfer                     (d1_tri_state_bridge_flash_avalon_slave_end_xfer),
      .incoming_tri_state_bridge_flash_data                                (incoming_tri_state_bridge_flash_data),
      .incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0         (incoming_tri_state_bridge_flash_data_with_Xs_converted_to_0),
      .read_n_to_the_cfi_flash                                             (read_n_to_the_cfi_flash),
      .reset_n                                                             (clk_sys_reset_n),
      .select_n_to_the_cfi_flash                                           (select_n_to_the_cfi_flash),
      .tri_state_bridge_flash_address                                      (tri_state_bridge_flash_address),
      .tri_state_bridge_flash_data                                         (tri_state_bridge_flash_data),
      .write_n_to_the_cfi_flash                                            (write_n_to_the_cfi_flash)
    );

  video_sync_generator_in_arbitrator the_video_sync_generator_in
    (
      .clk                                   (clk_pixel),
      .pixel_converter_out_data              (pixel_converter_out_data),
      .pixel_converter_out_empty             (pixel_converter_out_empty),
      .pixel_converter_out_endofpacket       (pixel_converter_out_endofpacket),
      .pixel_converter_out_startofpacket     (pixel_converter_out_startofpacket),
      .pixel_converter_out_valid             (pixel_converter_out_valid),
      .reset_n                               (clk_pixel_reset_n),
      .video_sync_generator_in_data          (video_sync_generator_in_data),
      .video_sync_generator_in_empty         (video_sync_generator_in_empty),
      .video_sync_generator_in_endofpacket   (video_sync_generator_in_endofpacket),
      .video_sync_generator_in_ready         (video_sync_generator_in_ready),
      .video_sync_generator_in_ready_from_sa (video_sync_generator_in_ready_from_sa),
      .video_sync_generator_in_reset_n       (video_sync_generator_in_reset_n),
      .video_sync_generator_in_startofpacket (video_sync_generator_in_startofpacket),
      .video_sync_generator_in_valid         (video_sync_generator_in_valid)
    );

  video_sync_generator the_video_sync_generator
    (
      .DEN     (DEN_from_the_video_sync_generator),
      .HD      (HD_from_the_video_sync_generator),
      .RGB_OUT (RGB_OUT_from_the_video_sync_generator),
      .VD      (VD_from_the_video_sync_generator),
      .clk     (clk_pixel),
      .data    (video_sync_generator_in_data),
      .empty   (video_sync_generator_in_empty),
      .eop     (video_sync_generator_in_endofpacket),
      .ready   (video_sync_generator_in_ready),
      .reset_n (video_sync_generator_in_reset_n),
      .sop     (video_sync_generator_in_startofpacket),
      .valid   (video_sync_generator_in_valid)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_simple_reset_clk_sys_domain_synch_module nios_simple_reset_clk_sys_domain_synch
    (
      .clk      (clk_sys),
      .data_in  (1'b1),
      .data_out (clk_sys_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    0 |
    0 |
    0);

  //reset is asserted asynchronously and deasserted synchronously
  nios_simple_reset_clk_pixel_domain_synch_module nios_simple_reset_clk_pixel_domain_synch
    (
      .clk      (clk_pixel),
      .data_in  (1'b1),
      .data_out (clk_pixel_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_simple_reset_clk_peripheral_domain_synch_module nios_simple_reset_clk_peripheral_domain_synch
    (
      .clk      (clk_peripheral),
      .data_in  (1'b1),
      .data_out (clk_peripheral_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  nios_simple_reset_clk_ext_domain_synch_module nios_simple_reset_clk_ext_domain_synch
    (
      .clk      (clk_ext),
      .data_in  (1'b1),
      .data_out (clk_ext_reset_n),
      .reset_n  (reset_n_sources)
    );

  //nios_simple_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign nios_simple_clock_0_out_endofpacket = 0;

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_lane0_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 22: 0] rdaddress;
  input            rdclken;
  input   [ 22: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [8388607: 0];
  wire    [  7: 0] q;
  reg     [ 22: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 23,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash (
                   // inputs:
                    address,
                    read_n,
                    select_n,
                    write_n,

                   // outputs:
                    data
                 )
;

  inout   [  7: 0] data;
  input   [ 22: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [  7: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //cfi_flash_lane0, which is an e_ram
  cfi_flash_lane0_module cfi_flash_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? q_0: {8{1'bz}};

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/10.1/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/220model.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/sgate.v"
`include "pll.vo"
`include "ip/TERASIC_SRAM/TERASIC_SRAM.v"
`include "sram.v"
`include "pixel_converter.vo"
`include "sd_card_controller.v"
`include "video_sync_generator.vo"
`include "touch_panel_spi.v"
`include "descriptor_mem.v"
`include "sysid.v"
`include "sdram.v"
`include "sdram_test_component.v"
`include "touch_panel_busy.v"
`include "lcd_i2c_en.v"
`include "lcd_i2c_scl.v"
`include "fifo.v"
`include "jtag_uart.v"
`include "sys_clk_timer.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "timing_adapter.v"
`include "touch_panel_pen_irq_n.v"
`include "sgdma_pixel.v"
`include "lcd_i2c_sda.v"
`include "peripheral_bridge.v"
`include "nios_simple_clock_0.v"
`include "fifo_to_pixel_converter.v"
`include "fifo_to_pixel_converter_fifo.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             DEN_from_the_video_sync_generator;
  wire             HD_from_the_video_sync_generator;
  wire             MISO_to_the_touch_panel_spi;
  wire             MOSI_from_the_touch_panel_spi;
  wire    [ 23: 0] RGB_OUT_from_the_video_sync_generator;
  wire             SCLK_from_the_touch_panel_spi;
  wire    [ 19: 0] SRAM_ADDR_from_the_sram;
  wire             SRAM_CE_n_from_the_sram;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  wire             SRAM_LB_n_from_the_sram;
  wire             SRAM_OE_n_from_the_sram;
  wire             SRAM_UB_n_from_the_sram;
  wire             SRAM_WE_n_from_the_sram;
  wire             SS_n_from_the_touch_panel_spi;
  wire             VD_from_the_video_sync_generator;
  wire             bidir_port_to_and_from_the_lcd_i2c_sda;
  wire             clk;
  reg              clk_ext;
  wire             clk_peripheral;
  wire             clk_pixel;
  wire             clk_sdram;
  wire             clk_sys;
  wire             in_port_to_the_touch_panel_busy;
  wire             in_port_to_the_touch_panel_pen_irq_n;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             locked_from_the_pll;
  wire             nios_simple_clock_0_in_endofpacket_from_sa;
  wire             nios_simple_clock_0_out_endofpacket;
  wire    [  1: 0] nios_simple_clock_0_out_nativeaddress;
  wire             out_port_from_the_lcd_i2c_en;
  wire             out_port_from_the_lcd_i2c_scl;
  wire             peripheral_bridge_s1_endofpacket_from_sa;
  wire             phasedone_from_the_pll;
  wire             read_n_to_the_cfi_flash;
  reg              reset_n;
  wire             select_n_to_the_cfi_flash;
  wire             spi_clk_from_the_sd_card_controller;
  wire             spi_cs_n_from_the_sd_card_controller;
  wire             spi_data_in_to_the_sd_card_controller;
  wire             spi_data_out_from_the_sd_card_controller;
  wire             sysid_control_slave_clock;
  wire             touch_panel_spi_spi_control_port_dataavailable_from_sa;
  wire             touch_panel_spi_spi_control_port_readyfordata_from_sa;
  wire    [ 22: 0] tri_state_bridge_flash_address;
  wire    [  7: 0] tri_state_bridge_flash_data;
  wire             write_n_to_the_cfi_flash;
  wire    [ 12: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 31: 0] zs_dq_to_and_from_the_sdram;
  wire    [  3: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  nios_simple DUT
    (
      .DEN_from_the_video_sync_generator        (DEN_from_the_video_sync_generator),
      .HD_from_the_video_sync_generator         (HD_from_the_video_sync_generator),
      .MISO_to_the_touch_panel_spi              (MISO_to_the_touch_panel_spi),
      .MOSI_from_the_touch_panel_spi            (MOSI_from_the_touch_panel_spi),
      .RGB_OUT_from_the_video_sync_generator    (RGB_OUT_from_the_video_sync_generator),
      .SCLK_from_the_touch_panel_spi            (SCLK_from_the_touch_panel_spi),
      .SRAM_ADDR_from_the_sram                  (SRAM_ADDR_from_the_sram),
      .SRAM_CE_n_from_the_sram                  (SRAM_CE_n_from_the_sram),
      .SRAM_DQ_to_and_from_the_sram             (SRAM_DQ_to_and_from_the_sram),
      .SRAM_LB_n_from_the_sram                  (SRAM_LB_n_from_the_sram),
      .SRAM_OE_n_from_the_sram                  (SRAM_OE_n_from_the_sram),
      .SRAM_UB_n_from_the_sram                  (SRAM_UB_n_from_the_sram),
      .SRAM_WE_n_from_the_sram                  (SRAM_WE_n_from_the_sram),
      .SS_n_from_the_touch_panel_spi            (SS_n_from_the_touch_panel_spi),
      .VD_from_the_video_sync_generator         (VD_from_the_video_sync_generator),
      .bidir_port_to_and_from_the_lcd_i2c_sda   (bidir_port_to_and_from_the_lcd_i2c_sda),
      .clk_ext                                  (clk_ext),
      .clk_peripheral                           (clk_peripheral),
      .clk_pixel                                (clk_pixel),
      .clk_sdram                                (clk_sdram),
      .clk_sys                                  (clk_sys),
      .in_port_to_the_touch_panel_busy          (in_port_to_the_touch_panel_busy),
      .in_port_to_the_touch_panel_pen_irq_n     (in_port_to_the_touch_panel_pen_irq_n),
      .locked_from_the_pll                      (locked_from_the_pll),
      .out_port_from_the_lcd_i2c_en             (out_port_from_the_lcd_i2c_en),
      .out_port_from_the_lcd_i2c_scl            (out_port_from_the_lcd_i2c_scl),
      .phasedone_from_the_pll                   (phasedone_from_the_pll),
      .read_n_to_the_cfi_flash                  (read_n_to_the_cfi_flash),
      .reset_n                                  (reset_n),
      .select_n_to_the_cfi_flash                (select_n_to_the_cfi_flash),
      .spi_clk_from_the_sd_card_controller      (spi_clk_from_the_sd_card_controller),
      .spi_cs_n_from_the_sd_card_controller     (spi_cs_n_from_the_sd_card_controller),
      .spi_data_in_to_the_sd_card_controller    (spi_data_in_to_the_sd_card_controller),
      .spi_data_out_from_the_sd_card_controller (spi_data_out_from_the_sd_card_controller),
      .tri_state_bridge_flash_address           (tri_state_bridge_flash_address),
      .tri_state_bridge_flash_data              (tri_state_bridge_flash_data),
      .write_n_to_the_cfi_flash                 (write_n_to_the_cfi_flash),
      .zs_addr_from_the_sdram                   (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram                     (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram                  (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram                    (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram                   (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram              (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram                    (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram                  (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram                   (zs_we_n_from_the_sdram)
    );

  cfi_flash the_cfi_flash
    (
      .address  (tri_state_bridge_flash_address),
      .data     (tri_state_bridge_flash_data),
      .read_n   (read_n_to_the_cfi_flash),
      .select_n (select_n_to_the_cfi_flash),
      .write_n  (write_n_to_the_cfi_flash)
    );

  sdram_test_component the_sdram_test_component
    (
      .clk      (clk_sys),
      .zs_addr  (zs_addr_from_the_sdram),
      .zs_ba    (zs_ba_from_the_sdram),
      .zs_cas_n (zs_cas_n_from_the_sdram),
      .zs_cke   (zs_cke_from_the_sdram),
      .zs_cs_n  (zs_cs_n_from_the_sdram),
      .zs_dq    (zs_dq_to_and_from_the_sdram),
      .zs_dqm   (zs_dqm_from_the_sdram),
      .zs_ras_n (zs_ras_n_from_the_sdram),
      .zs_we_n  (zs_we_n_from_the_sdram)
    );

  initial
    clk_ext = 1'b0;
  always
    #10 clk_ext <= ~clk_ext;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on