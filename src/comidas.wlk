import wollok.game.*

object manzana {
	method image() = "manzanaFondoAlfa.png"
	method position() = game.at(5,1)
	
	method energia() = 80
}

object alpiste {
	method image() = "alpiste.png"
	method position() = game.at(5,5)
	
	method energia() = 5
}

object vacio {
	method energia() = 0
}