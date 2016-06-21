Proceso Numerosromanos
	Escribir "dame un numero entero del uno al 50"
	Leer Numero
	SeCambiaARomano<-Verdadero
	Si Numero = 0
		Entonces
		Escribir "no existe el cero"
		SeCambiaARomano<-Falso
		
	FinSi
	Si Numero <0 
		Entonces
		Escribir " El numero debe  ser positivo"
		SeCambiaARomano<-Falso
	FinSi
	Si Numero > 50
		Entonces
		Escribir " el numero es demasiado alto"
		SeCambiaARomano<-Falso
	FinSi
	Si SeCambiaARomano 
		Entonces
		Si Numero = 1
			Entonces 
			Escribir "I"
		Sino
			
		FinSi
		
	FinSi
	FinProceso
	