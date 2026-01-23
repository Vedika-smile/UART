module baudrate_gen (clk, tx_enb, rx_enb);
 input clk;
 output tx_enb, rx_enb;
 reg [12:0] tx_counter;
 reg [9:0] rx_counter;

 always @(posedge clk)
  begin 
   if (tx_counter == 5208) tx_counter = 0;
   else tx_counter = tx_counter + 1;
  end

 always @(posedge clk)
  begin
   if(rx_counter == 325) rx_counter = 0;
   else rx_counter = rx_counter +1 ;
  end

 assign tx_enb = (tx_counter == 0) ? 1 : 0;
 assign rx_enb = (rx_counter == 0) ? 1 : 0;
 
endmodule