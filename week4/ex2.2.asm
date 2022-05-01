.text
	li	$s0, 0x312ACD81		# Set value to s0
	li	$t0, 0xffffff00		# Mask to clear LSB
	
	and	$s1, $s0, $t0		# Clear LSB
