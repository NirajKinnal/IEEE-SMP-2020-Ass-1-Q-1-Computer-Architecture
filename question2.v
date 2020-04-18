//testbench

module t_bench; 
 wire out;
 reg Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, a, b, c;
 m81 name(.Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .Y4(Y4), .Y5(Y5), .Y6(Y6), .Y7(Y7), .a(a), .b(b), c(c), .out(out)); 
 initial 
  begin
   Y0=1'b0;
   Y1=1'b0; 
   Y2=1'b0; 
   Y3=1'b0;
   Y4=1'b0;
   Y5=1'b0;
   Y6=1'b0;
   Y7=1'b0;
   a=1'b0;
   b=1'b0;
   c=1'b0; 
   #500
   $finish; 
  end 
 always #1 Y0=~Y0;
 always #2 Y1=~Y1;
 always #3 Y2=~Y2;
 always #4 Y3=~Y3;
 always #5 Y4=~Y4;
 always #6 Y5=~Y5;
 always #7 Y6=~Y6;
 always #8 Y7=~Y7;
 always #9 a=~a;
 always #10 b=~b;
 always #11 c=~c;
 always@(Y0 or Y1 or Y2 or Y3 or Y4 or Y5 or Y6 or Y7 or a or b or c) 
 $monitor("At time = %t, Output = %d", $time, out); 
endmodule;

//design
module 81multi(out, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, a, b, c);
 input wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, a, b, c;
 output reg out;
 always@(*)
 begin
  case(a & b & c)
   3'b000: out=Y0;
   3'b001: out=Y1;
   3'b010: out=Y2;
   3'b011: out=Y3;
   3'b100: out=Y4;
   3'b101: out=Y5;
   3'b110: out=Y6;
   3'b111: out=Y7;
   default: out=1'b0;
  endcase
 end
endmodule