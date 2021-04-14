#**********Karakter Yazdırma****************
#.data
#	myCharacter: .byte 'm'
#.text
#	.globl main	
#	main:
#		li $v0,4
#		la $a0,myCharacter
#		syscall
#		li $v0,10
#		syscall

#**********Integer Yazdırma****************
#.data
#	age: .word 21
#.text
#	.globl main
#	main:
#		li $v0,1
#		lw $a0,age
#		syscall
#		li $v0,10
#		syscall

#************Float Yazdırma****************
#.data
#	PI: .float 3.14
#.text
#	.globl main
#	main:
#		li $v0,2
#		lwc1 $f12,PI
#		syscall
#		li $v0,10
#		syscall

#*************Double Yazdırma****************
#.data
#	d: .double 12.9999
#.text
#	.globl main
#	main:
#		li $v0,3
#		ldc1 $f12,d		#lwc1 32 bittir. f12 de 32 bitik bir register.
#		syscall			#f12 ve f13 ü beraber kullanacağı icin
#		li $v0,10		#64 bite kendisi otomatik olarak tanımlar.
#		syscall

#******************Printing a Double**********************
#.data
#	myDouble: .double 7.202
#	zeroDouble: .double 0.0
#.text
#	.globl main
#	main:
#		ldc1 $f2,myDouble
#		ldc1 $f0,zeroDouble
#		li $v0,3
#		add.d $f12,$f2,$f0
#		syscall
#		li $v0,10
#		syscall

#********************Integer Toplama****************************
#.data
#	number1: .word 5
#	number2: .word 10
#.text
#	.globl main
#	main:
#		lw $t0,number1($zero)
#		lw $t1,number2($zero)
#		add $t2,$t0,$t1 			#t2 = t0 + t1
#		li $v0,1
#		add $a0,$zero,$t2
#		syscall
#		li $v0,10
#		syscall

#********************Integer Çıkarma********************************
#.data
#	number1: .word 20
#	number2: .word 8
#.text
#	.globl main
#	main:
#	lw $s0,number1	# s0 = 20
#	lw $s1,number2	# s1 = 8
#	sub $t0,$s0,$s1 # t0 = s0 - s1
#	li $v0,1
#	move $a0,$t0
#	syscall
#	li $v0,10
#	syscall

#**********************Integer Çarpma mul************************
#.data
#
#.text
#	.globl main
#	main:
#		addi $s0,$zero,10
#		addi $s1,$zero,4
#		mul $t0,$s0,$s1
#		
#		li $v0,1
#		add $a0,$zero,$t0
#		syscall
#		li $v0,10
#		syscall

#**********************Integer Çarpma mult***********************
#.data
#
#.text
#	.globl main
#	main:
#		addi $t0,$zero,2000
#		addi $t1,$zero,10
#		mult $t0,$t1
#		
#		mflo $s0
#		
#		li $v0,1
#		add $a0,$zero,$s0
#		syscall
#		li $v0,10
#		syscall

#*********************Shift Left Logical************************
#.data
#
#.text
#	.globl main
#	main:
#		addi$s0,$zero,4
#		sll $t0,$s0,2
#		li $v0,1
#		add $a0,$zero,$t0
#		syscall
#		li $v0,10
#		syscall

#*******************Integer Bölme***********************
#.data
#
#.text
#	.globl main
#	main:
#		addi $t0,$zero,30
#		addi $t1,$zero,5
#		
#		div $s0,$t0,$t1
#		li $v0,1
#		add $a0,$zero,$s0
#		syscall
#		li $v0,10
#		syscall

.data

.text
	.globl main
	main:
		addi $t0,$zero,30
		addi $t1,$zero,6
		
		div $t0,$t1
		mflo $s0      #quotinet yani bölümü verir
		mfhi $s1 	  #remainder yani kalanı verir (ör:30/6 den kalan 0)
		
		li $v0,1
		add $a0,$zero,$s0	#s1 i yazdırırsan ekrana 0 verir çünkü kalan 0
		syscall
		li $v0,10
		syscall
		
		
		










