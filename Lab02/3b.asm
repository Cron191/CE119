.data
nhap1: .asciiz "Nhap so nguyen thu 1:"
nhap2: .asciiz "Nhap so nguyen thu 2:"
solonhon: .asciiz "So lon hon la:"
tong: .asciiz "Tong hai so la:"
hieu: .asciiz "Hieu hai so la:"
tich: .asciiz "Tich hai so la:"
thuong: .asciiz "Thuong hai so la:"
newline: .asciiz "\n"
.text
main:
	#nhap so nguyen thu 1
	li $v0, 4
	la $a0, nhap1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	#nhap so nguyen thu 2
	li $v0, 4
	la $a0, nhap2
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	
	#so lon hon
	li $v0, 4
	la $a0, solonhon
	syscall
	
	slt $t2, $t0, $t1
	beq $t2, $zero,so2
	move $a0, $t1
	j EXIT
	so2:
	move $a0, $t0
	EXIT:
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0,newline
	syscall
	
	#tong
	li $v0, 4
	la $a0, tong
	syscall
	
	li $v0, 1
	add $a0, $t0, $t1
	syscall
	
	li $v0, 4
	la $a0,newline
	syscall
	
	#hieu
	li $v0, 4
	la $a0, hieu
	syscall
	
	li $v0, 1
	sub $a0, $t0, $t1
	syscall
	
	li $v0, 4
	la $a0,newline
	syscall
	
	#tich
	li $v0, 4
	la $a0, tich
	syscall
	
	li $v0, 1
	mul $a0, $t0, $t1
	syscall
	
	li $v0, 4
	la $a0,newline
	syscall
	
	#thuong
	li $v0, 4
	la $a0, thuong
	
	syscall
	li $v0, 1
	div $a0, $t0, $t1
	syscall

	li $v0, 10
	syscall
	
	
