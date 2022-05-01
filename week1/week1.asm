.data   # Vung du lieu, chua cac khai bao bien 
	x:        .word		0x10203040	# bien x, khoi tao gia tri 
	message:  .asciiz	"Bo mon Ky thuat may tinh" 
	
.text   # Vung lenh, chua cac lenh hop ngu    
	la   $a0, message      #Dua dia chi bien mesage vao thanh ghi a0    
	li   $v0, 4            #Gan thanh ghi $v0 = 4   
	syscall     	       #Goi ham so v0, ham so 4, la ham print
	addi	$t1, $zero, 2	#Gan thanh ghi $t1 = 2
	addi	$t2, $zero, 3	#Gan thanh ghi $t2 = 3
	add	$t0, $t1, $t2	#Gan thanh ghi $t0 = $t1 + $t2   