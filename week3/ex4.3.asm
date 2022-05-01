.text
	addi	$s1, $zero, 4	# i = 3
	addi	$s2, $zero, 3	# j = 4
	add	$s3, $s1, $s2	# $s3 = i+j
	blez	$s3, if		# branch to if if i+j <= 0
	j	else		# else jump to esle
if:
	addi	$t1,$t1,1	# then part: x=x+1
	addi	$t3,$zero,1	# z=1
	j	endif		# skip “else” part
else:
	addi	$t2,$t2,-1	# begin else part: y=y-1
	add	$t3,$t3,$t3	# z=2*z
endif:
