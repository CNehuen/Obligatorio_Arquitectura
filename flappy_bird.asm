.globl flappy_bird
#Considerciones generales
# tamaño del bicho  -> 8x8
# tamaño del espacio entre colunas -> 20
# salto del bicho cuantos pixeles sube -> 4
#cuanto tarda en completar el salto -> 2
#Funciones a realizar
# - Refresh puntaje (tranformar el registro en string)
# - Refresh background -> mover las columnas ()
# - Refresh posicion del bicho (x,y, 1 ->(subir)/0 ->(bajar))

.text

flappy_bird:
	
	#-----PROLOGO-----#
	#Guardo $ra en sp para no perderlo
	addi $sp, $sp, -4 
	sw $ra, ($sp)
	
	la $a0, Int8x8
	li $a1, 47
	li $a2,2
	jal dibujarString
	
	#-----EPILOGO-----#
    lw $ra , ($sp) 	
	addi $sp, $sp, 4 
	
	jr $ra
	
	


  


