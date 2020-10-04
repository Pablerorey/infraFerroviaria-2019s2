class Pasajeros {

	var property largo
	var property ancho
	var property banios = true
	var property ordenado = false

	method cantidadDePasajeros() {
		const cuantoRestar = if (not ordenado) {15} else {0}
		var cantidadDePasajeros = 0
		
		if (ancho <= 3) {
			cantidadDePasajeros = 8 * largo
		} else {
			cantidadDePasajeros = 10 * largo
		}
		return cantidadDePasajeros - cuantoRestar
	}

	method cantidadMaximaDeCarga() {
		if (banios) {
			return 300
		} else {
			return 800
		}
	}

	method pesoMaximo() {
		return 2000 + (80  * self.cantidadDePasajeros() ) + self.cantidadMaximaDeCarga()
	}

	method mantenimientoDeVagon() {
		ordenado = true
	}

}

class Carga {

	var property cargaMaximaIdeal 
	var property maderasSueltas 
	var property banios = false
	
	method cantidadDePasajeros() {
		return 0
	}

	method cantidadMaximaDeCarga() {
		return cargaMaximaIdeal - (400 * maderasSueltas)
	}

	method pesoMaximo() {
		return 1500 + self.cantidadMaximaDeCarga()
	}
	
	method mantenimientoDeVagon() {
		maderasSueltas = 0.max(maderasSueltas - 2)
	}

}

class Dormitorio {

	var property compartimientos
	var property camas 
	const property banios = true 
	
	method cantidadDePasajeros() {
		return compartimientos * camas
	}

	method cantidadMaximaDeCarga() {
		return 1200
	}

	method pesoMaximo() {
		return 4000 + (80 * self.cantidadDePasajeros() + self.cantidadMaximaDeCarga())
	}
	
	method mantenimientoDeVagon() {}
}

