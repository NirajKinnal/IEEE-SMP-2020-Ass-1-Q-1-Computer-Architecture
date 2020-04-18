module 3:8decoder_tb;

 reg x;
 reg y;
 reg z;
 reg EN;
 wire Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
 

 reg [2:0] count = 3'd0;

 
 decoder3to8 uut (.x(x), .y(y), .z(z), .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .Y4(Y4), .Y5(Y5), .Y6(Y6), .Y7(Y7), .EN(EN) );

 initial begin

  x = 1'b0;

  y = 1'b0;

  z = 1'b0;

  EN = 1'b0;

  #100;

  EN = 1'b1;

  #20;

  for (count = 0; count < 8; count = count + 1'b1)

  begin

   {x,y,z} = {x,y,z} + 1'b1;

   #20;

  end

  EN = 1'b0;

 end      

endmodule



//design

module 3:8decoder ( x, y, z, Y1, Y2, Y3, Y4, Y5, Y6, Y7, EN ); 
 input  x, y, z;
 input EN; 
 output reg Y0=0, Y1=0, Y2=0, Y3=0, Y4=0, Y5=0, Y6=0, Y7=0; 

 always @ (EN, z, y, x) 
    begin 

      Y0=0;
      Y1=0;
      Y2=0;
      Y3=0;
      Y4=0;
      Y5=0;
      Y6=0;
      Y7=0; 

      if (EN==1'b1) 

        begin 

          case ({z,y,x}) 

          3'b000: Y0=1; 
          3'b001: Y1=1; 
          3 'b010: Y2=1; 
          3'b011: Y3=1; 
          3'b100: Y4=1; 
          3'b101: Y5=1; 
          3'b110: Y6=1; 
          3'b111: Y7=1; 

          default: begin 

            Y0=0;

            Y1=0;

            Y2=0;
            
            Y3=0;

            Y4=0;

            Y5=0;

            Y6=0;

            Y7=0; 

         end 

    endcase 

   end 

 end

endmodule
