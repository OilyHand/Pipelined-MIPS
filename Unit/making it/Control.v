module Control(
    input wire rst,
    input wire hazard_detected,
    input wire [5:0] opcode,
    input wire branch_equal,
    input wire [31:0] IF_PC,
    output reg [1:0] ALUOp,
    output reg ALUSrc, RegDst,
    output reg MemRead, MemWrite,
    output reg RegWrite, MemtoReg,
    output reg Branch,
    output reg IF_Flush
);
    
    always @* begin
      ALUSrc = 1'b0;
      RegDst = 1'b0;
      ALUOp = 2'b00;
      MemRead = 1'b0;
      MemWrite = 1'b0;
      RegWrite = 1'b0;
      MemtoReg = 1'b0;
      Branch = 1'b0;
      IF_Flush = 1'b0;
    
      if(!hazard_detected && !rst && !(IF_PC == 4)) begin
        case(opcode)
          6'b100011 : begin // LW instruction
                        ALUSrc = 1'b1;
                        MemRead = 1'b1;
                        RegWrite = 1'b1;
                        //MemtoReg = 1'b1; 
                      end
          6'b101011 : begin // SW instrtuction       
                        ALUSrc = 1'b1;
                        MemWrite = 1'b1;
                      end
          6'b001000 : begin // Addi instruction      
                        ALUSrc = 1'b1;
                        ALUOp = 2'b10;
                        RegWrite = 1'b1;
                        MemtoReg = 1'b1;
                      end
          6'b000100 : begin // BEQ instruction      
                        ALUOp = 1'b1;
                        Branch = (branch_equal == 1);
                        MemtoReg = 1'b1;
                        if(Branch) begin
                          IF_Flush = 1'b1;
                        end
                      end
          6'b000000 : begin // R-type instruction       
                        ALUOp = 2'b10;
                        RegDst = 1'b1;
                        RegWrite = 1'b1;
                        MemtoReg = 1'b1;
                      end
          default : begin
                          ALUSrc = 1'b0;
                          RegDst = 1'b0;
                          ALUOp = 2'b00;
                          MemRead = 1'b0;
                          MemWrite = 1'b0;
                          RegWrite = 1'b0;
                          MemtoReg = 1'b0;
                          Branch = 1'b0;
                          IF_Flush = 1'b0;
                     end
        endcase
      end
    end
endmodule
