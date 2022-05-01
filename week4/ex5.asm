.text
	li	$s0, 100	# set first factor s0 = 100
	li	$s1, 8		# set second factor s1 = 8 (small power of 2)
	li	$s2, 1		# value to determine stop time of loop
LOOP:	
	beq	$s1, $s2, END	# End if s1 = 1
	sll	$s0, $s0, 1	# s0 = s0 * 2
	srl	$s1, $s1, 1	# s1 = s1/2	
	j	LOOP
END:
