
Proceso Descuento
	Escribir "Precio"
	Leer Precio1
	Si Meses <-Diciembre o Enero o Febrero
		Escribir Precio2<-Precio1-Precio1*0,25
	Sino
		Escribir Precio2<-Precio1

	FinSi
	Si Dias <-Viernes o Sabado o Domingo
		Escribir Precio2<-Precio1-Precio1*0,25
	Sino
		Escribir Precio2<-Precio1
	FinSi
	
FinProceso
