module matrix
  (
   clk,
   reset,
   addr,
   data1,
   data2,
   rgb1,
   rgb2,
   sclk,
   latch,
   oe_b,
   select
   );

   parameter int divider  = 3;
   parameter int length  = 5;
   parameter int bitdepth  = 8;
   parameter int scan_bit  = 3;

   localparam int addrmax = length * (1 << scan_bit) - 1;

   input logic    clk;
   input logic    reset;

   output logic [$clog2(addrmax+1)-1:0] addr;
   input logic [(bitdepth*3)-1:0]       data1, data2;

   output logic [2:0]                   rgb1, rgb2;
   output logic                         sclk, latch, oe_b;
   output logic [scan_bit-1:0]          select;

   logic [$clog2(divider+1)-1:0]        cycle;
   logic [$clog2(length+5)-1:0]           pos;
   logic [scan_bit-1:0]                 line;

   logic                                new_cycle;
   logic                                sclk_rising, sclk_falling;

assign new_cycle = cycle == divider;

always_ff @(posedge clk)
  if (reset)
    cycle <= 0;
  else
    if (new_cycle)
      cycle <= 0;
    else
      cycle <= cycle + 1;

assign sclk_rising = cycle == divider / 2 + 1;
assign sclk_falling = cycle == 0;

   logic                                sclk_int, sclk_gate;

always_ff @(posedge clk)
  if (reset)
    sclk_int <= 0;
  else if (sclk_rising)
    sclk_int <= 1'b1;
  else if (sclk_falling)
    sclk_int <= 1'b0;

always_ff @(posedge clk)
  if (reset)
    pos <= 0;
  else if (sclk_rising)
    if (pos == length + 5)
      pos <= 0;
    else
      pos <= pos + 1;

always_ff @(posedge clk)
  if (reset)
    line <= 0;
  else if (sclk_rising && pos == length + 5)
    line <= line + 1;

assign sclk_gate = pos < length;
assign sclk = sclk_gate & sclk_int;

   logic                                pixel;
assign pixel = line == 0 && pos == 0;
assign rgb1 = {1'b0, pixel, 1'b0};

assign latch = pos == length + 2 || pos == length + 3;

assign rgb2 = 3'b000;
assign oe_b = 1'b0;
assign select = 4'd1;
assign addr = 0;

endmodule
