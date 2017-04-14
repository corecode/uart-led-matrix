module top
  (
   led,
   rx,
   rgb1,
   rgb2,
   sclk,
   latch,
   oe_b,
   select
   );

parameter osc_freq = 19.0;
parameter osc_freq_str = "19.0";
parameter uart_rate = 19200;
parameter uart_oversample = 15;
parameter uart_divider = int'(osc_freq * 1e6 / (uart_oversample + 1) / uart_rate) - 1;
parameter matrix_freq = 25e6;

parameter width = 64;
parameter scan_bit = 4;
localparam scan = 1 << scan_bit;
localparam length = width * scan;
localparam length_bit = $clog2(length);
localparam matrix_divider = int'(osc_freq * 1e6 + matrix_freq - 1) / int'(matrix_freq) - 1;

   input logic rx;

   output logic [2:0] rgb1, rgb2;
   output logic       latch, sclk, oe_b;
   output logic [scan_bit-1:0] select;

   output logic [7:0]          led;

   logic                       clk, reset;

   logic [7:0]                 uart_data;
   logic                       uart_data_ready;

   logic                       recv_strobe, recv_restart;
   logic [length_bit-1:0]      recv_addr;
   logic                       recv_bottom_half;
   logic [2:0]                 recv_byte_en;
   logic [7:0]                 recv_data;

   logic [length_bit-1:0]      send_addr; // we use two rams
   logic [23:0]                send_data1, send_data2;

assign led = uart_data;

platform #(.osc_freq(osc_freq_str))
platform(.clk(clk),
         .rst(reset));

uart #(.divider(uart_divider), .oversample(uart_oversample))
uart(.data(uart_data),
     .data_ready(uart_data_ready),
     .*);

always_ff @(posedge clk)
  if (reset) begin
     recv_addr    <= 0;
     recv_byte_en <= 3'b001;
     recv_bottom_half <= 1;
  end else begin
     if (recv_strobe) begin
        if (recv_byte_en == 3'b100) begin
           if (recv_addr == length - 1) begin
              recv_addr        <= 0;
              recv_bottom_half <= ~recv_bottom_half;
           end else
             recv_addr        <= recv_addr + 1;
        end
        recv_byte_en <= {recv_byte_en[1:0], recv_byte_en[2]};
     end
     if (recv_restart) begin
        recv_addr    <= 0;
        recv_byte_en <= 3'b001;
        recv_bottom_half <= 1;
     end
  end

receive #(.addr_size(10))
receive(.data(uart_data),
        .data_ready(uart_data_ready),
        .addr(),
        .length(),
        .data_out(recv_data),
        .write_strobe(recv_strobe),
        .ready(recv_restart), .*);

ram ram1(.WrAddress(recv_addr),
         .RdAddress(send_addr),
         .Data({recv_data, recv_data, recv_data}),
         .ByteEn(recv_byte_en),
         .WE(recv_strobe & recv_bottom_half),
         .RdClock(clk),
         .RdClockEn(1'b1),
         .Reset(reset),
         .WrClock(clk),
         .WrClockEn(1'b1),
         .Q(send_data1));

ram ram2(.WrAddress(recv_addr),
         .RdAddress(send_addr),
         .Data({recv_data, recv_data, recv_data}),
         .ByteEn(recv_byte_en),
         .WE(recv_strobe & ~recv_bottom_half),
         .RdClock(clk),
         .RdClockEn(1'b1),
         .Reset(reset),
         .WrClock(clk),
         .WrClockEn(1'b1),
         .Q(send_data2));

matrix #(.divider(),
         .length(width),
         .scan_bit(scan_bit))
matrix(.addr(send_addr),
       .data1(send_data1),
       .data2(send_data2),
       .*);


endmodule
