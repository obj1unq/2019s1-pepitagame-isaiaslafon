import wollok.game.*

object manzana {
	var property position = game.at(5,1)
	method image() = "manzanaFondoAlfa.png"
	method energia() = 80
}

object alpiste {
	var property position = game.at(5,5)
	method image() = "alpiste.png"
	method energia() = 5
}

object vacio {
	method energia() = 0
}