#***********Introduction to Functions*****************
#.data
#	message: .asciiz "Hi, everybody.\nMy name is Soley.\n"
#.text
#	main:
#		jal displayMessage	# we called the our function 
#		
#		#we can continue to write other codes.
#		addi $s0,$zero,5
#		# print number 5 to the screen
#		li $v0,1
#		add $a0,$zero,$s0
#		syscall
#	
#	# tell the system that the program is done.
#	li $v0,10
#	syscall
#	
#	displayMessage:
#		li $v0,4
#		la $a0,message
#		syscall
#		
#		jr $ra  #go back 

#************Function Arguments - ReturnValues************
.data

.text
	main:
		addi $a1,$zero,50
		addi $a2,$zero,100
		
		jal addNumbers
		
		li $v0,1
		addi $a0,$v1,0
		syscall
		
	# tell the system that the program is done.
	li $v0,10
	syscall

	addNumbers:
		add $v1,$a1,$a2  #v1 is for return values
		jr $ra

