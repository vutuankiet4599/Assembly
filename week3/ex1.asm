.text
start:
	addi	$s1, $0, 3	# i = 3
	addi	$s2, $0, 4	# j = 4
	
	slt	$t0, $s2, $s1	# j < i
	bne	$t0, $0, else	# branch to 'else' if j < i
	addi	$t1, $t1, 1	# x++
	addi	$t3, $0, 1	# z = 1
	j	endif
else:
	subi	$t2, $t2, 1	# y--
	add	$t3, $t3, $t3	# z *= 2
endif: