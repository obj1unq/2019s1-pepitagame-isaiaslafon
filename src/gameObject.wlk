import wollok.game.*
import comidas2.*
import players.*

const agarrarItemLogic = { item => game.whenCollideDo(item, {unPlayer => if (unPlayer == pepita) 
																		{unPlayer.come(item)
																		game.removeVisual(item)}
																	}
													) 
						}

const agarradorDeItemLogic = { player=> game.whenCollideDo(player, {unItem => unItem.teEncontro(player)}) }

const crearManzana = { unaPosicion =>	
	const manzana = new Manzana()
	manzana.position(unaPosicion)
	game.addVisual(manzana)
	agarrarItemLogic.apply(manzana)
}
	
const crearMontonDeAlpiste = { unaPosicion, unaCantGranos =>	
	const alpiste = new MontoncitoAlpiste()
	alpiste.position(unaPosicion)
	alpiste.ponerGranos(unaCantGranos)
	game.addVisual(alpiste)
	agarrarItemLogic.apply(alpiste)
}




object tablero {
	const listaDeVisuales = []
	var tabPlayer
	
	method addPlayer(unPlayer) { tabPlayer = unPlayer}
	method addTabVisual(unaVisual) { listaDeVisuales.add(unaVisual)}
	method remTabVisual(unaVisual) { listaDeVisuales.remove(unaVisual)}
	
	method configurar(heigh, width, nombre, background) {
		game.title(nombre)
		game.height(heigh)
		game.width(width)
		game.ground(background)
	}
	
	method drawAutoposVisuals() {
		listaDeVisuales.forEach {unVisual => game.addVisual(unVisual)}
		game.addVisualCharacter(tabPlayer)		
	}
	
	method agarrarColliderNew(){
		agarrarItemLogic.apply()}
		
	
}

object crearComidas {
	
	method manzana(){}
	
	
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