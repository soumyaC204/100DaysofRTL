module uart_rx(
    input clk,
    input reset,
    input rx,
    output reg [7:0] data_out,
    output reg ready
);

  reg [3:0] bit_counter;
  reg [9:0] shift_reg;
  reg [15:0] baud_counter;
  reg receiving;

  parameter BAUD_RATE = 10416;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      ready <= 0;
      bit_counter <= 0;
      baud_counter <= 0;
      receiving <= 0;
    end else if (!receiving && rx == 0) begin
      receiving <= 1;
      baud_counter <= 0;
      bit_counter <= 0;
    end else if (receiving) begin
      if (baud_counter == BAUD_RATE) begin
        baud_counter <= 0;
        shift_reg <= {rx, shift_reg[9:1]};
        bit_counter <= bit_counter + 1;
        if (bit_counter == 9) begin
          data_out <= shift_reg[8:1];
          ready <= 1;
          receiving <= 0;
        end
      end else begin
        baud_counter <= baud_counter + 1;
      end
    end
  end
endmodule
