import socios.*

//punto 1
class Actividad {

	const property idiomas = #{}
	const property esfuerzo = false
	var property sirveParaBroncearse = true
	const property cantDias = 1

	// punto 2
	method esInteresante() {
		return idiomas.size() > 1
	}

	// punto 5
	method esAtractivaParaSocio(socio) {
		return socio.legustaActividad(self)
	}

	// punto 6
	method esRecomendadaParaSocio(socio) {
		return true
	}

}


class ViajeDePlaya inherits Actividad {

	const property largoPlaya = 1

	override method cantDias() = largoPlaya / 500

	override method esfuerzo() {
		return largoPlaya > 1200
	}

	override method esRecomendadaParaSocio(socio) {
		return self.esInteresante() and self.esAtractivaParaSocio(socio) and not socio.actividadesRealizadas().contain(self)
	}

}

class ExcursionACiudad inherits Actividad {

	var property cantAtracciones

	override method cantDias() = cantAtracciones / 2

	override method esfuerzo() = cantAtracciones >= 5

	override method sirveParaBroncearse() = false

	override method esInteresante() {
		return super() or self.cantAtracciones() == 5
	}

	override method esRecomendadaParaSocio(socio) {
		return self.esInteresante() and self.esAtractivaParaSocio(socio) and not socio.actividadesRealizadas().contain(self)
	}

}

class ExcursionACiudadTropical inherits ExcursionACiudad {

	override method cantDias() = super() + 1

	override method sirveParaBroncearse() = true

}

class SalidaDeTrekking inherits Actividad {

	var property cantDiasDeSolXAnio = 0
	var property cantKmCaminando = 0

	override method cantDias() = cantKmCaminando / 50

	override method esfuerzo() = self.cantKmCaminando() > 80

	override method sirveParaBroncearse() = self.cantDiasDeSolXAnio() > 200 and self.sonMasDe100DiasY100Km()

	method sonMasDe100DiasY100Km() = self.cantDiasDeSolXAnio().bethween(100, 200) and self.cantKmCaminando() > 120

	override method esInteresante() {
		return super() and self.cantDiasDeSolXAnio() > 140
	}
	override method esRecomendadaParaSocio(socio) {
		return self.esInteresante() and self.esAtractivaParaSocio(socio) and not socio.actividadesRealizadas().contain(self)
	}

}

//punto 3

class Gimnasia inherits Actividad{

	
	override method esfuerzo() = true
	override method sirveParaBroncearse() = false
	override method idiomas() = { "Espaniol" }
	
	override method esRecomendadaParaSocio(socio) {
		return  socio.edad().bethween(20,30)
	}

}


