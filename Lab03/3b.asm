.data
	A: .space 100
.text
	li $v0, 5
	syscall
	add $s0, $v0, $zero
	
	li $v0, 5
	syscall
	add $s1, $v0, $zero
	
	la $a0, A
	slt $t0, $s0, $s1
	beq $t0, $0, Else
	sll $t2, $s0, 2
	add $t1, $a0, $t2
	sw $s0, 0($t1) 
	j Exit	
	Else:
	sll $t2, $s0, 2
	add $t1, $a0, $t2
	sw $s1, 0($t1)
	Exit: