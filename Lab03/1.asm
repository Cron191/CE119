.data
	array1: .word 5, 6, 7, 8, 1, 2, 3, 9, 10, 4	
	size1: .word 10
	
	array2: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
	size2: .word 16
	
	array3: .space 8
	size3: .word 8
	
	Nhap1: .ascii "\nNhap vao thu tu mang: \0"
	Nhap2: .ascii "Nhap vao thu tu phan tu: \0"
	
.text
	# for (int i=0;i<size1;i++)
	# cout>>array1[i];
	la $s0,array1
	la $t0, size1
	lw $t1, 0($t0)
	addi $t0, $zero, 0
	FOR:
		slt $t2, $t0, $t1
		beq $t2, $zero, EXIT
		la $v0, 1
		sll $t3, $t0, 2
		add $t3, $s0, $t3
		lw $a0, 0($t3)
		syscall
		addi $t0, $t0, 1
		j FOR
	EXIT:
	# for (int i=0;i<size2;i++)
	# cout>>array2[i];
	la $s1, array2
	la $t0, size2
	lw $t1, 0($t0)
	addi $t0, $zero, 0
	FOR2:
		slt $t2, $t0, $t1
		beq $t2, $zero, EXIT2
		la $v0, 1
		add $t3, $s1, $t0
		lb $a0, 0($t3)
		syscall
		addi $t0, $t0, 1
		j FOR2
	EXIT2:
	#for(int i=0;i<size3;i++)
	#array3[i] = array2[i] + array2[size2 - 1 - i]
	li $t0, 0          #$t0=i=0   
    	la $s2, array2     #$s2=array2  
    	la $s3, array3     #$s3=array3   
    	li $t1, 15         #$t1=size2-1=16-1=15  
    	la $t2, size3
    	lw $t2, 0($t2)	   #St2=size3=8
	loop:
	slt $t3, $t0, $t2
	beq $t3, $zero, OUT
	add $t4, $s2, $t0			
    	lb $t4, 0($t4)     	#$t4=array2[i]    
    	sub $t3, $t1, $t0	# $t3=size2-1-i       
    	add $t5, $s2, $t3	
    	lb $t5, 0($t5)		#$t5=array2[size2-i-1]
    	add $a0, $t4, $t5 
    	add $t7, $s3, $t0    	
    	sb $a0, 0($t7)  	#$t6=array2[i] + array2[size2-i-1]
    	li $v0, 1
    	syscall
    	addi $t0, $t0, 1	#i=i+1
    	j loop
    	OUT:
    	#
    	la $s1, array1
    	la $s2, array2
    	la $s3, array3
    	
    	la $a0, Nhap1
    	li $v0, 4
    	syscall
    	li $v0, 5
    	syscall
	addi $t0, $v0, 0 #t0 laf mang
	
	la $a0, Nhap2
    	li $v0, 4
    	syscall
    	li $v0, 5
    	syscall	
	addi $t1, $v0, 0	
		
	li $t2,1
	beq $t0,$t2, A1
		
	li $t2,2
	beq $t0,$t2, A2
	
	li $t2,3
	beq $t0,$t2, A3
	
	A1:
		sll $t1,$t1,2
		add $t2, $s1, $t1
		lw $a0,0($t2)
		li $v0, 1
		syscall
		j END
	A2:
		add $t2, $s2, $t1
		lb $a0,0($t2)
		li $v0, 1
		syscall
		j END
	A3:
		add $t2, $s3, $t1
		lb $a0,0($t2)
		li $v0, 1
		syscall
		j END
	END:
		
