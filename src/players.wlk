import ciudades.*
import wollok.game.*
import comidas.*
import gameObject.*

object pepita {
	var amiga
	var property energia = 1000
	var property ciudad = buenosAires 
	var property position = game.at(3,3)
	
	method cambiarAmiga(golondrina) { amiga = golondrina}
	method esAmiga(golondrina) { return golondrina == amiga}
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
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia
	
	method energiaHacia(posicion) { return self.energiaParaVolar(position.distance(posicion)) }
	
	
	method canMove(nuevaPosicion) { return self.energiaHacia(nuevaPosicion) <= energia }
	
	method move(nuevaPosicion) {
		if (self.canMove(nuevaPosicion)) {
		energia -= self.energiaHacia(nuevaPosicion)
		self.position(nuevaPosicion) 
		}
	}
	
	method agarrarItem(iten) {}	
}

object roque {
	var property miniMochila = vacio
	var property position = game.at(1,1)
	
	method image() = "jugador.png"
	method nombre() { return "Roque" }
	method agarrarItem(item) {
		if (miniMochila != vacio) { self.vaciarMochila()}
			self.cargarMochila(item) 			
	}
	
	method darComida(ave) {
	if (miniMochila != vacio) {
		ave.come(miniMochila)
		self.vaciarMochila()
		}	
	}
	 
	method cargarMochila(objeto) {
		miniMochila = objeto
		//objeto.hide()
		// Se mueve afuera del tablero porque si no deja de funcionar el whenCollideDo
		objeto.position(game.at(11,11))
	}
	
	method vaciarMochila() {
		if (miniMochila != vacio) {
			miniMochila.position(posicionRandom.nuevaPosicion())
			//miniMochila.show()
			miniMochila = vacio
		}
	}
	
	method openBag() { return miniMochila }
	//Esta para conservar polimorfismo en game Pipa y Pepona collision.
	method saludarAmiga(amiga) {}
	method move(nuevaPosicion) {
		self.position(nuevaPosicion) 
	}
}

