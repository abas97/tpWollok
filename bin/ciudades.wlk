import centrales.*

object springfield {
	
	var necesidadProductiva = 3.5
	const centralesDeProduccionElectricas = [centralAtomica, centralDeCarbon, centralEolica]
	
	method getCentralesDeProduccionElectricas(){
		return centralesDeProduccionElectricas
	}
	method setNecesidadProductiva (necesidad){
		necesidadProductiva = necesidad
	}
	// PUNTO 1
	method produccionElectricaDeUnaCentral (unaCentral){
		return unaCentral.obtenerProduccionEnergetica()
	}
	
	// PUNTO 2
	method obtenerCentralesContaminantes (){
		return centralesDeProduccionElectricas.filter({centrales => centrales.contamina()})
	}
	
	// PUNTO 3
	method cubreNecesidadProductiva(){
		return (self.obtenerProduccionEnergeticaTotal(centralesDeProduccionElectricas) >= necesidadProductiva)
	}
	
	method obtenerProduccionEnergeticaTotal(listaDeCentrales){
		return (listaDeCentrales.map({centrales => centrales.obtenerProduccionEnergetica()})).sum()
	}
	
	// PUNTO 4
	
	method estaEnElHorno(){
		return (self.sonTodasContaminantes() || self.mayoriaDeNecesidadProducidaPorCentralesContaminantes())
	}
	
	method sonTodasContaminantes(){
		return self.obtenerCentralesContaminantes().size() == centralesDeProduccionElectricas.size()
	}
	
	method mayoriaDeNecesidadProducidaPorCentralesContaminantes(){
		return self.obtenerProduccionEnergeticaTotal(self.obtenerCentralesContaminantes()) >= (necesidadProductiva / 2)
	}
	
	method obtenerMejorCentral(){
		return centralesDeProduccionElectricas.max({centrales => centrales.obtenerProduccionEnergetica()})
	}
	
}

// PUNTO 5

object albuquerque{
	
	const unicaCentral = centralHidroelectrica
	
	method obtenerProduccionEnergeticaTotal (){
		return unicaCentral.obtenerProduccionEnergetica()
	}
	
	method obtenerMejorCentral() = unicaCentral
}


