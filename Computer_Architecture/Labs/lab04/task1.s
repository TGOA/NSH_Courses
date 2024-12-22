.data
string: .asciiz "Equal\n"        
string2: .asciiz "Not Equal\n"   

.text
.globl main
main:
    
    li x24, 5                   
    li x25, 10                  

    
    beq x24, x25, equal_label   

   
    la a1, string2              
    li a0, 4                    
    ecall                       
    j end_label                 

equal_label:
   
    la a1, string               
    li a0, 4                    
    ecall                       

end_label:
    li a0, 10                   
    ecall                       
