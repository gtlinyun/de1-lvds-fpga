// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
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
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Mon Jun 17 20:35:29 2013
// ============================================================================

`define ENABLE_HPS
//`define ENABLE_USB

module DE1_SOC_golden_top(

//      ///////// ADC /////////
//      output             ADC_CS_N,
//      output             ADC_DIN,
//      input              ADC_DOUT,
//      output             ADC_SCLK,
//
//      ///////// AUD /////////
//      input              AUD_ADCDAT,
//      inout              AUD_ADCLRCK,
//      inout              AUD_BCLK,
//      output             AUD_DACDAT,
//      inout              AUD_DACLRCK,
//      output             AUD_XCK,

      ///////// CLOCK2 /////////
//      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
 //     input              CLOCK4_50,

      ///////// CLOCK /////////
 //     input              CLOCK_50,

//      ///////// DRAM /////////
//      output      [12:0] DRAM_ADDR,
//      output      [1:0]  DRAM_BA,
//      output             DRAM_CAS_N,
//      output             DRAM_CKE,
//      output             DRAM_CLK,
//      output             DRAM_CS_N,
//      inout       [15:0] DRAM_DQ,
//      output             DRAM_LDQM,
//      output             DRAM_RAS_N,
//      output             DRAM_UDQM,
//      output             DRAM_WE_N,
//
//      ///////// FAN /////////
//      output             FAN_CTRL,
//
//      ///////// FPGA /////////
//      output             FPGA_I2C_SCLK,
//      inout              FPGA_I2C_SDAT,

//      ///////// GPIO /////////
//      //inout       [35:0] GPIO_0,
//      //inout       [35:0] GPIO_1,
//
//      ///////// HEX0 /////////
//      output      [6:0]  HEX0,
//
//      ///////// HEX1 /////////
//      output      [6:0]  HEX1,
//
//      ///////// HEX2 /////////
//      output      [6:0]  HEX2,
//
//      ///////// HEX3 /////////
//      output      [6:0]  HEX3,
//
//      ///////// HEX4 /////////
//      output      [6:0]  HEX4,
//
//      ///////// HEX5 /////////
//      output      [6:0]  HEX5,

`ifdef ENABLE_HPS
      ///////// HPS /////////
//      input              HPS_CLOCK1_25,
//      input              HPS_CLOCK2_25,
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout       [1:0]  HPS_GPIO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LED,
//      input              HPS_RESET_N,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
//      output             HPS_WARM_RST_N,
`endif /*ENABLE_HPS*/

      ///////// IRDA /////////
      //input              IRDA_RXD,
      //output             IRDA_TXD,

      ///////// KEY /////////
      //input       [3:0]  KEY,

      ///////// LEDR /////////
      //output      [9:0]  LEDR,

//      ///////// PS2 /////////
//      inout              PS2_CLK,
//      inout              PS2_CLK2,
//      inout              PS2_DAT,
//      inout              PS2_DAT2,

      ///////// SW /////////
      //input       [9:0]  SW,

      ///////// TD /////////
 //     input              TD_CLK27,
//      input       [7:0]  TD_DATA,
//      input              TD_HS,
//      output             TD_RESET_N,
//      input              TD_VS,

//`ifdef ENABLE_USB
//      ///////// USB /////////
//      input              USB_B2_CLK,
//      inout       [7:0]  USB_B2_DATA,
//      output             USB_EMPTY,
//      output             USB_FULL,
//      input              USB_OE_N,
//      input              USB_RD_N,
//      input              USB_RESET_N,
//      inout              USB_SCL,
//      inout              USB_SDA,
//      input              USB_WR_N,
//`endif /*ENABLE_USB*/

//      ///////// VGA /////////
//      output             VGA_BLANK_N,
//      output      [7:0]  VGA_B,
//      output             VGA_CLK,
//      output      [7:0]  VGA_G,
//      output             VGA_HS,
//      output      [7:0]  VGA_R,
//      output             VGA_SYNC_N,
//      output             VGA_VS,
//		//////////D5M//////////////
//		//////////// GPIO0, GPIO0 connect to D5M - 5M Pixel Camera //////////
//	   input		   [11:0] D5M_D,
//      input		          D5M_FVAL,
//      input		          D5M_LVAL,
//      input		          D5M_PIXCLK,
//      output		       D5M_RESET_N,
//      output		       D5M_SCLK,
//      inout		          D5M_SDATA,
//      input		          D5M_STROBE,
//      output		       D5M_TRIGGER,
//      output		       D5M_XCLKIN,
		
//		//////////// GPIO1, GPIO1 connect to MTL - Multi-Touch LCD Panel //////////		
//		output		[7:0]  MTL_B,
//      output		       MTL_DCLK,
//      output		[7:0]  MTL_G,
//      output		       MTL_HSD,
//      output		[7:0]  MTL_R,
//      output		       MTL_TOUCH_I2C_SCL,
//      inout 		       MTL_TOUCH_I2C_SDA,
//      input 		       MTL_TOUCH_INT_n,
//      output		       MTL_VSD

		/////////////GPIO1 connect to lvds lcd panel////////////////	
      output             LVDS_CLK_OUT,
		output    [3:0]    LVDS_OUTPUT,
		output             LVDS_PWM_OUT,
		output             LVDS_CONTRAST
);
//=======================================================
//  REG/WIRE declarations
//=======================================================
wire clk_vga_33;

wire reset_n;

wire disp_hs;
wire disp_vs;


wire hps_fpga_reset_n;

//=======================================================
//  Structural coding
//=======================================================



assign reset_n = 1'b1;

///////////////////////
// VGA


//assign VGA_BLANK_N = 1'b1 ; //1'b1;
//assign VGA_SYNC_N  = 1'b0;
assign MTL_DCLK     = clk_vga_33;

assign MTL_HSD = ~disp_hs;
assign MTL_VSD = ~disp_vs;

//lvds design
		wire		[7:0]  MTL_B;
      //output		       MTL_DCLK,
      wire		[7:0]  MTL_G;
      wire		       MTL_HSD;
      wire		[7:0]  MTL_R;
      //output		       MTL_TOUCH_I2C_SCL,
      //inout 		       MTL_TOUCH_I2C_SDA,
      //input 		       MTL_TOUCH_INT_n,
      wire		       MTL_VSD;
		wire				LVDS_DE;
		
		
wire clk_lvds;
wire nonsense;
assign nonsense = 1;


wire [6:0]d0;
wire [6:0]d1;
wire [6:0]d2;
wire [6:0]d3;
wire [27:0]txin;

assign txin = ({d3,d2,d1,d0});

	image_out im1(
	.clk_in (clk_lvds),
	.data0(d0),
	.data1(d1),
	.data2(d2),
	.data3(d3),
	
	);

//nonsense,  MTL_B[7:6], MTL_G[7:6], MTL_B[7:6],

lvds_lcd lcd0(

	.tx_in				({ LVDS_DE, MTL_VSD, MTL_HSD, MTL_B[5:2],   MTL_B[1:0], MTL_G[5:1], 			MTL_G[0], MTL_R[5:0]  }), //(txin), //
	.tx_inclock		(clk_lvds),
	.tx_out				(LVDS_OUTPUT),				
	.tx_outclock	(LVDS_CLK_OUT),

);

assign LVDS_PWM_OUT = 1;


///////////////////////////////////////////
DE1_SoC_QSYS u0 (
	 
		  .clk_50                                 (CLOCK3_50),                                 //                       clk_50_clk_in.clk
        .reset_n                                (reset_n & hps_fpga_reset_n),                                //                 clk_50_clk_in_reset.reset_n
        
		  .clk_mtl_clk                              (clk_lvds),                          //                         altpll_0_c2.clk
		  
		  .alt_vip_itc_0_clocked_video_1_vid_clk       (clk_lvds ),       // alt_vip_itc_0_clocked_video_1.vid_clk
        .alt_vip_itc_0_clocked_video_1_vid_data      ({MTL_R,MTL_G,MTL_B}),      //                              .vid_data
        .alt_vip_itc_0_clocked_video_1_underflow     ( ),     //                              .underflow
        .alt_vip_itc_0_clocked_video_1_vid_datavalid ( LVDS_DE), //                              .vid_datavalid
        .alt_vip_itc_0_clocked_video_1_vid_v_sync    (disp_vs ),    //                              .vid_v_sync
        .alt_vip_itc_0_clocked_video_1_vid_h_sync    (disp_hs ),    //                              .vid_h_sync
        .alt_vip_itc_0_clocked_video_1_vid_f         ( ),         //                              .vid_f
        .alt_vip_itc_0_clocked_video_1_vid_h         ( ),         //                              .vid_h
        .alt_vip_itc_0_clocked_video_1_vid_v         ( ),          //                              .vid_v

	

        .hps_0_h2f_reset_reset_n               ( hps_fpga_reset_n ),                //                hps_0_h2f_reset.reset_n
		  
        .memory_mem_a                          ( HPS_DDR3_ADDR),                          //          memory.mem_a
        .memory_mem_ba                         ( HPS_DDR3_BA),                         //                .mem_ba
        .memory_mem_ck                         ( HPS_DDR3_CK_P),                         //                .mem_ck
        .memory_mem_ck_n                       ( HPS_DDR3_CK_N),                       //                .mem_ck_n
        .memory_mem_cke                        ( HPS_DDR3_CKE),                        //                .mem_cke
        .memory_mem_cs_n                       ( HPS_DDR3_CS_N),                       //                .mem_cs_n
        .memory_mem_ras_n                      ( HPS_DDR3_RAS_N),                      //                .mem_ras_n
        .memory_mem_cas_n                      ( HPS_DDR3_CAS_N),                      //                .mem_cas_n
        .memory_mem_we_n                       ( HPS_DDR3_WE_N),                       //                .mem_we_n
        .memory_mem_reset_n                    ( HPS_DDR3_RESET_N),                    //                .mem_reset_n
        .memory_mem_dq                         ( HPS_DDR3_DQ),                         //                .mem_dq
        .memory_mem_dqs                        ( HPS_DDR3_DQS_P),                        //                .mem_dqs
        .memory_mem_dqs_n                      ( HPS_DDR3_DQS_N),                      //                .mem_dqs_n
        .memory_mem_odt                        ( HPS_DDR3_ODT),                        //                .mem_odt
        .memory_mem_dm                         ( HPS_DDR3_DM),                         //                .mem_dm
        .memory_oct_rzqin                      ( HPS_DDR3_RZQ),                      //                .oct_rzqin

		  
	     .hps_io_hps_io_emac1_inst_TX_CLK ( HPS_ENET_GTX_CLK), //                   hps_0_hps_io.hps_io_emac1_inst_TX_CLK
        .hps_io_hps_io_emac1_inst_TXD0   ( HPS_ENET_TX_DATA[0] ),   //                               .hps_io_emac1_inst_TXD0
        .hps_io_hps_io_emac1_inst_TXD1   ( HPS_ENET_TX_DATA[1] ),   //                               .hps_io_emac1_inst_TXD1
        .hps_io_hps_io_emac1_inst_TXD2   ( HPS_ENET_TX_DATA[2] ),   //                               .hps_io_emac1_inst_TXD2
        .hps_io_hps_io_emac1_inst_TXD3   ( HPS_ENET_TX_DATA[3] ),   //                               .hps_io_emac1_inst_TXD3
        .hps_io_hps_io_emac1_inst_RXD0   ( HPS_ENET_RX_DATA[0] ),   //                               .hps_io_emac1_inst_RXD0
        .hps_io_hps_io_emac1_inst_MDIO   ( HPS_ENET_MDIO ),   //                               .hps_io_emac1_inst_MDIO
        .hps_io_hps_io_emac1_inst_MDC    ( HPS_ENET_MDC  ),    //                               .hps_io_emac1_inst_MDC
        .hps_io_hps_io_emac1_inst_RX_CTL ( HPS_ENET_RX_DV), //                               .hps_io_emac1_inst_RX_CTL
        .hps_io_hps_io_emac1_inst_TX_CTL ( HPS_ENET_TX_EN), //                               .hps_io_emac1_inst_TX_CTL
        .hps_io_hps_io_emac1_inst_RX_CLK ( HPS_ENET_RX_CLK), //                               .hps_io_emac1_inst_RX_CLK
        .hps_io_hps_io_emac1_inst_RXD1   ( HPS_ENET_RX_DATA[1] ),   //                               .hps_io_emac1_inst_RXD1
        .hps_io_hps_io_emac1_inst_RXD2   ( HPS_ENET_RX_DATA[2] ),   //                               .hps_io_emac1_inst_RXD2
        .hps_io_hps_io_emac1_inst_RXD3   ( HPS_ENET_RX_DATA[3] ),   //                               .hps_io_emac1_inst_RXD3
        
		  
		  .hps_io_hps_io_qspi_inst_IO0     ( HPS_FLASH_DATA[0]    ),     //                               .hps_io_qspi_inst_IO0
        .hps_io_hps_io_qspi_inst_IO1     ( HPS_FLASH_DATA[1]    ),     //                               .hps_io_qspi_inst_IO1
        .hps_io_hps_io_qspi_inst_IO2     ( HPS_FLASH_DATA[2]    ),     //                               .hps_io_qspi_inst_IO2
        .hps_io_hps_io_qspi_inst_IO3     ( HPS_FLASH_DATA[3]    ),     //                               .hps_io_qspi_inst_IO3
        .hps_io_hps_io_qspi_inst_SS0     ( HPS_FLASH_NCSO    ),     //                               .hps_io_qspi_inst_SS0
        .hps_io_hps_io_qspi_inst_CLK     ( HPS_FLASH_DCLK    ),     //                               .hps_io_qspi_inst_CLK
        
		  .hps_io_hps_io_sdio_inst_CMD     ( HPS_SD_CMD    ),     //                               .hps_io_sdio_inst_CMD
        .hps_io_hps_io_sdio_inst_D0      ( HPS_SD_DATA[0]     ),      //                               .hps_io_sdio_inst_D0
        .hps_io_hps_io_sdio_inst_D1      ( HPS_SD_DATA[1]     ),      //                               .hps_io_sdio_inst_D1
        .hps_io_hps_io_sdio_inst_CLK     ( HPS_SD_CLK   ),     //                               .hps_io_sdio_inst_CLK
        .hps_io_hps_io_sdio_inst_D2      ( HPS_SD_DATA[2]     ),      //                               .hps_io_sdio_inst_D2
        .hps_io_hps_io_sdio_inst_D3      ( HPS_SD_DATA[3]     ),      //                               .hps_io_sdio_inst_D3
        	
		  .hps_io_hps_io_usb1_inst_D0      ( HPS_USB_DATA[0]    ),      //                               .hps_io_usb1_inst_D0
        .hps_io_hps_io_usb1_inst_D1      ( HPS_USB_DATA[1]    ),      //                               .hps_io_usb1_inst_D1
        .hps_io_hps_io_usb1_inst_D2      ( HPS_USB_DATA[2]    ),      //                               .hps_io_usb1_inst_D2
        .hps_io_hps_io_usb1_inst_D3      ( HPS_USB_DATA[3]    ),      //                               .hps_io_usb1_inst_D3
        .hps_io_hps_io_usb1_inst_D4      ( HPS_USB_DATA[4]    ),      //                               .hps_io_usb1_inst_D4
        .hps_io_hps_io_usb1_inst_D5      ( HPS_USB_DATA[5]    ),      //                               .hps_io_usb1_inst_D5
        .hps_io_hps_io_usb1_inst_D6      ( HPS_USB_DATA[6]    ),      //                               .hps_io_usb1_inst_D6
        .hps_io_hps_io_usb1_inst_D7      ( HPS_USB_DATA[7]    ),      //                               .hps_io_usb1_inst_D7
        .hps_io_hps_io_usb1_inst_CLK     ( HPS_USB_CLKOUT    ),     //                               .hps_io_usb1_inst_CLK
        .hps_io_hps_io_usb1_inst_STP     ( HPS_USB_STP    ),     //                               .hps_io_usb1_inst_STP
        .hps_io_hps_io_usb1_inst_DIR     ( HPS_USB_DIR    ),     //                               .hps_io_usb1_inst_DIR
        .hps_io_hps_io_usb1_inst_NXT     ( HPS_USB_NXT    ),     //                               .hps_io_usb1_inst_NXT
        		  
		  .hps_io_hps_io_spim1_inst_CLK    ( HPS_SPIM_CLK  ),    //                               .hps_io_spim1_inst_CLK
        .hps_io_hps_io_spim1_inst_MOSI   ( HPS_SPIM_MOSI ),   //                               .hps_io_spim1_inst_MOSI
        .hps_io_hps_io_spim1_inst_MISO   ( HPS_SPIM_MISO ),   //                               .hps_io_spim1_inst_MISO
        .hps_io_hps_io_spim1_inst_SS0    ( HPS_SPIM_SS ),    //                               .hps_io_spim1_inst_SS0
      	
		  .hps_io_hps_io_uart0_inst_RX     ( HPS_UART_RX    ),     //                               .hps_io_uart0_inst_RX
        .hps_io_hps_io_uart0_inst_TX     ( HPS_UART_TX    ),     //                               .hps_io_uart0_inst_TX
		
		  .hps_io_hps_io_i2c0_inst_SDA     ( HPS_I2C1_SDAT    ),     //                               .hps_io_i2c0_inst_SDA
        .hps_io_hps_io_i2c0_inst_SCL     ( HPS_I2C1_SCLK    ),     //                               .hps_io_i2c0_inst_SCL
		
		  .hps_io_hps_io_i2c1_inst_SDA     ( HPS_I2C2_SDAT    ),     //                               .hps_io_i2c1_inst_SDA
        .hps_io_hps_io_i2c1_inst_SCL     ( HPS_I2C2_SCLK    ),     //                               .hps_io_i2c1_inst_SCL
        
		  .hps_io_hps_io_gpio_inst_GPIO09  ( HPS_CONV_USB_N),  //                               .hps_io_gpio_inst_GPIO09
        .hps_io_hps_io_gpio_inst_GPIO35  ( HPS_ENET_INT_N),  //                               .hps_io_gpio_inst_GPIO35
        .hps_io_hps_io_gpio_inst_GPIO40  ( HPS_GPIO[0]),  //                               .hps_io_gpio_inst_GPIO40
        .hps_io_hps_io_gpio_inst_GPIO41  ( HPS_GPIO[1]),  //                               .hps_io_gpio_inst_GPIO41
        .hps_io_hps_io_gpio_inst_GPIO48  ( HPS_I2C_CONTROL),  //                               .hps_io_gpio_inst_GPIO48
        .hps_io_hps_io_gpio_inst_GPIO53  ( HPS_LED),  //                               .hps_io_gpio_inst_GPIO53
        .hps_io_hps_io_gpio_inst_GPIO54  ( HPS_KEY),  //                               .hps_io_gpio_inst_GPIO54
        .hps_io_hps_io_gpio_inst_GPIO61  ( HPS_GSENSOR_INT),  //                               .hps_io_gpio_inst_GPIO6	  
		  .mtl_touch_end_I2C_SDA           (MTL_TOUCH_I2C_SDA ),                       //                 mtl_touch_end.I2C_SDA
        .mtl_touch_end_I2C_SCL           (MTL_TOUCH_I2C_SCL),                       //                              .I2C_SCL
        .mtl_touch_end_INT_n             (MTL_TOUCH_INT_n ),                          //                              .INT_n
		  //.mtl_touch_end_led_out           (LEDR)
		  
		  
    );

					
endmodule
