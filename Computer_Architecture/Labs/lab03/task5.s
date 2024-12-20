.data
string: .asciiz "Hello"
output: .space 6

.text
    la t0, string
    la t1, output

    lb t2, 4(t0)
    sb t2, 0(t1)
    
    lb t2, 3(t0)
    sb t2, 1(t1)
    
    lb t2, 2(t0)
    sb t2, 2(t1)
    
    lb t2, 1(t0)
    sb t2, 3(t1)

    lb t2, 0(t0)
    sb t2, 4(t1)

    li t2, 0
    sb t2, 5(t1)

    li a7, 10
    ecall
