.data
	input: 		.asciiz "KACAK"				#string bir değişken tanımlanmış ve değer verilmiştir.
	input_len: 	.word 	 5					#integer bir değer tanımlanmış ve değer verilmiştir.
.text
	main:
		la $a0, input_len 					#değişkenler a0 ve a1 saklayıcılarına yüklenmiştir.
		la $a1, input
		jal isPal 							#isPal fonksiyonu çağırılmıştır.
		add $a0, $v0, $zero					
		jal printRes 						#printRes fonksiyonu çağırılmıştır.
		addi $v0, $zero, 10
		syscall 							#Program sonlandırılmıştır.
	isPal:
	# Check base case						
		slti $t0, $a0, 2					#a0 daki değer 2 den küçük mü kontrol edilmiştir.(Doğruysa t0 a 1 yaz.Yanlışsa t0 a 0 yaz.)
		bne $t0, $zero, returnTrue			#t0 0 a eşit değilse yani 1 ise true dön.(5 < 2, t0 = 0, false)
	# Make sure first and last are equal
		lb $t0, 0($a1)						#KACAK kelimesinin ilk harfi load byte komutuyla t0 da saklanmıştır.
		addi $t1, $a0, -1					#a0 da 5 vardı, 1 çıkartılmıştır ve kalan 4 değeri t1 register ında saklanmıştır.
		add $t1, $t1, $a1
		lb $t1, 0($t1)
		bne $t0, $t1, returnFalse			#t0 = 0 ve t0! = t1 ise false dön : false 
	# Shift pointer, length, recurse
		addi $a0, $a0, -2					#a0 a -2 ekle ve a0 da sakla : a0 = 3
		addi $a1, $a1, 1					 
		j isPal								#isPal daki adrese gidilmiştir.
		returnFalse:						#sonuç false dönerse v0 = 0 ve saklanan adrese git.
		addi $v0, $zero, 0				
		jr $ra
		returnTrue:							#sonuç true dönerse v0 = 1 ve saklanan adrese git.
		addi $v0, $zero, 1
		jr $ra


.data
	IS_STRING: .asciiz " is"				#string değişkenler ve değerleri tanımlanmıştır.
	NOT_STRING: .asciiz " NOT"				
	A_PAL_STRING: .asciiz " a ***!"			
.text
	printRes:								#a0 daki değer t4 de saklanmıştır.
	add $t4, $a0, $zero # Stash result
	addi $v0, $zero, 4						#programa string bir değer yazdıracağı söylenmiştir.
	la $a0, input							#input değişkeninin tuttuğu değer ekrana yazdırılmıştır.
	syscall # print "<WORD>"
	la $a0, IS_STRING						#IS_STRING ekrana yazdırılmıştır.
	syscall # print "is"
	bne $t4, $zero, printResCont			#t4 0 a eşit değilse printResCont a dallan.
	la $a0, NOT_STRING 						#NOT_STRING ekrana yazdırılmıştır.
	syscall # print "not"
	printResCont:							#A_PAL_STRING ekrana yazdıran fonksiyon bölümü
	la $a0, A_PAL_STRING					
	syscall # print "a ***."
	jr $ra									#return komutu
	
	
# Based on this c code
# int function isPal(int len, char *str)
# {
# if (len < 2) {
# return true;
# }
# else if (first == last)
# {
# return isPal(len -2, str +1);
# }
# return false;
# }
