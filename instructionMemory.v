module instructionMemory(
input   [31:0] addressBus,
output  [31:0] instruction
);

reg [31:0] mem [1023:0]; // 1024 registers of size 32 bits , 4KB instruction memory

initial
begin
    mem[0] = 32'h20090064;//addi $t1,$zero,100
    mem[1] = 32'h200a00c8;//addi $t2,$zero,200
    mem[2] = 32'h012a5820;//add $t3,$t1,$t2
    mem[3] = 32'hac0b0004;//sw $t3,4
end

assign instruction =  mem[addressBus[31:2]];//word alignment , address multiple of 4, each word is of 4 Bytes 


endmodule