#Toma el puntaje almacenado en un int32 , lo convierte en String de 4 caracteres y lo muestra en pantalla

.globl update_score_2
update_score_2:
	#Coordenadas del string del puntaje : [x($a1) = 95 ; y($a2) = 2]
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	
	la $t2, scores
	lw $t3, ($t2) 
	convertir_score_2:
	#Debo convertir el int de score a string
	la $a0, Int8x8
	move $a1, $t3
	jal intToString
	li $a1, 95
	li $a2, 2
	jal dibujarString
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra


intToString:
	#a0 -> direccion de Int8x8
	#a1 -> int a convertir
	li $t1, 4
	loop_converter:
		beqz $t1, end_converter
		beqz $a1, end_converter
		subi $t1, $t1, 1
		li $t0, 10
		div $a1, $t0 
		mflo $a1
		mfhi $t2
		#guardo_digito
		add $t3, $a0, $t1
		addi $t2, $t2, 48 # convierto en numero al codigo ascii del numero
		sb $t2, ($t3)
		j loop_converter
	end_converter:
	jr $ra
	
	

