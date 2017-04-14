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

   input logic   clk;
   input logic   reset;

   output logic [$clog2(addrmax+1)-1:0] addr;
   input logic [(bitdepth*3)-1:0]   data1, data2;

   output logic [2:0] rgb1, rgb2;
   output logic       sclk, latch, oe_b;
   output logic [scan_bit-1:0] select;

   logic [$clog2(divider+1)-1:0] cycle;
   logic [$clog2(length)-1:0] pos;

   logic                      new_cycle;
   logic                      sclk_rising, sclk_falling;

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

always_ff @(posedge clk)
  if (reset)
    sclk <= 0;
  else if (sclk_rising)
    sclk <= 1'b1;
  else if (sclk_falling)
    sclk <= 1'b0;

generate
for (genvar color = 0; color < 3; color++) begin
   logic [bitdepth-1:0] colorbits1, colorbits2;
   assign colorbits1 = data1[(color+1)*bitdepth-1:color*bitdepth];
   assign colorbits2  = data2[(color+1)*bitdepth-1:color*bitdepth];

   assign rgb1[color] = colorbits1[0];
   assign rgb2[color] = colorbits2[0];
end
endgenerate

   logic                      last_pos;

assign last_pos = pos == length - 1;

always_ff @(posedge clk)
  if (reset)
    pos <= 0;
  else if (new_cycle)
    if (last_pos)
      pos <= 0;
    else
      pos <= pos + 1;

always_ff @(posedge clk)
  if (reset)
    addr <= 0;
  else if (new_cycle)           // XXX one ahead?
    if (addr == addrmax)
      addr <= 0;
    else
      addr <= addr + 1;

   enum { OUTPUT_OFF, LATCHING, LATCHED, OUTPUT_ON } state;

always_ff @(posedge clk)
  if (reset) begin
     state <= OUTPUT_ON;
     oe_b  <= 1'b1;
     latch <= 1'b0;
     select <= '{default: 1'b1};
  end
  else if (sclk_rising) begin
     if (state == OUTPUT_ON && pos == length - 2) begin
        state <= OUTPUT_OFF;
        oe_b <= 1'b1;
        latch <= 1'b0;
     end
     else if (state == OUTPUT_OFF) begin
        state <= LATCHING;
        oe_b  <= 1'b1;
        latch <= 1'b1;
     end
     else if (state == LATCHING) begin
        state <= LATCHED;
        oe_b  <= 1'b1;
        latch <= 1'b0;
        select <= select + 1;
     end
     else if (state == LATCHED) begin
        state <= OUTPUT_ON;
        oe_b  <= 1'b0;
        latch <= 1'b0;
     end
  end

endmodule
