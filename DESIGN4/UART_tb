module uart_tb;

  reg clk;
  reg reset;
  reg [7:0] data_in;
  reg start;
  wire tx;
  wire ready_tx;

  wire rx;
  wire [7:0] data_out;
  wire ready_rx;

  uart_tx Tx (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .start(start),
    .tx(tx),
    .ready(ready_tx)
  );

  uart_rx RX (
    .clk(clk),
    .reset(reset),
    .rx(tx),
    .data_out(data_out),
    .ready(ready_rx)
  );

  initial begin
    clk = 0;
    reset = 1;
    data_in = 8'h55;
    start = 0;
    #5 reset = 0;
    #20 start = 1;
    #10 start = 0;
    #2000 $finish;
  end

  always #5 clk = ~clk;

endmodule
