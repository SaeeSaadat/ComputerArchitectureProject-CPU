//altfp_div CBX_SINGLE_OUTPUT_FILE="ON" WIDTH_EXP=8 WIDTH_MAN=23 clock dataa datab
//VERSION_BEGIN 13.0 cbx_mgl 2013:06:12:18:05:10:SJ cbx_stratixii 2013:06:12:18:03:43:SJ cbx_util_mgl 2013:06:12:18:03:43:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2013 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.



//synthesis_resources = altfp_div 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mg5d7
	( 
	clock,
	dataa,
	datab) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [31:0]  dataa;
	input   [31:0]  datab;


	altfp_div   mgl_prim1
	( 
	.clock(clock),
	.dataa(dataa),
	.datab(datab));
	defparam
		mgl_prim1.width_exp = 8,
		mgl_prim1.width_man = 23;
endmodule //mg5d7
//VALID FILE
