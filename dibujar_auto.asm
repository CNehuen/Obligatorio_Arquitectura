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

	
	
	
	
	
	
	
	
	
	
	
	
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra