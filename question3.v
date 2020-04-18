

//Test bench
module dec;
  reg a,b,c,EN,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15;
  
  164decoder val(a,b,c,EN,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15);
  initial
    begin
      #10 assign a = 1;
      #10 assign b = 1;
      #10 assign c = 1;
      #10 assign EN = 0;
      #5 $display("Input binary number - ",EN,c,b,a);
      #5 $display("Output decimal number - ");
      #5 $display(Y0*0);
      #5 $display(Y1*1);
      #5 $display(Y2*2);
      #5 $display(Y3*3);
      #5 $display(Y4*4);
      #5 $display(Y5*5);
      #5 $display(Y6*6);
      #5 $display(Y7*7);
      #5 $display(Y8*8);
      #5 $display(Y9*9);
      #5 $display(Y10*10);
      #5 $display(Y11*11);
      #5 $display(Y12*12);
      #5 $display(Y13*13);
      #5 $display(Y14*14);
      #5 $display(Y15*15);  
    end
endmodule

//design

module 38decoder(a,b,c,EN,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
  input a,b,c,EN;
  output Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
  
  assign Y0 = ~EN & ~c & ~b & ~a;
  assign Y1 = ~EN & ~c & ~b & a;
  assign Y2 = ~EN & ~c & b & ~a;
  assign Y3 = ~EN & ~c & b & a;
  assign Y4 = ~EN & c & ~b & ~a;
  assign Y5 = ~EN & c & ~b & a;
  assign Y6 = ~EN & c & b & ~a;
  assign Y7 = ~EN & c & b & a;
  
endmodule

module 164decoder(a,b,c,EN,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15);
  input a, b, c,EN;
  output Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15;
  
  38decoder d1(a,b,c,EN,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
  38decoder d2(a,b,c,~EN,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15);
endmodule