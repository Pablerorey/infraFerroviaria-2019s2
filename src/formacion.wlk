import vagones.*

object formacion {

	const vagones = []

	method acoplarVagon(vagon) {
		vagones.add(vagon)
	}

	method acoplarVagones(cantidad) {
		vagones.addAll(cantidad)
	}

	method desacoplarVagon(vagon) {
		vagones.remove(vagon)
	}

	method desacoplarVagones(cantidad) {
		vagones.removeAll(cantidad)
	}

	method cuantosPasajeros() {
		return vagones.sum({ v => v.cantidadDePasajeros() })
	}

	method vagonesPopulares() {
		return vagones.count({ v => v.cantidadDePasajeros() > 50 })
	}

	method formacionCarguera() {
		return vagones.all({ v => v.cantidadMaximaDeCarga() >= 1000 })
	}
	
	method dispensionDePesos(){
		return 
	}

}

