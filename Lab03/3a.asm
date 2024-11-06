.data
	array: .space 100
	Nhap1: .ascii "Nhap so phan tu cua mang: \0"
.text
	li $v0, 4
	la $a0, Nhap1
	syscall
	li $v0, 1
	syscall
	add $t0, $v0, $zero #$t0=n
	
	#Nhap Mang
	la $s0, array
	addi $t1, $zero, 0 #i=0
	loop:
		slt $t2, $t1, $t0
		beq $t2, $zero ,EXIT
		li $v0, 1
		syscall
		add $t3, $s0, $t1
		sb $v0, 0($t3) #luu vao mang
		addi $t1, $t1, 1
	EXIT:
	lw $s1, 0($s3) #$t1=min
	lw $s2, 0($s3) #$t2=max
	addi $t1, $zero, 0 #i=0
	loop1:
		slt $t2, $t1, $t0
		beq $t2, $zero, EXIT1
		sll $t3, $t1, 2
		add $t3, $s0, $t3
		lw $t3, 0($t3)
		sgt $t5, $s1, $t3
		beq $t5, $zero, MIN
		j MAX
		MIN:
			add $s1, $t3, $zero
			j MAX
		MIN:
			slt $t5, $s2, $t3
			bne $t5, $zero, 
			 
		
		
		