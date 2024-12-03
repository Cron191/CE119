.data
    Nhap: .asciiz "Nhap N: "
.text

main:
    la $a0, Nhap
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0  # $s0 = n
    
    li $t0, 0
    li $t1, 1
    li $t2, 0  # fib(0)
    li $t3, 1  # fib(1)
   

for_loop:
    slt $t4, $t0, $s0
    beq $t4, $zero, end_loop
    
   
    move $a0, $t2
    li $v0, 1  
    syscall
    
    move $t5, $t2
    add $t2, $t2, $t3
    move $t3, $t5
    
    addi $t0, $t0, 1
    j for_loop

end_loop:
    li $v0, 10
    syscall
