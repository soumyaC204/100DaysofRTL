module clock_generator;
  reg clk;

  initial begin
    $dumpfile("clock_generator");
    $dumpvars(0, clock_generator);
  end

  parameter half_cycle = 50;
  
  initial begin
    clk = 0;
    forever begin
      #half_cycle clk = ~clk;
    end
  end

  initial begin
    #350 $finish;
  end

  initial begin
    $monitor("Time = %0t | clk = %b", 
             $time, clk);
  end
endmodule
