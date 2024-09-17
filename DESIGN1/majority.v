module majority(data, y);
  parameter size=8;
  input [size-1:0]data;
  output reg y;
  integer k;
  reg [3:0]count;
  always@(data)begin
    count=0;
    for(k=0;k<size;k=k+1)begin
      if(data[k]==1)
       count=count+1;
    end
    y = (count >= 5); 
  end
endmodule
