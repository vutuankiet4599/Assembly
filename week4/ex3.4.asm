.text
	slt	$t1, $s1, $s2
	bne	$t1, $zero, label
	beq	$s1, $s2, label
