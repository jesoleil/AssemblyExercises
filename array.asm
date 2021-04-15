.data
	myArray: .space 12 			#4 bytes for every integers so 12 = 3 integers
.text
	main: 
	
	addi $s0,$zero,4			#3 integer values 
	addi $s1,$zero,10
	addi $s2,$zero,12
	
	#Index = $t0
	addi $t0,$zero,0
	
	sw $s0,myArray($t0)			#add 4 bytes everytime to increase the index
		addi $t0,$t0,4
	sw $s1,myArray($t0)
		addi $t0,$t0,4
	sw $s2,myArray($t0)
	
	lw $t6,myArray($zero)		#send the first position -$zero- to array
	
	
	

	li $v0,1
	addi $a0,$t6,0
	syscall
	
	li $v0,10
	syscall