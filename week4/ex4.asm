.text
	# $s1 and $s2 store value of operand, $s3 store sum of $s1 and $s2
	li	$t0, 0			# Dedault status is no overflow
	xor	$t1, $s1, $s2		# Check s1 and s2 have the same sign
	bltz	$t1, EXIT		# Exit if same sign
	# Else s1 and s2 have different sign
	addu	$s3, $s1, $s2		# s3 = s1 + s2
	xor	$t1, $s3, $s1		# Check sum and s1 have the same sign
	bltz	$t1, OVERFLOW		# t1 < 0 <=> sum and s1 does not have the same sign => overflow
	j	EXIT
OVERFLOW:
	li	$t0, 1			# Overflow
EXIT:
