.data
array: .space 400

.text
    li x5, 0
    li x6, 100
    la x8, array

loop:
    slli x9, x5, 2
    add x10, x8, x9
    sw x5, 0(x10)
    addi x5, x5, 1
    blt x5, x6, loop

end_loop:
    li a0, 10
    ecall
