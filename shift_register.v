module shift_register (
    input clk,
    input clken,
    input SI,
    output SO
);

parameter WIDTH = 8;
reg [WIDTH-1:0] shreg;

always @(posedge clk)
begin
    if (clken)
        shreg <= {shreg[WIDTH-2:0], SI};
end

assign SO = shreg[WIDTH-1];

endmodule
