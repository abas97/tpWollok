import ciudades.*

object region {
	
	const ciudades = [albuquerque, springfield]
	
	method obtenerMejorCentralPorCiudad(){
		return ciudades.map({ciudad => ciudad.obtenerMejorCentral()})
	}
}