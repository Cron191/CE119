.data
nhap: .asciiz "Nhap ky tu:"
invalid: .asciiz "invalid type.\n"
newline: .asciiz "\n"
isnumber: .asciiz "La so nguyen"
isLower: .asciiz "La ky tu thuong"
isUpper: .asciiz "La ky tu hoa"
.text
main:
		li $v0, 4
		la $a0, nhap
		syscall
	
	li $v0, 12
	syscall
	add $t0, $v0, $zero
	
	li $v0, 4
	la $a0, newline
	syscall
	
	#check so nguyen
	li $t1, 48
	li $t2, 57
	blt $t0, $t1, char
	bgt $t0, $t2, char
	
	li $v0, 4
	la $a0, isnumber
	syscall
	j print
	
		#check ky tu thuong
	char:
	li $t1, 97
	li $t2, 122
	blt $t0, $t1, CHAR
	bgt $t0, $t2, CHAR
	
	li $v0, 4
	la $a0, isLower
	syscall
	j print
	
	
		#check ky tu hoa
	CHAR:
	li $t1, 65
	li $t2, 90
	blt $t0, $t1, NO
	bgt $t0, $t2, NO
	
	li $v0, 4
	la $a0, isUpper
	syscall
	
	j print
	
	#NO
	NO:
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, invalid
	syscall
	j EXIT
	
	#in chuoi truoc va sau
	print:
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 11
	add $a0, $t0, -1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 11
	add $a0, $t0, 1
	syscall
	
	EXIT:
	li $v0, 10
	syscall
