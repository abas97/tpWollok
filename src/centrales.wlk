import turbinas.*

object centralAtomica {
	
	var varillasDeUranio = 0
	
	method obtenerProduccionEnergetica() = varillasDeUranio * 0.1
	
	method setVarillasDeUranio (varillas){
		varillasDeUranio = varillas
	}
	
	method contamina (){
		return varillasDeUranio > 20
	}

}

object centralDeCarbon{
	
	const riquezaDelSuelo = 0.9
	var capacidadEnToneladas = 0
	
	method setCapacidadEnToneladas (capacidad){
		capacidadEnToneladas = capacidad
	}
	
	method obtenerProduccionEnergetica() = (0.5 + capacidadEnToneladas) * riquezaDelSuelo
	
	method contamina () = true
}

object centralEolica {
	
	const turbinas = [turbinaUno]
	
	method agregarTurbina (nuevaTurbina){
		turbinas.add(nuevaTurbina) 
	}
	
	method obtenerProduccionEnergetica(){
		return turbinas.map({turbina => turbina.getProduccion()}).sum()
	}
	
	method contamina () = false
}

object centralHidroelectrica{
	
	const caudalDelRio = 150
	
	method obtenerProduccionEnergetica(){
		return (2 * caudalDelRio)
	}
}



