module UART_TX ( tx, busy, clk, wr_enb, enb, rst, data_in)
 output reg tx;
 output busy;
 input clk, wr_enb, rst, enb;
 input [7:0] data_in;

 reg [7:0] data;
 reg [2:0] index;
 reg [1:0] state;
 parameter idle=2'b00, start=2'b01, data=2'b10, stop=2'b11;
 

 always @(posedge clk)
  begin
   if (rst) tx = 1'b1;
  end
 
 always @(posedge clk)
  begin
   case (state)
    idle: if (wr_enb) 
           begin
	    state <= start;
	    data <= data_in;
            index <= 3'h0;
  	   end
    start: begin
	    if (enb)
             begin
 	      tx <= 1'b0;
              state <= data;
             end
            else
             state <= start;
           end
    data: 
     begin
      if (enb)
       begin
        if (index == 1'h7)
         state < = stop;
        else
         index = index +1;
        tx <= data [index];
       end
     end
 
    stop : 
     begin
      if (enb)
       begin 
        tx <= 1'b1;
        state <= idle;
       end
     end
    default: begin
      tx<= 1'b1;
      state <= idle;
     end
   endcase
  end

 assign busy = (state != idle) ? 1 : 0;

endmodule 

     
    
 		      