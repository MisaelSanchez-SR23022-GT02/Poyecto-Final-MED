Algoritmo ArbolBPlus
	
	Definir claves Como Cadena
	Dimension claves[10]
	Definir totalClaves Como Entero
	
	claves[0] <- "/etc"
	claves[1] <- "/home"
	claves[2] <- "/var"
	totalClaves <- 3
	
	BuscarClave("/home", claves, totalClaves)
	BuscarClave("/proc", claves, totalClaves)
	InsertarClave("/usr", claves, totalClaves)
	EliminarClave("/var", claves, totalClaves)
	
FinAlgoritmo

SubProceso BuscarClave(clave, claves, totalClaves)
	Definir i Como Entero
	Definir encontrado Como Logico
	encontrado <- Falso
	
	Para i <- 0 Hasta totalClaves - 1 Hacer
		Si claves[i] = clave Entonces
			encontrado <- Verdadero
		FinSi
	FinPara
	
	Si encontrado Entonces
		Escribir "Clave ", clave, " encontrada en la hoja."
	SiNo
		Escribir "Clave ", clave, " no encontrada."
	FinSi
	
FinSubProceso

SubProceso InsertarClave(clave, claves Por Referencia, totalClaves Por Referencia)
	Definir i Como Entero
	Definir pos Como Entero
	
	pos <- totalClaves
	i <- 0
	Mientras i <= totalClaves - 1 Hacer
		Si clave < claves[i] Y pos = totalClaves Entonces
			pos <- i
		FinSi
		i <- i + 1
	FinMientras
	
	Si totalClaves > 0 Y pos < totalClaves Entonces
		i <- totalClaves - 1
		Mientras i >= pos Hacer
			claves[i+1] <- claves[i]
			i <- i - 1
		FinMientras
	FinSi
	
	claves[pos] <- clave
	totalClaves <- totalClaves + 1
	
	Escribir "Clave ", clave, " insertada. Total claves: ", totalClaves
	
	Si totalClaves > 3 Entonces
		Escribir "Nodo lleno: se requiere division."
		DividirHoja(claves, totalClaves)
	FinSi
	
FinSubProceso

SubProceso DividirHoja(claves Por Referencia, totalClaves Por Referencia)
	Definir mitad Como Entero
	Definir clavePromovida Como Cadena
	Definir i Como Entero
	Definir nuevaHoja Como Cadena
	Dimension nuevaHoja[10]
	Definir totalNueva Como Entero
	
	mitad <- totalClaves / 2
	clavePromovida <- claves[mitad]
	totalNueva <- 0
	
	i <- mitad
	Mientras i <= totalClaves - 1 Hacer
		nuevaHoja[totalNueva] <- claves[i]
		totalNueva <- totalNueva + 1
		i <- i + 1
	FinMientras
	
	totalClaves <- mitad
	
	Escribir "Division realizada. Clave promovida al padre: ", clavePromovida
	Escribir "Nodo izquierdo queda con ", totalClaves, " claves."
	Escribir "Nodo derecho queda con ", totalNueva, " claves."
	
FinSubProceso

SubProceso EliminarClave(clave, claves Por Referencia, totalClaves Por Referencia)
	Definir i Como Entero
	Definir pos Como Entero
	Definir encontrado Como Logico
	
	encontrado <- Falso
	pos <- 0
	
	i <- 0
	Mientras i <= totalClaves - 1 Hacer
		Si claves[i] = clave Entonces
			encontrado <- Verdadero
			pos <- i
		FinSi
		i <- i + 1
	FinMientras
	
	Si NO encontrado Entonces
		Escribir "Clave ", clave, " no existe. No se puede eliminar."
	SiNo
		Si pos < totalClaves - 1 Entonces
			i <- pos
			Mientras i <= totalClaves - 2 Hacer
				claves[i] <- claves[i+1]
				i <- i + 1
			FinMientras
		FinSi
		totalClaves <- totalClaves - 1
		Escribir "Clave ", clave, " eliminada. Total claves: ", totalClaves
		
		Si totalClaves >= 1 Entonces
			Escribir "Nodo estable. Separador actualizado."
		SiNo
			Escribir "Nodo vacio: iniciando rebalanceo."
			Rebalancear(claves, totalClaves)
		FinSi
	FinSi
	
FinSubProceso

SubProceso Rebalancear(claves Por Referencia, totalClaves Por Referencia)
	Definir hermanTieneClaves Como Logico
	hermanTieneClaves <- Verdadero
	
	Si hermanTieneClaves Entonces
		Escribir "Prestamo de clave del hermano realizado."
		Escribir "Separador actualizado en el padre."
	SiNo
		Escribir "Fusion de nodos realizada."
		Escribir "Separador eliminado del padre."
	FinSi
	
	Si totalClaves = 0 Entonces
		Escribir "Raiz sin claves: altura del arbol reducida."
	FinSi
	
FinSubProceso