
module alu(input [31:0] a, input[31:0] b,output[31:0] Result,input[1:0] ALUControl,output z,output n,output v,output c,output [31:0]slt);
  wire [31:0] a_and_b;
  wire [31:0] a_or_b;
  wire [31:0] not_b;
  wire [31:0]  mux_result;
  wire [31:0] sum;
  wire cout;
  
  assign a_and_b=a&b;
   assign a_or_b=a|b;
   assign not_b=~b;
  assign mux_result=(ALUControl[0]==0)?b:not_b;
  assign {cout,sum}=a+mux_result+ALUControl[0];
  assign Result=(ALUControl==2'b00)?sum:(ALUControl==2'b01)?sum:(ALUControl==2'b10)?a_and_b:a_or_b;
  
    
  assign z=&(~Result);
  assign n=Result[31];
  assign c=cout&(~ALUControl[1]);
  assign v=(~ALUControl[1])&(a[31]^sum[31])&(~(a[31]^ALUControl[0]));
  assign slt={31'b000000000000000000000000000000000000,sum[31]};
  
endmodule
  
