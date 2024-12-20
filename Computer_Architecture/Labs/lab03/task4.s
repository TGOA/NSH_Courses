.data
bytes: .byte 'a', 'b', 'c', 'd', 'e', 0
output: .space 6
.text
    la t0, bytes
    la t1, output
    
    lb t2, 0(t0)
    addi t2, t2, -32
    sb t2, 0(t1)
    
    lb t2, 1(t0)
    addi t2, t2, -32
    sb t2, 1(t1)
    
    lb t2, 2(t0)
    addi t2, t2, -32
    sb t2, 2(t1)
    
    lb t2, 3(t0)
    addi t2, t2, -32
    sb t2, 3(t1)

    lb t2, 4(t0)
    addi t2, t2, -32
    sb t2, 4(t1)
    
    lb t2, 5(t0)  
    sb t2, 5(t1)  
    
    li a7, 10
    ecall
