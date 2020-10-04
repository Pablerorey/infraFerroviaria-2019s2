class Locomotora{
	var property peso = 0
	var property arrastre = 0
	var property velocidadMaxima = 0
	
	method esEficiente(){
		return self.arrastre() >= (self.peso() * 5)
	}
}
