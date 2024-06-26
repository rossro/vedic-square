# vedic-square
Verilog implementation of square operation using Vedic mathematics
Perform square (A*A) using Vedic mathematics for N bits input (N=2,4,8,16,...)
Can be useful under the unverified assumption that Synthesis tools won't properly optimize the special case of square operation (A*A)

Testbench output for N=4
in =  0, out =   0, expected = 0, delta = 0
in =  1, out =   1, expected = 1, delta = 0
in =  2, out =   4, expected = 4, delta = 0
in =  3, out =   9, expected = 9, delta = 0
in =  4, out =  16, expected = 16, delta = 0
in =  5, out =  25, expected = 25, delta = 0
in =  6, out =  36, expected = 36, delta = 0
in =  7, out =  49, expected = 49, delta = 0
in =  8, out =  64, expected = 64, delta = 0
in =  9, out =  81, expected = 81, delta = 0
in = 10, out = 100, expected = 100, delta = 0
in = 11, out = 121, expected = 121, delta = 0
in = 12, out = 144, expected = 144, delta = 0
in = 13, out = 169, expected = 169, delta = 0
in = 14, out = 196, expected = 196, delta = 0
in = 15, out = 225, expected = 225, delta = 0
