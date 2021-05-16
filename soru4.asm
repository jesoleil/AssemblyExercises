.data
	msg1:	 .asciiz	"a sayisi: "	#Kullanıcıdan alınacak sayıları ve toplamı gösterecek ifadeler 
	msg2:	 .asciiz	"b sayisi: "
	msg3:    .asciiz    "Toplam: "
	newLine: .asciiz	"\n"
.text 
	main:
	
	
		li	$v0,4			 #msg1 ekrana yazdırılıyor.
		la	$a0, msg1	
		syscall
		
		li	$v0,5			 #Kullanıcıdan bir sayı alınıyor ve s0 register ına yazılıyor.
		syscall	
		move $s0,$v0	
		
		li	$v0,4			 #msg2 ekrana yazdırılıyor.
		la	$a0, msg2	
		syscall
		
		li	$v0,5			 #Kullanıcıdan diğer sayı alınıyor ve s1 register ına yazılıyor.
		syscall	
		move $s1,$v0	
	
	
		addi $t0,$zero,0     # i = 0 döngü için sayaç tanımlanıyor.
		
		while:
			bge $t0,10,exit
			addi $t0,$t0,1   # i++ sayaç 10 olana kadar döngü devam ediyor, 10 a eşit veya  
			add $s0,$s0,$s1	 #büyük olduğunda exit e dallanılıyor.
			j while
			
		exit:
			jal printNumber	 #Fonksiyon çağrısı yapılıyor.
			li $v0,10
			syscall
			
	li $v0,10				 #Program sonlandırılıyor.
	syscall
			
			
	printNumber:
		li $v0,4
		la $a0,msg3			 #msg3 ekrana yazdırılıyor.
		syscall
		
			
		li $v0,1
		move $a0,$s0		 #Döngü ile toplanan değerler ekrana yazdırılıyor.
		syscall
			
		li $v0,4
		la $a0,newLine		 #Alt satıra geçmek için newLine ekrana yazdırılıyor.
		syscall
			
	
		jr $ra				 #return komutu
	
	
