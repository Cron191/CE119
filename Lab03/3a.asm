.data
	array: .space 100
	Nhap1: .ascii "Nhap so phan tu cua mang: \0"
	Tong: .ascii "\nTong cac gia tri cua mang: \0"
	Nhap2: .ascii "\nNhap chi so cua mang: \0"
.text
main:
	li $v0, 4
	la $a0, Nhap1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero #$t0=n
	
	#Nhap Mang
	la $s0, array
	addi $t1, $zero, 0 #i=0
	loop:
		slt $t2, $t1, $t0
		beq $t2, $zero ,EXIT
		li $v0, 5
		syscall
		sll $t5, $t1, 2
		add $t3, $s0, $t5
		sw $v0, 0($t3) #luu vao mang
		addi $t1, $t1, 1
		j loop
	EXIT:
	lw $s1, 0($s0) #$s1=min
	lw $s2, 0($s0) #$s2=max
	addi $t1, $zero, 0 #i=0
	loop1:
		slt $t2, $t1, $t0
		beq $t2, $zero, EXIT1
		sll $t3, $t1, 2
		add $t3, $s0, $t3 
		lw $t3, 0($t3) #t3=array[i]
		slt $t5, $s1, $t3  
		beq $t5, $zero, UPDATE_MIN
		j MAX
		UPDATE_MIN:
			add $s1, $t3, $zero
			j MAX	
		MAX:
			slt $t5, $s2, $t3
			bne $t5, $zero, UPDATE_MAX
			addi $t1, $t1, 1
			j loop1
			UPDATE_MAX:
				add $s2, $t3, $zero
				addi $t1, $t1, 1
				j loop1
		EXIT1:
		li $v0, 1
		addi $a0, $s1, 0
		syscall
		addi $a0, $s2, 0
		syscall
		addi $t1, $zero, 0 #i=0
		addi $s1, $zero, 0 #s1=sum=0
		loop2:
			slt $t2, $t1, $t0
			beq $t2, $zero ,EXIT2
			sll $t5, $t1, 2
			add $t3, $s0, $t5
			lw $t3, 0($t3) #t3=array[i]
			add $s1, $s1, $t3
			addi $t1, $t1, 1
			j loop2
		EXIT2:
		li $v0, 4
		la $a0, Tong
		syscall
		li $v0, 1
		addi $a0, $s1, 0
		syscall
		li $v0, 4
		la $a0, Nhap2
		syscall
		li $v0, 5
		syscall
		sll $t0, $v0, 2
		add $t0, $s0, $t0
		lw $a0, 0($t0)
		li $v0, 1
		syscall
		
		
		
