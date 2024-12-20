.data
value1: .word 0x78563412
value2: .word 0x21436587

.text
main:
    la t0, value1
    la t1, value2
    lw x5, 0(t0)
    lw x6, 0(t1)
    add x7, x5, x6
    sw x7, 8(t0)
    mv a0, x7
    li a7, 1
    ecall
    li a7, 10
    ecall
