.data
	string: 	.space   	21
	rstring:	.space		21
	Message2:    	.asciiz 	"Xau nguoc la: "
.text
	la	$s0, string		# string is stored at s0
	la	$s1, rstring		# reserved string is stored at s1
	li	$t0, 20			# max length
	li	$t1, 10			# t1 = '\n'
	
	li	$t2, 0			# t2 = i = 0
Loop:	
	li	$v0, 12			# read char
	syscall
	
	add	$t3, $v0, $0		# load char to t3
	add	$t4, $s0, $t2		# t4 = address(string[i])
	sb	$t3, 0($t4)		# store char in string
	
	addi	$t2, $t2, 1		# i = i + 1
	beq	$t2, $t0, End_Loop	# max_length => end
	beq	$t3, $t1, End_Loop	# enter => end
	j 	Loop
End_Loop:
reverse_string:
	add	$s2, $0, $0	# j = 0
	addi	$t2, $t2, -1	# i = i - 1
L:
	add	$s3, $s0, $t2	# s3 = add(string[i]) = s0[0] + i
	lb	$s4, 0($s3)	# s4 = value at i of string
	add	$s5, $s1, $s2	# s5 = add(rstring[j]) = s1[0] + j
	sb	$s4, 0($s5)	# rstring[j] = string[i]
	
	addi	$s2, $s2, 1	# j = j + 1
	addi	$t2, $t2, -1	# i = i - 1
	addi	$t5, $t2, 1	# s2 = i + 1
	beq	$t5, $0, print_rstring
	j	L
print_rstring:	
	li	$v0, 59			# print int in mess dialog
	la	$a0, Message2		# load string message
	la	$a1, rstring		# load reversed string
	syscall
