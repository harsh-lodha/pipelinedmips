module register #(parameter regAddr=0)(
input   i_clk,
input   En,
input   [31:0] DataIn,
output  [31:0] DataOut
);

reg [31:0] mipsReg;

initial 
begin
    mipsReg <= 32'd0; // non-blocking assignment operator; used in sequential logic
end

assign DataOut = mipsReg;

always @(posedge i_clk)
begin
    if(En & regAddr !=0) //regAddr = 0 is for zero register $zero
        mipsReg <= DataIn;
end

endmodule