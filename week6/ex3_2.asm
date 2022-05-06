.data
	A: 	.word 	
.text
# ---------------------------------------------------------------------
# $a0 store base address of A
# $s1 store value of n
# $s3 store value of i
# ---------------------------------------------------------------------
main:
	la	$a0, A       		# $a0 = Address(A[0])
	add	$s2, $a0, $0		# $s2 -> add(A)
	addi	$s1, $0, 5		# n = 5
	add	$s3, $0, $0		# i = 0
generate_arr:
	beq	$s1, $s3, end_generate	# i == n end	
	li	$v0, 5			# read integer
	syscall
	sw	$v0, 0($s2)		# A[i] = integer
	addi	$s2, $s2, 4		# next to A{i+1]
	addi	$s3, $s3, 1		# i++
	j	generate_arr
end_generate:
	add	$s2, $0, $0		# set j = 0
	add	$s3, $0, $0		# set i = 0
	j	sort
# ---------------------------------------------------------------------
# $s2 store value of j
# $t0 is tmp
# $t1 is address of A[i]
# $t2 is address of A[j]
# $t3 to compare A[i] and A[j]
# $t4 is value of A[i]
# $t5 is value of A[j]
# ---------------------------------------------------------------------
after_sort:
	li	$v0, 10		# exit
	syscall
end_main:
	
sort:
loop_1:
	beq	$s3, $s1, after_sort	# if i == n end sort
	add	$s2, $s3, $0		# set j = i
	sll	$t1, $s3, 2		# $t1 = i*4
	add	$t1, $a0, $t1		# $t1 -> A[i]
	lw	$t4, 0($t1)		# $t4 = A[i]
	j	loop_2
after_loop_2:
	addi	$s3, $s3, 1		# i++
	j	loop_1
loop_2:
	beq	$s2, $s1, after_loop_2	# if j == n end sort
	sll	$t2, $s2, 2		# $t2 = j*4
	add	$t2, $a0, $t2		# $t2 -> A[j]
	lw	$t5, 0($t2)		# $t2 = A[j]
	slt	$t3, $t4, $t5		# A[j] < A[i]
	bne	$t3, $0, swap		# if A[j] < A[i] swap
after_swap:
	lw	$t4, 0($t1)		# $t4 = A[i]
	addi	$s2, $s2, 1		# j++
	j	loop_2
swap:	
	add	$t0, $t4, $0		# tmp = A[i}
	sw	$t5, 0($t1)		# A[i] = A[j]
	sw	$t0, 0($t2)		# A[j] = tmp
	j	after_swap