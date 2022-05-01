.text
	li	$s1, 10
	bltz	$s1, NEGSET		# Branch to set $s0 = -$s1 if s1 < 0
	add	$s0, $s1, $zero		# s0 = s1 if s1 > 0
	j	EXIT
NEGSET:
	li	$t0, 0xffffffff		# Load Mask to t0
	xor	$s3, $s1, $t0		# Set s0 = -s1
	addi	$s0, $s3, 1
EXIT:
