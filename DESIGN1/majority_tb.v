// Code your testbench here
// or browse Examples
module majority_tb;
  reg [7:0]data;
 
  wire y;

  majority m (
    .data(data),.y(y)
  );

  initial begin

    $dumpfile("majority_tb.vcd");
    $dumpvars(0, majority_tb);
   
    #10 data=15;
     #10 data=25;
     #10 data=95;
     #10 data=5;
     #10 data=3;
    #100 $finish;
  end

  initial begin
    $monitor("Time = %0t | data = %b| y = %b", 
             $time, data,y);
  end
endmodule
