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
   parameter int pwm_depth  = 4;
   parameter int pwm_inner_depth = 3;

   localparam int addrmax = length * (1 << scan_bit) - 1;

   input logic    clk;
   input logic    reset;

   output logic [$clog2(addrmax+1)-1:0] addr;
   input logic [(bitdepth*3)-1:0]       data1, data2;

   output logic [2:0]                   rgb1, rgb2;
   output logic                         sclk, latch, oe_b;
   output logic [scan_bit-1:0]          select;

   logic [$clog2(addrmax+1)-1:0]        addr_start;
   logic [$clog2(divider+1)-1:0]        cycle;
   logic [$clog2(length)-1:0]           pos;

   logic [pwm_depth-1:0]                pwm_cycle;
   logic [pwm_depth-pwm_inner_depth-1:0] pwm_outer_cycle;
   logic [pwm_inner_depth-1:0]           pwm_inner_cycle;

   logic [scan_bit-1:0]                 row, select_next;

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

always_ff @(posedge clk)
  if (reset)
    sclk <= 0;
  else if (sclk_rising)
    sclk <= 1'b1;
  else if (sclk_falling)
    sclk <= 1'b0;

generate
   logic [pwm_depth-1:0]                pwm_cycle_delayed;
   always @(posedge clk)      // delay by one clock to match timing of data returning from RAM
     pwm_cycle_delayed <= pwm_cycle;

   for (genvar color = 0; color < 3; color++) begin
      logic [bitdepth-1:0] colorbits1, colorbits2;
      assign colorbits1 = data1[(color+1)*bitdepth-1:color*bitdepth];
      assign colorbits2  = data2[(color+1)*bitdepth-1:color*bitdepth];

      assign rgb1[color] = colorbits1 > pwm_cycle_delayed;
      assign rgb2[color] = colorbits2 > pwm_cycle_delayed;
   end
endgenerate

   logic                   last_pos;

assign last_pos = pos == length - 1;

   logic                   pwm_inner_cycle_done;
   logic                   pwm_outer_cycle_last;

assign pwm_outer_cycle_last = pwm_outer_cycle == ((1 << (pwm_depth - pwm_inner_depth)) - 1);
assign pwm_inner_cycle_done = pwm_inner_cycle == (pwm_outer_cycle_last ? ((1 << pwm_inner_depth) - 2) : ((1 << pwm_inner_depth) - 1));
assign pwm_cycle = {pwm_inner_cycle[pwm_inner_depth-1], pwm_outer_cycle, pwm_inner_cycle[pwm_inner_depth-2:0]};

always_ff @(posedge clk)
  if (reset) begin
     pos             <= 0;
     addr            <= 0;
     addr_start      <= 0;
     pwm_inner_cycle <= 0;
     pwm_outer_cycle <= 0;
     row             <= 0;
  end
  else if (new_cycle) begin
     pos  <= pos + 1;
     addr <= addr + 1;

     if (last_pos) begin
        pos       <= 0;
        pwm_inner_cycle <= pwm_inner_cycle + 1;

        if (!pwm_inner_cycle_done)
          addr     <= addr_start;
        else begin
           pwm_inner_cycle   <= 0;
           row <= row + 1;
           if (addr == addrmax) begin
              addr            <= 0;
              addr_start      <= 0;
              row             <= 0;
              pwm_outer_cycle <= pwm_outer_cycle + 1;
           end else begin
              addr_start <= addr + 1;
           end
        end
     end
  end


   enum { OUTPUT_OFF, LATCHING, LATCHED, OUTPUT_ON } state;

always_ff @(posedge clk)
  if (reset) begin
     state  <= OUTPUT_ON;
     oe_b   <= 1'b1;
     latch  <= 1'b0;
     select <= '{default: 1'b1};
  end
  else if (sclk_rising) begin
     if (state == OUTPUT_ON && pos == length - 2) begin
        state       <= OUTPUT_OFF;
        oe_b        <= 1'b1;
        latch       <= 1'b0;
        select_next <= row;
     end
     else if (state == OUTPUT_OFF) begin
        state <= LATCHING;
        oe_b  <= 1'b1;
        latch <= 1'b1;
     end
     else if (state == LATCHING) begin
        state  <= LATCHED;
        oe_b   <= 1'b1;
        latch  <= 1'b0;
        select <= select_next;
     end
     else if (state == LATCHED) begin
        state <= OUTPUT_ON;
        oe_b  <= 1'b0;
        latch <= 1'b0;
     end
  end

endmodule
