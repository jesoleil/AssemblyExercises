.data
	arrayA: .space 32				#5 elemanlı bir A ve B dizi tanımlanıyor.		
	arrayB: .space 32				#Her bir integer 4 byte olduğundan açılan alan 32 byte
	msg:	.asciiz "\n*****\n"		
.text
	main:
	
	li $s0,3						#f,g,h,i,j değişkenlerine load immediate komutu ile sabit değerler atanıyor.
	li $s1,5						#Her biri sırasıyla s0,s1,s2,s3,s4 saklayıcılarında tutuluyor.
	li $s2,7
	li $s3,9
	li $s4,11
	
	la $s6,arrayA					#A dizisi için ilk değerin adres okuması load adress komutu ile yapılıyor.
	la $s5,10						#0.indise ilk eleman gönderilip sonraki her bir elemanı bir sonraki
	sw $s5,0($s6)					#indise atamak için store word operatörü kullanılıyor.
	la $s5,20
	sw $s5,4($s6)					#Integerlar 4 byte olduğundan adresler yazılırken dörder arttırılıyor.
	la $s5,30
	sw $s5,8($s6)
	la $s5,40
	sw $s5,12($s6)
	la $s5,50
	sw $s5,16($s6)
	
	
	la $s7,arrayB					#B dizisi için ilk değerin adres okuması load adress komutu ile yapılıyor.
	la $s8,0						#0.indise ilk eleman gönderilip sonraki her bir elemanı bir sonraki
	sw $s8,0($s7)					#indise atamak için store word operatörü kullanılıyor.
	la $s8,1
	sw $s8,4($s7)					#Integerlar 4 byte olduğundan adresler yazılırken dörder arttırılıyor.
	la $s8,2
	sw $s8,8($s7)
	la $s8,3
	sw $s8,12($s7)
	la $s8,4
	sw $s8,16($s7)
	
	
	lw $t0,12($s7)					#Aritmetik işlem için B[4] deki adreste tutulan sayı geçici bir değişkene atanıyor.
	
	add $t3,$s1,$s2					#f = g + h + B[4]
	add $s0,$t3,$t0
	
	li $v0,1
	addi $a0,$s0,0					#İşlem sonucu ekrana yazdırılıyor.
	syscall
	

	li $v0,4						#msg ekrana yazdırılıyor.
	la $a0,msg
	syscall
	

	lw $t1,16($s6)
	sub $s0,$s1,$t1					#f = g - A[B[4]]

	li $v0,1
	addi $a0,$s0,0					#İşlem sonucu ekrana yazdırılıyor.
	syscall
	
	
	li $v0,10						#Program sonlandırıldı.
	syscall