.data
	prompt: .asciiz "Enter one number: "
.text
main:
	jal getInt
	move $s0, $v0
	move $a0, $s0
	jal ShowInt
	j exit
getInt:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	jr $ra
ShowInt:
	addi $a0, $a0, 1
	li $v0, 1
	syscall
	jr $ra
exit:
