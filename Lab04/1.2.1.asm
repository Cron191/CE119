.data
	Nhap1: .asciiz "Nhap so thu nhat: "
	Nhap2: .asciiz "Nhap so thu hai: "
	Nhap3: .asciiz "Nhap so thu ba: "
	Nhap4: .asciiz "Nhap so thu tu: "
	Nhap5: .asciiz "Nhap so thu nam: "
	Nhap6: .asciiz "Nhap so thu sau: "
.text
	la $a0, Nhap1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	la $a0, Nhap2
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	la $a0, Nhap3
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	la $a0, Nhap4
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s3, $v0
	
	la $a0, Nhap5
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s4, $v0
	
	la $a0, Nhap6
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s5, $v0
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	move $a3, $s3
	move $s1, $s4
	move $s2, $s5
	jal proc_example

	move $a0, $v0
	li $v0, 1
	syscall
	
	move $a0, $v1
	li $v0, 1
	syscall
	
	#exit
	li $v0, 10
	syscall
	
	
proc_example:

	addi $sp, $sp, -8
	sw $s1, 4($sp)
	sw $s0, 0($sp)
	
	sub $s1, $s1, $s2
	move $v1, $s1
	
	add $t0, $a0, $a1
	add $t1, $a2, $a3
	sub $s0, $t0, $t1
	
	move $v0, $s0
	
	lw $s1, 4($sp)
	lw $s0,0($sp)
	addi $sp, $sp, 8
	
	jr $ra
	
	
