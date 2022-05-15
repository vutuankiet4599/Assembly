.data 
	mess1: 	.asciiz  	"Largest: " 
	mess2:	.asciiz		"Smallest: "
	colon:	.asciiz		","
.text
	li	$s0, 2
	li	$s1, 8
	li	$s2, 9
	li	$s3, 0
	li	$s4, -2
	li	$s5, 7
	li	$s6, -1
	li	$s7, -10
	jal	findMax
	add	$t2, $v0, $0
	add	$t3, $v1, $0
	la	$a0, mess1
	li	$v0, 4
	syscall
	add	$a0, $0, $t2
	li	$v0, 1
	syscall
	la	$a0, colon
	li	$v0, 4
	syscall
	add	$a0, $0, $t3
	li	$v0, 1
	syscall
	
	jal	findMin
	add	$t2, $v0, $0
	add	$t3, $v1, $0
	la	$a0, mess2
	li	$v0, 4
	syscall
	add	$a0, $0, $t2
	li	$v0, 1
	syscall
	la	$a0, colon
	li	$v0, 4
	syscall
	add	$a0, $0, $t3
	li	$v0, 1
	syscall
	j 	Exit
	
findMax:
	add	$v0, $s0, $0	# result = $s0
	addi	$v1, $0, 0	# position of max
	sub	$t0, $s1, $v0	# compare s0 and s1
	bltz	$t0, Max1	# s0 > s1 no change
	add	$v0, $s1, $0	# else result = s1
	addi	$v1, $0, 1	# position = 1
Max1:
	sub	$t0, $s2, $v0	# compare s0 and s1
	bltz	$t0, Max2	# s0 > s1 no change
	add	$v0, $s2, $0	# else result = s1
	addi	$v1, $0, 2	# position = 1
Max2:
	sub	$t0, $s3, $v0	# compare s0 and s1
	bltz	$t0, Max3	# s0 > s1 no change
	add	$v0, $s3, $0	# else result = s1
	addi	$v1, $0, 3	# position = 1
Max3:
	sub	$t0, $s4, $v0	# compare s0 and s1
	bltz	$t0, Max4	# s0 > s1 no change
	add	$v0, $s4, $0	# else result = s1
	addi	$v1, $0, 4	# position = 1
Max4:
	sub	$t0, $s5, $v0	# compare s0 and s1
	bltz	$t0, Max5	# s0 > s1 no change
	add	$v0, $s5, $0	# else result = s1
	addi	$v1, $0, 5	# position = 1
Max5:
	sub	$t0, $s6, $v0	# compare s0 and s1
	bltz	$t0, Max6	# s0 > s1 no change
	add	$v0, $s6, $0	# else result = s1
	addi	$v1, $0, 6	# position = 1
Max6:
	sub	$t0, $s7, $v0	# compare s0 and s1
	bltz	$t0, doneMax	# s0 > s1 no change
	add	$v0, $s7, $0	# else result = s1
	addi	$v1, $0, 7	# position = 1
doneMax:
	jr	$ra
	
findMin:
	add	$v0, $s0, $0	# result = $s0
	addi	$v1, $0, 0	# position of min
	sub	$t0, $s1, $v0	# compare s0 and s1
	bgtz	$t0, Min1	# s0 < s1 no change
	add	$v0, $s1, $0	# else result = s1
	addi	$v1, $0, 1	# position = 1
Min1:
	sub	$t0, $s2, $v0	# compare s0 and s1
	bgtz	$t0, Min2	# s0 < s1 no change
	add	$v0, $s2, $0	# else result = s1
	addi	$v1, $0, 2	# position = 1
Min2:
	sub	$t0, $s3, $v0	# compare s0 and s1
	bgtz	$t0, Min3	# s0 < s1 no change
	add	$v0, $s3, $0	# else result = s1
	addi	$v1, $0, 3	# position = 1
Min3:
	sub	$t0, $s4, $v0	# compare s0 and s1
	bgtz	$t0, Min4	# s0 < s1 no change
	add	$v0, $s4, $0	# else result = s1
	addi	$v1, $0, 4	# position = 1
Min4:
	sub	$t0, $s5, $v0	# compare s0 and s1
	bgtz	$t0, Min5	# s0 < s1 no change
	add	$v0, $s5, $0	# else result = s1
	addi	$v1, $0, 5	# position = 1
Min5:
	sub	$t0, $s6, $v0	# compare s0 and s1
	bgtz	$t0, Min6	# s0 < s1 no change
	add	$v0, $s6, $0	# else result = s1
	addi	$v1, $0, 6	# position = 1
Min6:
	sub	$t0, $s7, $v0	# compare s0 and s1
	bgtz	$t0, doneMin	# s0 < s1 no change
	add	$v0, $s7, $0	# else result = s1
	addi	$v1, $0, 7	# position = 1
doneMin:
	jr	$ra
Exit:



