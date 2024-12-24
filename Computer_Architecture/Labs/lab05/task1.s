.data
array: .word 1,2,3,4,5,6,7,8,9

.text
.globl main

main:
    la a0, array       
    li a1, 9           
    jal sumArray       
    li a0, 10          
    ecall

sumArray:
    li t0, 0           
    li t1, 0           
loop:
    bge t1, a1, end    
    slli t2, t1, 2     
    add t3, a0, t2 
    lw t4, 0(t3)       
    add t0, t0, t4     
    addi t1, t1, 1     
    j loop             

end:
    mv a0, t0          
    jr ra              
