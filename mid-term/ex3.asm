.data
	string: 	.space 		50
	str:		.asciiz		"Th"
.text
main:
get_string:
	li 	$v0, 8 				# nhap xau
	la 	$a0, string 			# load dia chi xau			
	li 	$a1, 50 			# do dai toi da
	syscall
	li	$t0, 0				# bien de dem

do:
	la	$s0, string			# $s0 chua dia chi cua string
	la	$s1, str			# Lay dia chi cua xau str
	li	$s2, 32				# ky tu space
	lb	$s3, 0($s1)			# ky tu 'T'
	lb	$s4, 1($s1)			# ky tu 'h'
	lb	$s1, 0($s0)			# doc ky tu dau cua string
	bne	$s1, $s2, compare_T		# Ky tu dau khong phai dau cach thi so sanh T
loop:
	beq	$s1, $0, end_loop		# neu ma null thi dung
	beq	$s1, $s2, update		# neu bang dau cach thi so sanh T
	j	next
update:
	add	$s0, $s0, 1			# cap nhat con tro
	lb	$s1, 0($s0)			# doc ky tu tiep theo
	j	compare_T
	
next:	
	add	$s0, $s0, 1			# cap nhat con tro
	lb	$s1, 0($s0)			# doc ky tu tiep theo
	j	loop
end_loop:
	li	$v0, 1				# In ra so tu
	add	$a0, $t0, $0			# truyen tham so vao $a0
	syscall
	
	li	$v0, 10
	syscall
compare_T:
	beq	$s1, $s3, update_1		# neu bang T thi so sanh H
	j	next
update_1:
	add	$s0, $s0, 1			# cap nhat con tro
	lb	$s1, 0($s0)			# doc ky tu tiep theo
	j	compare_H
end_T:

compare_H:
	beq	$s1, $s4, update_2		# neu bang h thi cap nhat
	j	next
update_2:
	addi	$t0, $t0, 1			# tang bien dem len 1
	j	next
end_H:	
	
	
	