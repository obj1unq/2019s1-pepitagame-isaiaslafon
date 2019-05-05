import ciudades.*
import wollok.game.*
import comidas.*

object pepita {
	var property energia = 1000
	var property ciudad = buenosAires 
	var property position = game.at(3,3)
	var property amiga = pepona
	
	method image() {return if (energia > 100) "pepita-gorda-raw.png" else "pepita.png" }
	method nombre() { return "Pepita" }
	
	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (self.noEstaEnLugar(unaCiudad.position())) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		} else { game.say(self, "Ya estoy en " + self.ciudad().nombre() + "!")}
	}
	
	method leAlcanzaLaEnergia(posicion)  { return energia >= self.energiaHacia(posicion) }
	method noEstaEnLugar(posicion) { return self.position() != posicion }

	method volaYCome(comida) {
		self.move(comida.position())
		self.come(comida)
		game.removeVisual(comida)
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia
	
	method energiaHacia(posicion) { return self.energiaParaVolar(position.distance(posicion)) }
	
	method saludarAmiga(golondrina) { 
		if (self.amiga() != golondrina)
		{ self.amiga(golondrina) 
		game.say(self, "Hola " + golondrina.nombre() + "!")}
	}
	
	method move(nuevaPosicion) {
		if (self.energiaHacia(nuevaPosicion) <= energia) {
		energia -= self.energiaHacia(nuevaPosicion)
		self.position(nuevaPosicion) 
		} else {game.say(self, "dame de comer, loco!")}
	}	
}

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

object roque {
	var property miniMochila = vacio
	var property position = game.at(1,1)
	
	method image() = "jugador.png"
	method nombre() { return "Roque" }
	method agarrarComida(comida) {
		if (miniMochila != vacio) { self.vaciarMochila()}
			self.cargarMochila(comida) 			
	}
	
	method cargarMochila(objeto) {
		miniMochila = objeto
		objeto.hide()
	}
	
	method vaciarMochila() {
		if (miniMochila != vacio) {
			miniMochila.position(posicionRandom.nuevaPosicion())
			miniMochila.show()
			miniMochila = vacio
		}
	}
	
	//Esta para conservar polimorfismo en game Pipa y Pepona collision.
	method saludarAmiga(amiga) {}
	method move(nuevaPosicion) {
		self.position(nuevaPosicion) 
	}
}

object posicionRandom {
	//Se probó por REPL que funciona. size es una posicion del tipo (x,y)
	var size = game.at(10,10)
	
	method newGameSize(newSize) { size = newSize }
	
	method nuevaPosicion() {
		return game.at(self.nroRandomTruncate(size.x()) , self.nroRandomTruncate(size.y()))
	}
	
	method nroRandomTruncate(max) { return 0.randomUpTo(max).truncate(0) }
}