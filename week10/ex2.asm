.eqv 	SEVENSEG_RIGHT  0xFFFF0010	# Dia chi cua den led 7 doan trai.

.eqv 	SEVENSEG_LEFT   0xFFFF0011	# Dia chi cua den led 7 doan phai

.text
main:
input:
	li	$v0, 5			# ??c s? nguyên d??ng
	syscall
	li	$a0, 10
	blt	$v0, $a0, input		# N?u mà nó nh? h?n 10 thì d?ng
end_input:
	div	$v0, $a0		# l?y s? v?a nh?p chia cho 10 ?? l?y ch? s? cu?i
	mflo	$v0
	mfhi	$s1
	div	$v0, $v0, $a0		# chia ti?p cho 10 ?? l?y ch? s? g?n cu?i
	mflo 	$v0
	mfhi	$s0
	li	$t0, 0			# S? ?? so sánh
	
	beq	$s0, $t0, set_0
	addi	$t0, $t0, 1
	beq	$s0, $t0, set_1
	addi	$t0, $t0, 1
	beq	$s0, $t0, set_2
	addi	$t0, $t0, 1
	beq	$s0, $t0, set_3
	addi	$t0, $t0, 1
	beq	$s0, $t0, set_4
	addi	$t0, $t0, 1
	beq	$s0, $t0, set_5
	addi	$t0, $t0, 1
	beq	$s0, $t0, set_6
	addi	$t0, $t0, 1
	beq	$s0, $t0, set_7
	addi	$t0, $t0, 1
	beq	$s0, $t0, set_8
	addi	$t0, $t0, 1
	beq	$s0, $t0, set_9
next:
	jal	SHOW_7SEG_LEFT		# show
	
	li	$t0, 0
	beq	$s1, $t0, set_01
	addi	$t0, $t0, 1
	beq	$s1, $t0, set_11
	addi	$t0, $t0, 1
	beq	$s1, $t0, set_21
	addi	$t0, $t0, 1
	beq	$s1, $t0, set_31
	addi	$t0, $t0, 1
	beq	$s1, $t0, set_41
	addi	$t0, $t0, 1
	beq	$s1, $t0, set_51
	addi	$t0, $t0, 1
	beq	$s1, $t0, set_61
	addi	$t1, $t0, 1
	beq	$s0, $t0, set_71
	addi	$t1, $t0, 1
	beq	$s1, $t0, set_81
	addi	$t0, $t0, 1
	beq	$s1, $t0, set_91
next1:
	jal	SHOW_7SEG_RIGHT		# show
	j	exit
# ??t ch? s? hi?n th? cho led
set_0:
	ori	$a0, $0, 0x3f	
	j	next	
set_1:
	ori	$a0, $0, 0x06
	j	next
set_2:
	ori	$a0, $0, 0x5b 
	j	next
set_3:
	ori	$a0, $0, 0x4f 
	j	next
set_4:
	ori	$a0, $0, 0x66	
	j	next
set_5:
	ori	$a0, $0, 0x6d
	j	next
set_6:
	ori	$a0, $0, 0x7d	
	j	next
set_7:
	ori	$a0, $0, 0x7	
	j	next
set_8:
	ori	$a0, $0, 0x7f
	j	next
set_9:
	ori	$a0, $0, 0x6f
	j	next

set_01:
	ori	$a0, $0, 0x3f	
	j	next1	
set_11:
	ori	$a0, $0, 0x06
	j	next1
set_21:
	ori	$a0, $0, 0x5b 
	j	next1
set_31:
	ori	$a0, $0, 0x4f 
	j	next1
set_41:
	ori	$a0, $0, 0x66	
	j	next1
set_51:
	ori	$a0, $0, 0x6d
	j	next1
set_61:
	ori	$a0, $0, 0x7d	
	j	next1
set_71:
	ori	$a0, $0, 0x7	
	j	next1
set_81:
	ori	$a0, $0, 0x7f
	j	next1
set_91:
	ori	$a0, $0, 0x6f
	j	next1
exit:     
	li    	$v0, 10
	syscall
endmain:

SHOW_7SEG_LEFT:  
	li   	$t1,  SEVENSEG_LEFT 	# Gán ??a ch?
	sb   	$a0,  0($t1)		# Gán giá tr?
	jr   	$ra

SHOW_7SEG_RIGHT: 
	li   	$t1,  SEVENSEG_RIGHT 	# Gán ??a ch?
	sb   	$a0,  0($t1)		# Gán giá tr?
	jr   	$ra   