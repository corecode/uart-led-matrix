module platform(clk, rst);
   output logic clk;
   output logic rst;

parameter osc_freq = 1.0;

initial begin
   clk      = 0;
   #30 clk  = 1;
   forever
     #5 clk  = !clk;
end

initial begin
   rst    = 1;
   #50 rst    = 0;
end
endmodule

module ram (WrAddress, RdAddress, Data, ByteEn, WE, RdClock, RdClockEn, Reset,
            WrClock, WrClockEn, Q)/* synthesis NGD_DRC_MASK=1 */;
   input wire [4:0] WrAddress;
   input wire [4:0] RdAddress;
   input wire [2:0] ByteEn;
   input wire [23:0] Data;
   input wire        WE;
   input wire        RdClock;
   input wire        RdClockEn;
   input wire        Reset;
   input wire        WrClock;
   input wire        WrClockEn;
   output wire [23:0] Q;

   bit [23:0]         ram [0:63] = '{default: 8'h00};

always_ff @(posedge WrClock)
  if (WrClockEn && WE) begin
     ram[WrAddress]  = {ByteEn[2] ? Data[23:16] : ram[WrAddress][23:16],
                        ByteEn[1] ? Data[15:8] : ram[WrAddress][15:8],
                        ByteEn[0] ? Data[7:0] : ram[WrAddress][7:0]};
  end

assign Q = ram[RdAddress];

endmodule

module top_tb;

   logic rx;
   logic [2:0] rgb1, rgb2;
   logic       latch, sclk, oe_b;
   logic [1:0] select;

   logic [7:0] led;

initial
  #100000 $finish;

task uart_send(logic [7:0] val);
   automatic logic [9:0] word  = {1'b1, val[7:0], 1'b0};
   for (int i = 0; i < 10; i = i + 1) begin
      rx = word[i];
      #(16*13*10);
   end;
endtask

initial begin
   rx       = 1;
   #1040 rx  = 0;
   #500 rx  = 1;
   #2000 uart_send(8'h41);
   uart_send(8'h20);
   uart_send(8'hc0);
end

top uut(.*);
defparam uut.uart_divider = 12;
defparam uut.width  = 8;
defparam uut.scan_bit = 2;

endmodule
