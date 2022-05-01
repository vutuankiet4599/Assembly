.data 
	A:	.word	 18, -19, 23, 1, -22, -23	# Need to know the number of elements in the array
.text
	addi	$s1, $zero, 0	#i = 0
	addi	$s3, $zero, 6	#n = 6
	la	$s2, A		#$s2=add(A)
	addi	$s4, $zero, 1	#step = 1
	add	$s5, $zero, $zero	#$s5 = 0
loop:
	slt	$t3, $s1, $s3	# $t3 = i < n? 1 : 0
	beq	$t3, $zero, endloop

	add	$t1,$s1,$s1	#$t1=2*$s1
	add	$t1,$t1,$t1	#$t1=4*$s1
	add	$t1,$t1,$s2	#$t1 store the address of A[i]
	lw	$t0,0($t1)	#load value of A[i] in$t0
	sgt	$t2, $t0, $s5	#$t2 = (A[i] > $s5) ? 1 : 0
	bne	$t2, $zero, setMax	# if A[i] > $s5 setMax
	sub	$t4, $zero, $t0	# check -A[i]
	sgt	$t5, $t4, $s5	#$t5 = (-A[i] > $s5) ? 1 : 0
	bne	$t5, $zero, setMax1	# if -A[i] > $s5 setMax
next:
	add	$s1,$s1,$s4	#i=i+step
	j	loop		#goto loop
endloop:
	j	end
setMax:
	add	$s5, $zero, $t0	#$s5 = A[1]
	j	next
setMax1:
	add	$s5, $zero, $t4	#$s5 = -A[1]
	j	next
end:
