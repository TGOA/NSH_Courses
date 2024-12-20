.data
bytes: .byte 10, 20, 30, 40, 50
word_array: .space 20

.text
main:
    la t0, bytes
    la t1, word_array

    lbu t2, 0(t0)
    sw t2, 0(t1)

    lbu t2, 1(t0)
    sw t2, 4(t1)

    lbu t2, 2(t0)
    sw t2, 8(t1)

    lbu t2, 3(t0)
    sw t2, 12(t1)

    lbu t2, 4(t0)
    sw t2, 16(t1)

    li a7, 10
    ecall
