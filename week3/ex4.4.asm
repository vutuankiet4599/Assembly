.text
	addi	$s1, $zero, 4	# i = 3
	addi	$s2, $zero, 3	# j = 4
	addi	$s3, $zero, 1	# m = 1
	addi	$s4, $zero, 2	# n = 2
	add	$s5, $s1, $s2	# $s5 = i+j
	add	$s6, $s3, $s4	# $s6 = m+n
	sgt	$t0, $s5, $s6	# $s5 > $s6
	bne	$t0, $zero, if	# branch to if if i+j > m+n
	beq	$t0, $zero, else	# branch to if if i+j <= m+n
if:
	addi	$t1,$t1,1	# then part: x=x+1
	addi	$t3,$zero,1	# z=1
	j	endif		# skip “else” part
else:
	addi	$t2,$t2,-1	# begin else part: y=y-1
	add	$t3,$t3,$t3	# z=2*z
endif:
