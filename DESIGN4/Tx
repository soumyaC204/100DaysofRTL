module tx(rst,clk,tx,data_in,start,ready);
input rst,clk,start;
output reg tx;
output reg ready;
input [7:0]data_in;
reg [9:0]shift_reg;
reg [15:0]baud_counter;
reg [3:0]bit_counter;

parameter baud_rate=10416;
always @(posedge clk)begin
    if(reset)begin
        ready<=1;
        tx<=1;
        baud_counter=0;
        bit_counter=0;
    end
    else if(start & ready)begin
        ready<=0;
        shift_reg={1'b1,data_in,1'b0};
         bit_counter <= 10;
    end
        else if(ready==0)begin
            if(baud_rate==baud_counter)begin
                tx<=shift_reg[0];
                shift_reg=shift_reg>>1;
                baud_counter=0;
                bit_counter=bit_counter-1;
                if(bit_counter==0) 
                ready<=1;
            end
            else
            begin
            baud_counter=baud_counter+1;
            end
            end
        end
endmodule
 


