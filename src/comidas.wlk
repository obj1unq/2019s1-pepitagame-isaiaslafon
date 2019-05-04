import wollok.game.*

object manzana {
	var posicion = game.at(5,1)
	method image() = "manzanaFondoAlfa.png"
	method position() = posicion
	method position(nuevaPos) { posicion = nuevaPos }
	method energia() = 80
}

object alpiste {
	var posicion = game.at(5,5)
	method image() = "alpiste.png"
	method position() = posicion
	method position(nuevaPos) { posicion = nuevaPos }
	method energia() = 5
}

object vacio {
	method energia() = 0
}