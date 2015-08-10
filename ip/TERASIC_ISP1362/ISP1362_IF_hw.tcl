# TCL File Generated by Component Editor 13.0dp
# Wed Jul 24 15:25:34 CST 2013
# DO NOT MODIFY


# 
# ISP1362_IF "ISP1362_IF" v1.0
#  2013.07.24.15:25:34
# 
# 

# 
# request TCL package from ACDS 13.0
# 
package require -exact qsys 13.0


# 
# module ISP1362_IF
# 
set_module_property DESCRIPTION ""
set_module_property NAME ISP1362_IF
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Terasic Technologies Inc./"
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME ISP1362_IF
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL ISP1362_IF
set_fileset_property quartus_synth ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file ISP1362_IF.v VERILOG PATH ISP1362_IF.v TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point hc_clock
# 
add_interface hc_clock clock end
set_interface_property hc_clock clockRate 0
set_interface_property hc_clock ENABLED true
set_interface_property hc_clock EXPORT_OF ""
set_interface_property hc_clock PORT_NAME_MAP ""
set_interface_property hc_clock SVD_ADDRESS_GROUP ""

add_interface_port hc_clock avs_hc_clk_iCLK clk Input 1


# 
# connection point hc_clock_reset
# 
add_interface hc_clock_reset reset end
set_interface_property hc_clock_reset associatedClock hc_clock
set_interface_property hc_clock_reset synchronousEdges DEASSERT
set_interface_property hc_clock_reset ENABLED true
set_interface_property hc_clock_reset EXPORT_OF ""
set_interface_property hc_clock_reset PORT_NAME_MAP ""
set_interface_property hc_clock_reset SVD_ADDRESS_GROUP ""

add_interface_port hc_clock_reset avs_hc_reset_n_iRST_N reset_n Input 1


# 
# connection point hc
# 
add_interface hc avalon end
set_interface_property hc addressAlignment NATIVE
set_interface_property hc addressUnits WORDS
set_interface_property hc associatedClock hc_clock
set_interface_property hc associatedReset hc_clock_reset
set_interface_property hc bitsPerSymbol 8
set_interface_property hc burstOnBurstBoundariesOnly false
set_interface_property hc burstcountUnits WORDS
set_interface_property hc explicitAddressSpan 0
set_interface_property hc holdTime 140
set_interface_property hc linewrapBursts false
set_interface_property hc maximumPendingReadTransactions 0
set_interface_property hc readLatency 0
set_interface_property hc readWaitStates 50
set_interface_property hc readWaitTime 50
set_interface_property hc setupTime 140
set_interface_property hc timingUnits Nanoseconds
set_interface_property hc writeWaitStates 50
set_interface_property hc writeWaitTime 50
set_interface_property hc ENABLED true
set_interface_property hc EXPORT_OF ""
set_interface_property hc PORT_NAME_MAP ""
set_interface_property hc SVD_ADDRESS_GROUP ""

add_interface_port hc avs_hc_writedata_iDATA writedata Input 16
add_interface_port hc avs_hc_readdata_oDATA readdata Output 16
add_interface_port hc avs_hc_address_iADDR address Input 1
add_interface_port hc avs_hc_read_n_iRD_N read_n Input 1
add_interface_port hc avs_hc_write_n_iWR_N write_n Input 1
add_interface_port hc avs_hc_chipselect_n_iCS_N chipselect_n Input 1
set_interface_assignment hc embeddedsw.configuration.isFlash 0
set_interface_assignment hc embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment hc embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment hc embeddedsw.configuration.isPrintableDevice 0


# 
# connection point hc_irq
# 
add_interface hc_irq interrupt end
set_interface_property hc_irq associatedAddressablePoint hc
set_interface_property hc_irq associatedClock hc_clock
set_interface_property hc_irq associatedReset hc_clock_reset
set_interface_property hc_irq ENABLED true
set_interface_property hc_irq EXPORT_OF ""
set_interface_property hc_irq PORT_NAME_MAP ""
set_interface_property hc_irq SVD_ADDRESS_GROUP ""

add_interface_port hc_irq avs_hc_irq_n_oINT0_N irq_n Output 1


# 
# connection point dc_clock
# 
add_interface dc_clock clock end
set_interface_property dc_clock clockRate 0
set_interface_property dc_clock ENABLED true
set_interface_property dc_clock EXPORT_OF ""
set_interface_property dc_clock PORT_NAME_MAP ""
set_interface_property dc_clock SVD_ADDRESS_GROUP ""

add_interface_port dc_clock avs_dc_clk_iCLK clk Input 1


# 
# connection point dc_clock_reset
# 
add_interface dc_clock_reset reset end
set_interface_property dc_clock_reset associatedClock dc_clock
set_interface_property dc_clock_reset synchronousEdges DEASSERT
set_interface_property dc_clock_reset ENABLED true
set_interface_property dc_clock_reset EXPORT_OF ""
set_interface_property dc_clock_reset PORT_NAME_MAP ""
set_interface_property dc_clock_reset SVD_ADDRESS_GROUP ""

add_interface_port dc_clock_reset avs_dc_reset_n_iRST_N reset_n Input 1


# 
# connection point dc
# 
add_interface dc avalon end
set_interface_property dc addressAlignment NATIVE
set_interface_property dc addressUnits WORDS
set_interface_property dc associatedClock dc_clock
set_interface_property dc associatedReset dc_clock_reset
set_interface_property dc bitsPerSymbol 8
set_interface_property dc burstOnBurstBoundariesOnly false
set_interface_property dc burstcountUnits WORDS
set_interface_property dc explicitAddressSpan 0
set_interface_property dc holdTime 150
set_interface_property dc linewrapBursts false
set_interface_property dc maximumPendingReadTransactions 0
set_interface_property dc readLatency 0
set_interface_property dc readWaitStates 150
set_interface_property dc readWaitTime 150
set_interface_property dc setupTime 150
set_interface_property dc timingUnits Nanoseconds
set_interface_property dc writeWaitStates 150
set_interface_property dc writeWaitTime 150
set_interface_property dc ENABLED true
set_interface_property dc EXPORT_OF ""
set_interface_property dc PORT_NAME_MAP ""
set_interface_property dc SVD_ADDRESS_GROUP ""

add_interface_port dc avs_dc_writedata_iDATA writedata Input 16
add_interface_port dc avs_dc_readdata_oDATA readdata Output 16
add_interface_port dc avs_dc_address_iADDR address Input 1
add_interface_port dc avs_dc_read_n_iRD_N read_n Input 1
add_interface_port dc avs_dc_write_n_iWR_N write_n Input 1
add_interface_port dc avs_dc_chipselect_n_iCS_N chipselect_n Input 1
set_interface_assignment dc embeddedsw.configuration.isFlash 0
set_interface_assignment dc embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment dc embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment dc embeddedsw.configuration.isPrintableDevice 0


# 
# connection point dc_irq
# 
add_interface dc_irq interrupt end
set_interface_property dc_irq associatedAddressablePoint dc
set_interface_property dc_irq associatedClock dc_clock
set_interface_property dc_irq associatedReset dc_clock_reset
set_interface_property dc_irq ENABLED true
set_interface_property dc_irq EXPORT_OF ""
set_interface_property dc_irq PORT_NAME_MAP ""
set_interface_property dc_irq SVD_ADDRESS_GROUP ""

add_interface_port dc_irq avs_dc_irq_n_oINT0_N irq_n Output 1


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock ""
set_interface_property conduit_end associatedReset ""
set_interface_property conduit_end ENABLED true
set_interface_property conduit_end EXPORT_OF ""
set_interface_property conduit_end PORT_NAME_MAP ""
set_interface_property conduit_end SVD_ADDRESS_GROUP ""

add_interface_port conduit_end USB_DATA export Bidir 16
add_interface_port conduit_end USB_ADDR export Output 2
add_interface_port conduit_end USB_RD_N export Output 1
add_interface_port conduit_end USB_WR_N export Output 1
add_interface_port conduit_end USB_CS_N export Output 1
add_interface_port conduit_end USB_RST_N export Output 1
add_interface_port conduit_end USB_INT0 export Input 1
add_interface_port conduit_end USB_INT1 export Input 1

