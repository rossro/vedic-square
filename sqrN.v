// Perform square using Vedic mathematics for N bits input (N=2,4,8,16,...)
// Can be useful under the unverified assumption that Synthesis tools won't optimize
// the special case of square operation (A*A)
module sqrN #(parameter N = 8) (input [N-1:0] in, output [2*N-1:0] out);
   // recursive generation of squaring half the number of bits down to squaring 2 bits
   generate
      if (N > 2)
      begin
         wire [N-1:0] y;
         sqrN #(.N(N/2)) sqr_y (.in(in[N/2-1:0]), .out(y));
   
         wire [N-1:0] x;
         sqrN #(.N(N/2)) sqr_x (.in(in[N-1:N/2]), .out(x));
   
         // For simplicity, standard multiplication operator is used instead of a Vedic multiplier.
         // It is assumed (unverified) that Synthesis tools fully optimize standard A*B multiplier
         wire [N-1:0] z;
         assign z = in[N/2-1:0] * in[N-1:N/2];
         
         wire [N:0] r;
         assign r = {z,1'b0} + y[N-1:N/2];
         
         wire [N-1:0] t;
         assign t = x + r[N:N/2];
         
         assign out = {t, r[N/2-1:0], y[N/2-1:0]};
      end else begin
         sqr2 sqr2_ins(.in(in), .out(out));
      end
   endgenerate
endmodule

module sqr2 (input [1:0] in, output [3:0] out);
   assign out[0] = in[0];
   assign out[1] = 1'b0;
   assign out[3:2] = (in[0] & in[1]) + in[1];
endmodule

