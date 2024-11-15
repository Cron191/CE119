.data
	Input: .asciiz "The factorial of 10 is: "
.text
main:
	la $a0, Input
	li $v0, 4
	syscall
	
	li $a0, 20
	jal fact
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
fact:
	#luu $a0, $ra vao stack
	addi $sp, $sp, -8
	sw $a0, 4($sp)
	sw $ra, 0($sp)
	
	#be hon 1 thi exit voi $v0=1
	li $v0, 1
	slt $t0, $a0, $v0
	bne $t0, $zero, end_fact
	
	#goi de qui n-1
	addi $a0, $a0, -1
	jal fact
	
	#tinh n*fact(n-1)
	lw $a0, 4($sp)
	mul $v0, $a0, $v0
	
end_fact:
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
	
	








	
