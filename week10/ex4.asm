.eqv 	MONITOR_SCREEN	0x10010000
.eqv 	WHITE          	0x00FFFFFF
.text
	li  	$k0, MONITOR_SCREEN
	li	$s0, WHITE
	li	$t0, 0			# bi?n ?? ??m h�ng
	li	$t2, 8			# 8 h�ng 8 c?t
	li	$t3, 2
loop1:
	beq	$t0, $t2, exit		# h�ng >= 8 th� d?ng
	li	$t1, 0			# bi?n ?? ??m c?t
	div	$t0, $t3		# ki?m tra xem h�ng c� ch?n 
	mfhi	$t4
loop2:
	beq	$t1, $t2, endloop2	# c?t >= 8 th� ??n h�ng ti?p theo
	div	$t1, $t3		# ki?m tra xem c?t c� ch?n
	mfhi	$t5
	xor	$t6, $t4, $t5
	beq	$t6, $0, print
next:
	addi	$t1, $t1, 1
	addi	$k0, $k0, 4
	j	loop2
endloop2:
	addi	$t0, $t0, 1
	j	loop1
print:
	sw	$s0, 0($k0)
	j	next
exit: