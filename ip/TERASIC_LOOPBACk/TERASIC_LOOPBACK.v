module TERASIC_LOOPBACK(
	clk,
	reset_n,
	// avalon mm slave
	s_cs,
	s_read,
	s_readdata,
	s_write,
	s_writedata,
	//
	lb_in,
	lb_out
);

parameter PAIR_NUM	= 32;
parameter PAIR_BIR	= 1;

input							clk;
input							reset_n;
//
input							s_cs;
input							s_read;
input							s_write;
output	reg	[(PAIR_NUM-1):0]	s_readdata;
input	[(PAIR_NUM-1):0]		s_writedata;
//
inout	[(PAIR_NUM-1):0]		lb_in;
inout	[(PAIR_NUM-1):0]		lb_out;


//============================================
always @ (posedge clk)
begin
	if (s_cs & s_write)
		test_reset_n <= s_writedata[0];
	else if (s_cs & s_read)
		s_readdata <= lb_error;
end


//============================================
// combin logic


//============================================
reg		[(PAIR_NUM-1):0]	test_mask;
wire	[(PAIR_NUM-1):0]	test_in;
wire	[(PAIR_NUM-1):0]	test_out;
reg 						test_reset_n;
reg 						test_done;
wire						test_value_invert;
wire						test_dir_invert;
reg		[(PAIR_NUM-1):0]	lb_error;
reg		[1:0]				test_case;

	
assign test_in = (test_value_invert)?(test_dir_invert?~lb_out:~lb_in):(test_dir_invert?lb_out:lb_in);
assign lb_out = (test_dir_invert)?{PAIR_NUM{1'bz}}:(test_value_invert?~test_out:test_out);
assign lb_in = (test_dir_invert)?(test_value_invert?~test_out:test_out):{PAIR_NUM{1'bz}};

assign test_out = test_mask;
assign {test_dir_invert, test_value_invert} = {PAIR_BIR?test_case[1]:1'b0,test_case[0]};

always @ (posedge clk or negedge test_reset_n)
begin
	if (~test_reset_n)
	begin
		lb_error <= 'b0;
		test_mask <= 'b1;
		test_case <= 2'b00;
	end
	else
	begin
		//	update mask
		if (test_mask == (1 << (PAIR_NUM-1)))
		begin
			test_mask <= 'b1;
			test_case <= test_case + 1;
		end
		else
			test_mask <= (test_mask << 1);
			
		//  check loopback
		if ((test_in & test_mask) != test_out)
			lb_error <= lb_error | test_mask;
			
	end
end



endmodule

