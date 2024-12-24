main:
    li a0, 5
    jal factorial
    
factorial:
    li t0, 1 #result
    li t1, 1 # i
loop:
    bgt t1, a0, exit_loop
    mul t0, t1, t0
    addi t1, t1,1
    j loop
    
    
    
exit_loop:
    mv a0, t0
    jr ra 