.globl update_score

update_score:
	#Coordenadas del string del puntaje : [x($a1) = 47 ; y($a2) = 2]
	#-----PROLOGO-----#	
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	
	la $a0, Int8x8
	li $a1, 47
	li $a2, 2
	jal dibujarString
	
	
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra