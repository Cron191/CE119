.data
	Nhap: .asciiz "Nhap N: "
.text

main:
	la $a0, Nhap
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0 #$s0=n
	
	addi $t0, $zero, 0
	for:
		slt $t1, $t0, $s0
		beq $t1, $zero, end
		move $a0, $t0
		jal fibo
	
		move $a0, $v0
		li $v0, 1
		syscall
		
		addi $t0, $t0, 1
		j for
	end:
		li $v0, 10
		syscall
fibo:
    addiu   $sp, $sp, -8         # Tạo chỗ trống trên stack
    sw      $ra, 4($sp)          # Lưu giá trị $ra (địa chỉ trả về)
    sw      $a0, 0($sp)          # Lưu tham số $a0 (n) vào stack

    # Nếu n == 0, trả về 0
    li      $v0, 0
    beq     $a0, $zero, fibo_return

    # Nếu n == 1, trả về 1
    li      $v0, 1
    li      $t0, 1
    beq     $a0, $t0, fibo_return

    # Gọi đệ quy tính Fibonacci(n-1)
    addiu   $a0, $a0, -1         # n = n - 1
    jal     fibo                 # Gọi fibo(n-1)
    move    $t1, $v0             # Lưu kết quả fibo(n-1) vào $t1

    # Gọi đệ quy tính Fibonacci(n-2)
    lw      $a0, 0($sp)          # Khôi phục giá trị n từ stack
    addiu   $a0, $a0, -2         # n = n - 2
    jal     fibo                 # Gọi fibo(n-2)
    add     $v0, $v0, $t1        # Kết quả là fibo(n-1) + fibo(n-2)

fibo_return:
    lw      $ra, 4($sp)          # Phục hồi $ra
    lw      $a0, 0($sp)          # Phục hồi $a0
    addiu   $sp, $sp, 8          # Giải phóng stack
    jr      $ra                  # Quay lại hàm gọi
