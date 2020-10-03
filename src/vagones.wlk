class Pasajeros {

	var property largo = null
	var property ancho = null
	var property banios = false
	var property ordenado = false

	method largo() {
		return largo
	}

	method ancho() {
		return ancho
	}

	method banios() {
		return banios
	}

	method ordenado() {
		return ordenado
	}

	method setLargoYAncho(metros1, metros2) {
		largo = metros1
	;
    	ancho = metros2
	}

	method setBanios() {
		banios = true
	}

	method setOrdenado() {
		ordenado = true
	}

	method setDesordenado() {
		ordenado = false
	}

	method setSinBanios() {
		banios = false
	}

	method cantidadDePasajeros() {
		if (ancho <= 3 and not ordenado) {
			return 8 * largo - 15
		} else if (ancho <= 3 and ordenado) {
			return 8 * largo
		} else if (ancho > 3 and not ordenado) {
			return 10 * largo - 15
		} else {
			return 10 * largo
		}
	}

	method cantidadMaximaDeCarga() {
		if (banios) {
			return 300
		} else {
			return 800
		}
	}

	method pesoMaximo() {
		return 2000 + self.cantidadDePasajeros() * 80 + self.cantidadMaximaDeCarga()
	}

}

class Carga {

	var property cargaMaximaIdeal = null
	var property maderasSueltas = null
	const banios = false

	method banios() {
		return banios
	}

	method setCargaMaximaYMaderasSueltas(carga, maderas) {
		cargaMaximaIdeal = carga
	;
		maderasSueltas = maderas
	}

	method cantidadDePasajeros() {
		return 0
	}

	method cantidadMaximaDeCarga() {
		return cargaMaximaIdeal - 400 * maderasSueltas
	}

	method pesoMaximo() {
		return 1500 + self.cantidadMaximaDeCarga()
	}

}

class Dormitorio {

	var property compartimientos = null
	var property camas = null
	const banios = true

	method banios() {
		return banios
	}

	method setCompartimientosYCamas(nroComp, nroCamas) {
		compartimientos = nroComp
	;
		camas = nroCamas
	}

	method cantidadDePasajeros() {
		return compartimientos * camas
	}

	method cantidadMaximaDeCarga() {
		return 1200
	}

	method pesoMaximo() {
		return self.cantidadMaximaDeCarga() + 4000 + self.cantidadDePasajeros() * 80
	}

}

