.data
array: .byte 0x78, 0x56, 0x34, 0x12, 0x21, 0x43, 0x65, 0x87

.text
main:
    li x10, 5               
    la t0, array            

    
    lb t6, 0(t0)
    add t3, t0, x10         
    sb t6, 0(t3)

    
    addi t0, t0, 1
    lb t6, 0(t0)
    add t3, t0, x10
    sb t6, 0(t3)

    
    addi t0, t0, 1
    lb t6, 0(t0)
    add t3, t0, x10
    sb t6, 0(t3)

 
    addi t0, t0, 1
    lb t6, 0(t0)
    add t3, t0, x10
    sb t6, 0(t3)

    
    addi t0, t0, 1
    lb t6, 0(t0)
    add t3, t0, x10
    sb t6, 0(t3)

    
    addi t0, t0, 1
    lb t6, 0(t0)
    add t3, t0, x10
    sb t6, 0(t3)

    
    addi t0, t0, 1
    lb t6, 0(t0)
    add t3, t0, x10
    sb t6, 0(t3)

    
    addi t0, t0, 1
    lb t6, 0(t0)
    add t3, t0, x10
    sb t6, 0(t3)

    