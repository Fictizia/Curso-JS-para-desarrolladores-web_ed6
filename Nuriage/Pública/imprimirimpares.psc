Proceso imprimirImpares
	
	Escribir "Introducir nœmero"
	Leer numero	
	
	imprimir = 1
	
	Mientras imprimir <= 50 hacer
		
		Si numero % 2 = 0 entonces
			numero + 1
			imprimir + 1
			
		Sino
			Escribir numero
			imprimir + 1
			numero + 1			
		FinSi
	
	FinMientras
	
	
FinProceso
	