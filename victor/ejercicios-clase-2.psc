//Ejercicio 6

Proceso
	
	Escribir "¿Escribe el precio?"
	leer precio
	
	Escribir "¿Escribe el número del mes?"
	leer mes
	
	Escribir "¿Que día de la semana?"
	leer dia
	
	descuento<- (25/100)*precio
	
	Si ((mes=12) O (mes=1) O (mes=2) O (mes=3)) & ((dia="sabado") O (dia="domingo")) Entonces
		Escribir "el precio es " precio-descuento
	Sino
		Escribir "el precio es " precio
	Fin Si
	
FinProceso



//Ejercicio 7

Proceso sin_titulo
	
	Escribir "Escribe un número"
	Leer valor
	
	Si valor<0 Entonces
		Escribir valor " es negativo"
	Sino
		Escribir valor " es positivo"
	Fin Si
	
FinProceso



//Ejercicio 8

Proceso sin_titulo
	
	Escribir "Escribe un número"
	Leer valor
	
	Si valor%2==0 Entonces
		Escribir valor " es par"
	Sino
		Escribir valor " es impar"
	Fin Si
	
FinProceso



//Ejercicio 9

Proceso sin_titulo
	
	contador<-0
	
	clave<-"Fictizia mola mucho"
	
	Mientras contador<3 Hacer
		Escribir "Escribe la clave"
		Leer valor
		Si valor=clave Entonces
			Escribir "Clave correcta"
		Fin Si
		contador<-contador+1
	Fin Mientras
	Si contador=3 Entonces
		Escribir "Ya no tienes más intentos"
	Fin Si
	
FinProceso




//Ejercicio 10

Proceso sin_titulo
	
	Escribir "Escribe un día"
	Leer dia
	
	Escribir "Escribe un mes en número"
	Leer mes
	
	Escribir "Escribe un año"
	Leer ano
	
	Si (dia <= 31) & (mes <= 12 ) & (ano > 0 ) Entonces
		Escribir dia "/" Sin Saltar
		Segun mes Hacer
			Opcion 1:
				Escribir "Enero" Sin Saltar
			Opcion 2:
				Escribir "Febrero" Sin Saltar
			Opcion 3:
				Escribir "Marzo" Sin Saltar
			Opcion 4:
				Escribir "Abril" Sin Saltar
			Opcion 5:
				Escribir "Mayo" Sin Saltar
			Opcion 6:
				Escribir "Junio" Sin Saltar
			Opcion 7:
				Escribir "Julio" Sin Saltar
			Opcion 8:
				Escribir "Agosto" Sin Saltar
			Opcion 9:
				Escribir "Septiembre" Sin Saltar
			Opcion 10:
				Escribir "Octubre" Sin Saltar
			Opcion 11:
				Escribir "Noviembre" Sin Saltar
			Opcion 12:
				Escribir "Diciembre" Sin Saltar
			Fin Segun
		Escribir "/" ano
	Sino
		Escribir "Tu fecha no es correcta"
	Fin Si
	
FinProceso
