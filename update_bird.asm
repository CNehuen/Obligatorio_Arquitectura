.globl update_bird

update_bird:
   			#-----PROLOGO-----#
			#Guardo $ra en sp para no perderlo
			addi $sp, $sp, -4 
			sw $ra, ($sp)
			
			la $a0, bird8x8
			li $a1, 20	
			li $a2,	20	
			jal dibujarString 
			
			fin:
					
					
			#-----EPILOGO-----#
    		lw $ra , ($sp) 	
			addi $sp, $sp, 4 
	
				
						
			jr $ra 
			
