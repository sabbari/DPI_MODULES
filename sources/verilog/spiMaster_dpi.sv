

module spiMaster_dpi(
    output reg spi_clk_o,
    output reg spi_mosi_o,
    output reg spi_cs_o,
    input spi_miso_i,
    input sys_clk
);

parameter port = 1234;
parameter blocking = 0;




import "DPI-C" context function int spi_master( output bit spi_cs,
                                             output bit spi_sclk,
                                             output bit spi_mosi,
                                             input  bit spi_miso,
                                             input  int port,
                                             input  int blocking);  



initial 
    begin 
        spi_cs_o    =1;
        spi_clk_o   =1;
        spi_mosi_o  =0;
    end

always @(posedge sys_clk)
begin

	spi_master(spi_cs_o,spi_clk_o,spi_mosi_o,spi_miso_i,port,blocking);
    	
end
endmodule

