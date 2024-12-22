.data
vector1: .byte 1, 2, 3, 4, 5, 6, 7, 8
vector2: .byte 9, 10, 11, 12, 13, 14, 15, 16
result:  .space 32

.text
.globl main
main:
    li t0, 0 
    li a1, 8
    la t1, vector1              
    la t2, vector2              
    la t3, result               
loop:
    lb t4, 0(t1)                
    lb t5, 0(t2)                
    add t6, t4, t5              
    sw t6, 0(t3)                

    addi t1, t1, 1              
    addi t2, t2, 1              
    addi t3, t3, 4              
    addi t0, t0, 1              
    blt t0, a1, loop             

end:
    li a0, 10                   
    ecall
