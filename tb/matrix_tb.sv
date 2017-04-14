module matrix_tb;

   localparam scan = 2;

   logic clk;
   logic reset;
   logic [4:0] addr;
   logic [23:0] data1, data2;
   logic [2:0] rgb1, rgb2;
   logic       sclk, latch, oe_b;
   logic [scan-1:0] select;

initial
  #10000 $finish;

initial begin
   clk      = 0;
   #30 clk  = 1;
   forever
     #5 clk  = !clk;
end

initial begin
   reset    = 1;
   #50 reset    = 0;
end

// task send(logic [7:0] val, logic set_latch);
//    data  = val;
//    latch = set_latch;
//    do begin
//       @(posedge clk);
//    end while (next == 0);
// endtask


// initial begin
//    latch  = 1;
//    #1133;

//    for (int i = 0; i < 3; i++) begin
//       send(i, 0);
//    end
//    send(0, 1);
//    #50;
//    send('h55, 0);
//    send(0, 1);
// end

always_ff @(posedge clk) begin
   data1 <= addr;
   data2 <= ~addr;
end

matrix #(.divider(3), .length(5), .scan_bit(scan)) uut(.*);

endmodule
