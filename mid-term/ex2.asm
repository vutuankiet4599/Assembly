.data
	Array:	.word			
.text
	li	$v0, 5			# Nhap so phan tu N tu ban phim
	syscall
	
	add	$s0, $v0, $0		# Luu so phan tu mang vao $s0
	la	$s1, Array		# Lay dia chi cua mang
	li	$t0, 0			# Dat con dem count = 0
	
loop_input:
	beq	$t0, $s0, done_input	# If count == N break
	li	$v0, 5			# Nhap so nguyen tu ban phim
	syscall
	
	sll	$t1, $t0, 2		# count*4
	add	$s2, $s1, $t1		# $s2 tro toi Array[count]
	sw	$v0, 0($s2) 		# Luu gia tri vua nhap vao Array[count]
	addi	$t0, $t0, 1		# count++
	j	loop_input
done_input:
	li	$t9, 0			# dat result = 0
	li	$t1, 0			# khai bao i = 0 de chay vong lap check0
	
check0:
	beq	$t1, $s0, done_check0	# chay het vong lap
	sll	$t0, $t1, 2		# de truy xuat dia chi cua mang
	add	$s2, $s1, $t0		# truy xuat den A[i]
	lw	$s3, 0($s2)
	beq	$s3, $0, correct	# neu co phan tu 0 thi cap nhat
	add	$t1, $t1, 1		# neu khong i++
	j	check0
correct:
	addi	$t9, $0, 1		# cap nhat ket qua len 1
done_check0:
	# $t9 chua ket qua tra ve
	# $s0 luu so luong phan tu trong mang
	# $s1 luu mang
	li	$t0, 0			# i = 0
	li	$t1, 0			# j = 0	
loop:
	beq	$t0, $s0, end_loop	# Chay het mang thi dung
	lw	$s2, 0($s1)		# Lay gia tri cua A[i]
	beqz	$s2, end_loop1 		# neu A[i] == 0 thi tim toi phan tu ke tiep
	addi	$s3, $s1, 4		# A[j] = A[i+1]
	addi	$t1, $t0, 1		# j = i + 1
	addi	$t9, $t9, 1		# result +
loop1:
	beq	$t1, $s0, end_loop1	# neu j == N thi het vong lap
	lw	$t3, 0($s3)		# lay ra gia tri A[j]
	bne	$t3, $s2, next		# neu ma khac thi nhay sang phan tu tiep
	sw	$0, 0($s3)		# neu trung thi thay gia tri 0 vao
next:
	addi	$s3, $s3, 4		# A[++j]
	addi	$t1, $t1, 1		# j++
	j	loop1
end_loop1:
	addi	$s1, $s1, 4		# A[++i]
	addi	$t0, $t0, 1		# i++
	j	loop
end_loop:
	li 	$v0, 1			# in gia tri
    	addi	$a0, $t9, 0
    	syscall

