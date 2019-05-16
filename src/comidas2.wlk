import wollok.game.*

class Manzana {
	var property position
	method image() = "manzanaFondoAlfa.png"
	method energia() = 80
}

class MontoncitoAlpiste {
	var property position
	var cantGranos = 0
	method ponerGrano() { cantGranos += 1 }
	method ponerGranos(granos) { cantGranos += granos }
	//no es necesario aun
	//method consumir() { cantGranos = 0}
	
	method image() = "alpiste.png"
	method energia() = 0.5 * cantGranos
}