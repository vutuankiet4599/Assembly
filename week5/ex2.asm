.data
	mess1:	.asciiz		"The sum of "
	mess2:	.asciiz		" and "
	mess3:	.asciiz		" is "
.text
	li	$s0, 100	# s0 = 100
	li	$s1, 200	# s1 = 200
	add	$s2, $s0, $s1	# s2 = s0 + s1
	la	$a0, mess1	# load mess1 to  print
	li	$v0, 4		# print mess1
	syscall
	add	$a0, $zero, $s0	# load s0 to print
	li	$v0, 1		# print s0
	syscall
	la	$a0, mess2	# load mess2 to  print
	li	$v0, 4		# print mess2
	syscall
	add	$a0, $zero, $s1	# load s1 to print
	li	$v0, 1		# print s1
	syscall
	la	$a0, mess3	# load mess3 to  print
	li	$v0, 4		# print mess3
	syscall
	add	$a0, $zero, $s2	# load sum to print
	li	$v0, 1		# print sum
	syscall