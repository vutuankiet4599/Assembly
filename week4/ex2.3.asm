.text
	li	$s0, 0x312ACD81		# Set value to s0
	li	$t0, 0x000000ff		# Mask to Set LSB
	
	or	$s1, $s0, $t0		# Set LSB
