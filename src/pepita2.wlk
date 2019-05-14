import ciudades.*
import wollok.game.*
import comidas.*


object pepona {
	var property position = game.at(2,1)	
	method image() = "pepona.png"
	method nombre() { return "Pepona" }
}

object pipa {
	var property position = game.at(4,4)	
	method image() = "pepitaCanchera.png"
	method nombre() { return "Pipa" }
}