.data
value: .word 0x87654321

.text
    la t0, value        
    lb t1, 0(t0)        
    slli t1, t1, 24     
    mv t2, t1           

    lb t1, 1(t0)       
    slli t1, t1, 16     
    or t2, t2, t1       

    lb t1, 2(t0)       
    slli t1, t1, 8      
    or t2, t2, t1
    
    lb t1, 3(t0) 
    or t2, t2, t1       
