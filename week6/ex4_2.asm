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
	addi	$s3, $0, 1		# set i = 1
	j	sort
# ---------------------------------------------------------------------
# $s2 store value of j
# $t0 is tmp
# $t1 is address of A[i]
# $t2 is address of A[j]
# $t3 to compare A[i] and A[j]
# $t4 is value of key
# $t5 is value of A[j]
# $s0 is address of A[j+1]
# $s4 is value of A[j+1]
# ---------------------------------------------------------------------
after_sort:
	li	$v0, 10		# exit
	syscall
end_main:
	
sort:
loop_1:
	beq	$s3, $s1, after_sort	# if i == n end sort
	addi	$s2, $s3, -1		# set j = i - 1
	sll	$t1, $s3, 2		# $t1 = i*4
	add	$t1, $a0, $t1		# $t1 -> A[i]
	lw	$t4, 0($t1)		# key = A[i]
	j	loop_2
after_loop_2:
	addi	$s3, $s3, 1		# i++
	sll	$s6, $s2, 2
	addi	$s6, $s6, 4
	add	$s0, $s6, $a0 
	sw	$t4, 0($s0)		# A[j+1] = key
	j	loop_1
loop_2:
	sll	$t2, $s2, 2		# $t2 = j*4
	add	$t2, $a0, $t2		# $t2 -> A[j]
	lw	$t5, 0($t2)		# $t5 = A[j]
	addi	$s0, $t2, 4		# $s0 -> A[j+1]
	lw	$s4, 0($s0)		# $s4 = A[j+1]
	sgt	$t6, $s2, $0		# j >= 0
	beq	$s2, $0, setequal
next:	
	slt	$t7, $t5, $t4		# A[j] > key
	and	$t8, $t6, $t7		# if(j>=n && A[j] > key)
	beq	$t8, $0, after_loop_2
	sw	$t5, 0($s0) 		# A[j+1] = A[j]
	addi	$s2, $s2, -1		# j--
	j	loop_2
	
setequal:
	seq	$t6, $s2, $0
	j 	next