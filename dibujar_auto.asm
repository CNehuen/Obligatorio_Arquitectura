.globl dibujar_auto
dibujar_auto:
	#$a0 -> coordenada X del auto en la pantalla
	#$a1 -> coordenada Y del auto en la pantalla
	#$a3 -> direccion: 1 para el auto del usuario, 0 para los autos obstaculo invertidos
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	la $t0, car16x16
	li $t1, 0x3FFC
	sh $t0, ($t1)
	li $t1, 0x2184
	sh $t0, 1($t1)
	li $t1, 0x03C0
	sh $t0, 2($t1)
	li $t1, 0x1BD8
	sh $t0, 3($t1)
	li $t1, 0x1BD8
	sh $t0, 4($t1)
	li $t1, 0x1E78
	sh $t0, 5($t1)
	li $t1, 0x1A58
	sh $t0, 6($t1)
	li $t1, 0x1A58
	sh $t0, 7($t1)
	li $t1, 0x0240
	sh $t0, 8($t1)
	li $t1, 0x03C0
	sh $t0, 9($t1)
	li $t1, 0x03C0
	sh $t0, 10($t1)
	li $t1, 0x1BD8
	sh $t0, 11($t1)
	li $t1, 0x1998
	sh $t0, 12($t1)
	li $t1, 0x1FF8
	sh $t0, 13($t1)
	li $t1, 0x1998
	sh $t0, 14($t1)
	li $t1, 0x1BD8
	sh $t0, 15($t1)
	
	
	
	
	
	
	
	
	
	
	
	
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra