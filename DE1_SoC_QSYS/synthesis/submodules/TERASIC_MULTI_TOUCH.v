// --------------------------------------------------------------------
// Copyright (c) 2011 by Terasic Technologies Inc. 
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



`include "./i2c_touch_config.v"
`include "./touch_fifo.v"


module TERASIC_MULTI_TOUCH(
	clk, 
	reset_n,
	
	// irq
	irq_n,
	
	// avalon mm slave port
	s_cs,
	s_address,
	s_read,
	s_readdata,
	s_write,
	s_writedata,
	
	// Touch
	TOUCH_I2C_SDA,
	TOUCH_I2C_SCL,
	TOUCH_INT_n
	
);

input							clk;
input							reset_n;

// irq
output	reg				irq_n;

// avalon mm slave port
input							s_cs;
input	[4:0]					s_address;
input							s_read;
output	reg	[15:0]	s_readdata;
input							s_write;
input				[15:0]	s_writedata;

// Touch
inout							TOUCH_I2C_SDA;
output						TOUCH_I2C_SCL;
input							TOUCH_INT_n;


///////////////////////////////////////
// avalon mm slave
`define MTC_REG_CLEAR_FIFO    	0		// write only (write any value to clear fifo)
`define MTC_REG_INT_ACK		   	1		// write only (write any value to ack)
`define MTC_REG_DATA_NUM			2		// read only
`define MTC_REG_TOUCH_NUM			3		// read only
`define MTC_REG_X1					4		// read only
`define MTC_REG_Y1					5		// read only
`define MTC_REG_X2					6		// read only
`define MTC_REG_Y2					7		// read only
`define MTC_REG_GESTURE				8		// read only
`define MTC_REG_TOTAL_TOUCH_CNT	9		// read/write (write any value to clear counter)

reg [15:0] addr_X1,addr_Y1;
reg [7:0]  gesture_EVENT;
always @ (posedge clk)
begin
	if (s_cs & s_read)
	begin
		if (s_address == `MTC_REG_DATA_NUM)
			s_readdata <= 16'd40;//{10'h0, usedw};
		else if (s_address == `MTC_REG_TOUCH_NUM)
			s_readdata <= 16'd60;//{14'h0, fifo_q[73:72]};
		else if (s_address == `MTC_REG_X1)
			s_readdata <= addr_X1;//fifo_q[15:0];
		else if (s_address == `MTC_REG_Y1)
			s_readdata <= addr_Y1;//fifo_q[31:16];
		else if (s_address == `MTC_REG_X2)
			s_readdata <=16'd120;// fifo_q[47:32];
		else if (s_address == `MTC_REG_Y2)
			s_readdata <= 16'd150;//fifo_q[63:48];
		else if (s_address == `MTC_REG_GESTURE)
			s_readdata <= {8'h00, gesture_EVENT};
		else if (s_address == `MTC_REG_TOTAL_TOUCH_CNT)
			s_readdata <= 16'd200;//total_touch_cnt;
	end
end
wire nios_fifo_reset;
assign nios_fifo_reset = (s_cs && (s_address == `MTC_REG_CLEAR_FIFO) && s_write)?1'b1:1'b0;

wire nios_int_ack;
assign nios_int_ack = (s_cs && (s_address == `MTC_REG_INT_ACK) && s_write)?1'b1:1'b0;

wire nios_total_count_clear;
assign nios_total_count_clear = (s_cs && (s_address == `MTC_REG_TOTAL_TOUCH_CNT) && s_write)?1'b1:1'b0;


///////////////////////////////////////
// avalon irq

wire gen_irq_n;
assign gen_irq_n = (usedw > 0 && irq_n)?1'b1:1'b0;

always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		irq_n <= 1'b1;
   else if (~irq_n)		
		irq_n <= nios_int_ack; // restore it because we just generate trigger signal
	else if (gen_irq_n)
		irq_n <= 1'b0;
end

always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		begin
			addr_X1<=16'b0;
			addr_Y1<=16'b0;
			gesture_EVENT<=8'b0;
		end
   else if (~pre_ready & ready)
		begin
			addr_X1<=x1;
			addr_Y1<=y1;
			gesture_EVENT<=gesture;
		end
end
 
///////////////////////////////////////
// i2c contorl
wire 	ready;
wire [15:0]	x1;
wire [15:0]	y1;
wire [15:0]	x2;
wire [15:0]	y2;
wire [1:0]	touch_count;
wire [7:0]	gesture;

i2c_touch_config	 i2c_touch_config_inst(	
            // Host Side
						.iCLK(clk),
						.iRSTN(reset_n),
						.iTRIG(~TOUCH_INT_n),
						.oREADY(ready),
						.oREG_X1(x1),								
						.oREG_Y1(y1),								
						.oREG_X2(x2),								
						.oREG_Y2(y2),								
						.oREG_TOUCH_COUNT(touch_count),								
						.oREG_GESTURE(gesture),								
						// I2C Side
						.I2C_SCLK(TOUCH_I2C_SCL),
						.I2C_SDAT(TOUCH_I2C_SDA)
);

//////////////////////////
// fifo: data with = 16x4+8+8=64+16 = 80 bits
wire [79:0]	fifo_data;
wire [79:0]	fifo_q;
wire fifo_sclr;
wire fifo_rdreq;
wire fifo_wrreg;
wire fifo_almost_full;
wire [5:0]	usedw;

reg	pre_ready;
always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		pre_ready <= 1'b0;
	else
		pre_ready <= ready;
end

assign fifo_data = {6'h0, touch_count,gesture ,y2 ,x2 ,y1 ,x1};
assign fifo_sclr = (~reset_n | nios_fifo_reset)?1'b1:1'b0;
assign fifo_rdreq = nios_int_ack;
assign fifo_wrreg = ~pre_ready & ready & ~fifo_almost_full;

touch_fifo touch_fifo_inst(
	.clock(clk),
	.data(fifo_data),
	.rdreq(fifo_rdreq),
	.sclr(fifo_sclr),
	.wrreq(fifo_wrreg),
	.almost_full(fifo_almost_full),
	.empty(),
	.full(),
	.q(fifo_q),
	.usedw(usedw)
	);

//////////////////////////////////////////

reg [15:0]	total_touch_cnt;
always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		total_touch_cnt <= 0;
	else if (nios_total_count_clear)	
		total_touch_cnt <= 0;
	else if (~pre_ready & ready)
		total_touch_cnt <= total_touch_cnt + 1;
end

endmodule

