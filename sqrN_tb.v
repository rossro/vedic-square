`define N 8

module testbench;
   reg [`N-1:0] in;
   wire [2*`N-1:0] out;
   integer i;

   // Instantiate the sqrN module with N=8
   sqrN #(.N(`N)) uut (
         .in(in),
         .out(out)
      );

   initial begin
      // Monitor the input and output values
      $monitor("in = %d, out = %d, expected = %0d, delta = %0d", in, out, i**2, i**2-out);

      // Loop through all possible 8-bit values
      for (i = 0; i < 1<<`N; i = i + 1) begin
         in = i;
         #10;
      end

      $finish;
   end
endmodule
