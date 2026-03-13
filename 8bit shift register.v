module shift_register(
    input clk,
    input reset,
    input load,
    input shift_dir,      // 0 = left shift, 1 = right shift
    input [7:0] data_in,
    output reg [7:0] q
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        q <= 8'b00000000;

    else if(load)
        q <= data_in;      // Parallel load

    else begin
        if(shift_dir == 0)
            q <= {q[6:0],1'b0};   // Shift left
        else
            q <= {1'b0,q[7:1]};   // Shift right
    end
end

endmodule
