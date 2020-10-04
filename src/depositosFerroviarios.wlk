import formacion.*
import vagones.*
import locomotoras.*

class Deposito{
	var property formaciones = []
	var property locomotoras = []
	
	method agregarFormacioness(formacioness){
		formaciones.addAll(formacioness)
	}  
	
	method agregarLocomotorass(locomotorass){
		locomotoras.addAll(locomotorass)
	}
	
	method vagonesMasPesados(){
		return formaciones.map({v=>v.vagonMasPesadoFormacion()}).asSet()
	}
	
	method necesitaConductorExperto(){
		return formaciones.any({f=>f.esCompleja()})
	}
	
	method agregarLocomotoraSiFalta(formacion){
		if (not formacion.puedeMoverse() and self.hayAlgunaLocomotoraParaUnaFormacion(formacion)){
			formacion.acoplarLocomotora(self.encontrarLocomotoraPara(formacion))
		}
		
	}
    
    method encontrarLocomotoraPara(formacion){
    	return locomotoras.find({l => l.arrastre() >= formacion.kilosDeEmpujeFaltantes()})
    }
    
	method hayAlgunaLocomotoraParaUnaFormacion(formacion){
		return locomotoras.any({l => l.arrastre() >= formacion.kilosDeEmpujeFaltantes()})
	}
}