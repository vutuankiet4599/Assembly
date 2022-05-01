.text
	li	$s0, 0x312ACD81		# Set value to s0
	li	$t0, 0xFF000000		# Mask to get MSB
	
	and	$s1, $s0, $t0		# Get MSB
