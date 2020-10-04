import vagones.*
import locomotoras.*

class Formacion {

	const vagones = []
	const locomotoras = []
	
	method acoplarLocomotora(locomotora){
		locomotoras.add(locomotora)
	}
	
	method acoplarLocomotorass(locomotorass){
		locomotoras.addAll(locomotorass)
	}

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
	
	method vagonMasPesadoFormacion(){
	 	return vagones.max({v => v.pesoMaximo()})
	}
	
	method vagonMasPesado(){
		return vagones.max({v => v.pesoMaximo()}).pesoMaximo()
	}
		
	method vagonMasLiviano(){
		return vagones.min({v => v.pesoMaximo()}).pesoMaximo()
	}
	
	method dispensionDePesos(){
		 return self.vagonMasPesado() - self.vagonMasLiviano()
	}
	
	method cantidadDeBanios(){
		return vagones.count({v => v.banios()})
	}
	
	method mantenimiento(){
		vagones.forEach({v=>v.mantenimientoDeVagon()})
	}
	
	method mayorCantidadPasajeros(){
		return vagones.filter({v=>v.cantidadDePasajeros() > 0}).max({v=>v.cantidadDePasajeros()})
	}
	
	method menorCantidadPasajeros(){
		return vagones.filter({v=>v.cantidadDePasajeros() > 0}).min({v=>v.cantidadDePasajeros()})
	}
	
	method estaEquilibrada(){
		return (self.mayorCantidadPasajeros().cantidadDePasajeros() - self.menorCantidadPasajeros().cantidadDePasajeros()) < 20
	}	
	
	method vagonesConPasajeros(){
		return vagones.filter({v=>v.cantidadDePasajeros() > 0})
	}
	
	method vagonesSinPasajeros(){
		return vagones.filter({v=>v.cantidadDePasajeros() == 0})
	}
	
	method estaOrganizada(){
		const organizada = []
		
		organizada.addAll(self.vagonesConPasajeros())
		organizada.addAll(self.vagonesSinPasajeros())
		
		return organizada == vagones
	}
	
	method velocidadMaxima(){
		return locomotoras.min({l=>l.velocidadMaxima()}).velocidadMaxima()
	}
	
	method esEficiente(){
		return locomotoras.all({l=>l.esEficiente()})
	}
	
	method pesoMaximoVagones(){
		return vagones.sum({v=>v.pesoMaximo()})
	}
	
	method pesoMaximoLocomotoras(){
		return locomotoras.sum({l=>l.peso()})
	}
	
	method pesoMaximoFormacion(){
		return self.pesoMaximoVagones() + self.pesoMaximoLocomotoras()
	}
	
	method arrastre(){
		return locomotoras.sum({l=>l.arrastre()})
	}
	method puedeMoverse(){
		return self.arrastre() >= self.pesoMaximoFormacion()
	}
	
	method kilosDeEmpujeFaltantes(){
		return if(self.puedeMoverse()){0}else{self.pesoMaximoFormacion() - self.arrastre()}
	}
	
	method esCompleja(){
		return vagones.size() + locomotoras.size() > 8 or self.pesoMaximoFormacion() > 80000
	}
	
	

}

