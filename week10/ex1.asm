.eqv 	SEVENSEG_RIGHT    0xFFFF0010	# Dia chi cua den led 7 doan trai.

.eqv 	SEVENSEG_LEFT   0xFFFF0011	# Dia chi cua den led 7 doan phai
# Mã s? sinh viên 20194599
.text
main:
	li	$a0, 111		# giá tr? 1 thì t?t c? các thanh e là 1(không tính d?u ch?m)
					# 8 bit cu?i thì ph?i là 01101111
	jal   	SHOW_7SEG_LEFT          # show
		
	li    	$a0,  111              	# giá tr? 1 thì t?t c? các thanh e là 1(không tính d?u ch?m)
					# 8 bit cu?i thì ph?i là 01101111
	jal   	SHOW_7SEG_RIGHT         # show   
exit:     
	li    $v0, 10
	syscall
endmain:

SHOW_7SEG_LEFT:  
	li   $t0,  SEVENSEG_LEFT 	# Gán ??a ch?
	sb   $a0,  0($t0)		# Gán giá tr?
	jr   $ra

SHOW_7SEG_RIGHT: 
	li   $t0,  SEVENSEG_RIGHT 	# Gán ??a ch?
	sb   $a0,  0($t0)		# Gán giá tr?
	jr   $ra   