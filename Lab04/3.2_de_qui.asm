.data
    Nhap: .asciiz "Nhap n: "           # Chuỗi yêu cầu nhập n
    In: .asciiz "Chuoi Fibonacci: " # Chuỗi tiêu đề
    space: .asciiz " "                  # Dấu cách
    newline: .asciiz "\n"               # Xuống dòng

.text
.globl main

# Hàm chính
main:
    # Nhap n
    li $v0, 4
    la $a0, Nhap
    syscall

    #Doc n
    li $v0, 5
    syscall
    move $s0, $v0        # Lưu giá trị n vào $s0

    # In tiêu đề "Chuoi Fibonacci: "
    li $v0, 4
    la $a0, In
    syscall
    
    #for
    addi $t0, $zero, 0
    loop_for:
    	slt $t1, $t0, $s0
    	beq $t1, $zero, EXIT
    	move $a0, $t0
    	jal loop_fibo
    	move $a0, $v0
    	li $v0, 1
    	syscall
    	addi $t0, $t0, 1
    	j loop_for
    EXIT:
    	li $v0, 10
    	syscall
    loop_fibo:
    	#luu $a0, $ra vao stack
    	addi $sp, $sp, -8
    	sw $a0, 4($sp)
    	sw $ra, 0($sp)
    	
    	#xet th 0, 1
    	li $v0, 0
    	beq $a0, $v0, return
    	
    	li $v0, 1
    	beq $a0, $v0, return
    	
    	#Tinh fibo(n-1)
    	addi $a0, $a0, -1
    	jal loop_fibo
    	move $a1, $v0
    	
    	#Tinh fibo(n-2)
    	addi $a0, $a0, -1
    	jal loop_fibo
 
    	#return fibo(n-1)+ fibo(n-2)
    		add $v0, $v0, $a1
  
    	
    return:
    	lw $a0, 4($sp)
    	lw $ra, 0($sp)
    	addi $sp, $sp, 8
    	jr $ra
    return_01:
    	lw $ra, 0($sp)
    	addi $sp, $sp, 8
    	jr $ra
    	
    	
    	
   	
    
    





















































