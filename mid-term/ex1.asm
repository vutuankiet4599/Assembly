.text
	li	$v0, 5		# nhap mot so nguyen N tu ban phim
	syscall
	add	$s0, $0, $v0	# luu so da nhap vao $s0
	add	$t2, $s0, $0	# bien tam de dem
	li	$t1, 10		# de dem so phan tu trong N
	li	$t0, 0		# Dat bien dem count = 0
count:
	beqz	$t2, done_count	# neu ma N = 0 thi end count
	div	$t2, $t1	# N = N/10
	mflo	$t2
	addi	$t0, $t0, 1	
	j	count
done_count:
	li	$t5, 2		
	blt	$t0, $t5, end	# so nguyen it hon hai chu so thi end
print:
	beqz	$s0, end	# neu ma N = 0 thi end count
	div	$s0, $t1	# N = N/10
	mflo	$s0
	mfhi	$a0		# Lay phan du 
	li	$v0, 1
	syscall
	j	print
end:
	
	
