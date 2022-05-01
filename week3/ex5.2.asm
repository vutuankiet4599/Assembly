.data 
	A:	.word	10, 9, 8
.text
	addi	$s5, $zero, 0	#sum = 0
	addi	$s1, $zero, 0	#i = 0
	addi	$s3, $zero, 2	#n = 2
	la	$s2, A		#$s2=add(A)
	addi	$s4, $zero, 1	#step = 1
loop:
	sub	$t2 , $s1, $s5	# i <= n
	sgt	$t3, $t2, $zero 
	bne	$t3, $zero, endloop
	add	$t1,$s1,$s1	#$t1=2*$s1
	add	$t1,$t1,$t1	#$t1=4*$s1
	add	$t1,$t1,$s2	#$t1 store the address of A[i]
	lw	$t0,0($t1)	#load value of A[i] in$t0
	add	$s5,$s5,$t0	#sum=sum+A[i]
	add	$s1,$s1,$s4	#i=i+step
	j	loop		#goto loop
endloop:
