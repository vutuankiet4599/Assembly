.eqv 	SEVENSEG_RIGHT    0xFFFF0010	# Dia chi cua den led 7 doan trai.

.eqv 	SEVENSEG_LEFT   0xFFFF0011	# Dia chi cua den led 7 doan phai
# M� s? sinh vi�n 20194599
.text
main:
	li	$a0, 111		# gi� tr? 1 th� t?t c? c�c thanh e l� 1(kh�ng t�nh d?u ch?m)
					# 8 bit cu?i th� ph?i l� 01101111
	jal   	SHOW_7SEG_LEFT          # show
		
	li    	$a0,  111              	# gi� tr? 1 th� t?t c? c�c thanh e l� 1(kh�ng t�nh d?u ch?m)
					# 8 bit cu?i th� ph?i l� 01101111
	jal   	SHOW_7SEG_RIGHT         # show   
exit:     
	li    $v0, 10
	syscall
endmain:

SHOW_7SEG_LEFT:  
	li   $t0,  SEVENSEG_LEFT 	# G�n ??a ch?
	sb   $a0,  0($t0)		# G�n gi� tr?
	jr   $ra

SHOW_7SEG_RIGHT: 
	li   $t0,  SEVENSEG_RIGHT 	# G�n ??a ch?
	sb   $a0,  0($t0)		# G�n gi� tr?
	jr   $ra   