module image_out(
	clk_in,
   data0,
	data1,
	data2,
	data3
	
);


input wire clk_in;
output wire [6:0] data0;
output wire  [6:0] data1;
output wire [6:0]  data2;
output wire [6:0]  data3;

//	//-- display parameters
//	parameter htotal = 1440; 		//-- screen size, with back porch
//	parameter hfront  = 48; 			//-- front porch
//	parameter hactive = 1280; 		//-- display size
//	parameter hback = 80;
//	parameter hwh = 32;				//
//	reg [10:0] hcurrent = 0;  				// : integer range 0 to htotal := 0;:
//	parameter vtotal = 823;					// : integer := 823; -- screen size, with back porch
//	parameter vfront = 2;					// : integer := 0; -- front porch
//	parameter vactive = 800;				// : integer := 768; -- display size
//	parameter vback = 15;					//back porch
//	parameter vwv = 6;	
//	reg [10:0] vcurrent = 0;					// : integer range 0 to vtotal := 0;

	//-- display parameters
	parameter htotal = 1404; 		//-- screen size, with back porch
	parameter hfront  = 48; 			//-- front porch
	parameter hactive = 1280; 		//-- display size
	parameter hback = 44;
	parameter hwh = 32;				//
	reg [10:0] hcurrent = 0;  				// : integer range 0 to htotal := 0;:
	parameter vtotal = 823;					// : integer := 823; -- screen size, with back porch
	parameter vfront = 4;					// : integer := 0; -- front porch
	parameter vactive = 800;				// : integer := 768; -- display size
	parameter vback = 12;					//back porch
	parameter vwv = 7;	
	reg [10:0] vcurrent = 0;					// : integer range 0 to vtotal := 0;
	
	
	parameter [7:0] red = 8'b00000000;
	parameter [7:0] green = 8'b11111111;
	parameter [7:0] blue = 8'b00000000;
	
	reg vsync;
	reg hsync;
	reg de;
	parameter nonsense = 1;
	
   //assign dataenable = vsync & hsync;
	assign data0 = ({green[0], red[6:0]});
	assign data1 = ({blue[1:0], green[5:0]});
	assign data2 = ({de, vsync, hsync, blue[5:2]});
	assign data3 = ({nonsense, blue[7:6], green[7:6], red[7:6]});
 
always@ (posedge clk_in )	
	begin
	
	if (hcurrent < hwh)
		hsync <= 0;
	else
		hsync <= 1;		
		
	if (vcurrent < vwv)	
		vsync <= 0;	
	else
		vsync <= 1;
		
		if(hcurrent < hwh+hback || hcurrent >= htotal - hfront || vcurrent < vwv+vback || vcurrent >= vtotal-vfront)
			de <= 0;
		else
			de <= 1;
		
	if (hcurrent == htotal)	
		begin
			hcurrent <= 0;
			
			if (vcurrent == vtotal)
				vcurrent <= 0;
			else
				vcurrent <= vcurrent + 1;
		end
	else
			hcurrent <= hcurrent + 1;
		
	end
endmodule




//module image_out(
//input wire clk_in,
//output wire dataenable,
//output wire hsyn,
//output wire vsyn
//);
//
//
//	//-- display parameters
//	parameter htotal = 1440; 		//-- screen size, with back porch
//	parameter hfront  = 48; 			//-- front porch
//	parameter hactive = 1280; 		//-- display size
//	parameter hback = 80;
//	parameter hwh = 32;				//
//	reg [10:0] hcurrent = 0;  				// : integer range 0 to htotal := 0;:
//	parameter vtotal = 823;					// : integer := 823; -- screen size, with back porch
//	parameter vfront = 2;					// : integer := 0; -- front porch
//	parameter vactive = 800;				// : integer := 768; -- display size
//	parameter vback = 15;					//back porch
//	parameter vwv = 6;	
//	reg [10:0] vcurrent = 0;					// : integer range 0 to vtotal := 0;
//
////	//-- display parameters
////	parameter htotal = 100; 		//-- screen size, with back porch
////	parameter hfront  = 10; 			//-- front porch
////	parameter hactive = 60; 		//-- display size
////	parameter hback = 20;
////	parameter hwh = 10;				//
////	reg [10:0] hcurrent = 0;  				// : integer range 0 to htotal := 0;:
////	parameter vtotal = 80;					// : integer := 823; -- screen size, with back porch
////	parameter vfront = 5;					// : integer := 0; -- front porch
////	parameter vactive = 50;				// : integer := 768; -- display size
////	parameter vback = 20;					//back porch
////	parameter vwv = 5;	
////	reg [10:0] vcurrent = 0;					// : integer range 0 to vtotal := 0;
//	
//	
//	parameter [7:0] red = 8'b00000000;
//	parameter [7:0] green = 8'b11111111;
//	parameter [7:0] blue = 8'b00000000;
//	
//	reg vsync = 0;
//	reg hsync;
//	reg de;
//	//wire dataenable;
//	parameter nonsense = 1;
//	
//	//wire vsync;
//	//wire hsync;
//	
//   assign dataenable = de;
//	assign vsyn  = vsync;
//	assign hsyn = hsync;
//
//
//always@ (posedge clk_in )	
//	begin
//	
//	if (hcurrent < hwh)
//		hsync <= 0;
//	else
//		hsync <= 1;		
//		
//	if (vcurrent < vwv)	
//		vsync <= 0;	
//	else
//		vsync <= 1;
//		
//		if(hcurrent < hwh+hback || hcurrent >= htotal - hfront || vcurrent < vwv+vback || vcurrent >= vtotal-vfront)
//			de <= 0;
//		else
//			de <= 1;
//		
//	if (hcurrent == htotal)	
//		begin
//			hcurrent <= 0;
//			
//			if (vcurrent == vtotal)
//				vcurrent <= 0;
//			else
//				vcurrent <= vcurrent + 1;
//		end
//	else
//			hcurrent <= hcurrent + 1;
//		
//	end
//endmodule
