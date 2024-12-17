li x5, 10
srli   x6, x5, 16
xor    x5, x5, x6
srli   x6, x5, 8
xor    x5, x5, x6
srli   x6, x5, 4
xor    x5, x5, x6
srli   x6, x5, 2
xor    x5, x5, x6
srli   x6, x5, 1
xor    x5, x5, x6
andi   x10, x5, 1

