Proceso clave
	PalabraClave  = "Fictizia mola mucho"
	Escribir "Inserte Palabra Clave"
	Leer PalabraClave1
	
	

	Mientras PalabraClave1<> PalabraClave Hacer
		Si PalabraClave1  = PalabraClave
			Escribir "cliente autorizado, puede continuar"
		Sino
			Escribir "clave erronea, intente de nuevo"
		FinSi
	Fin Mientras
FinProceso
