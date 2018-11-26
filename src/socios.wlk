import actividades.*

//punto 4
class Socio {

	var edad
	var property idiomasQueHabla = #{}
	var property actividadesRealizadas = []
	var maxActividadesRealizadas = 0
	

	method esAdoradorDelSol() {
		return actividadesRealizadas.all({ act => act.sirveParaBroncearse() })
	}

	method actividadesEsforzadas() = actividadesRealizadas.map({ act => not act.esfuerzo() })

	method registrarActividad(actividad) {
		if (actividadesRealizadas.size() < maxActividadesRealizadas) {
			actividadesRealizadas.add(actividad)
			maxActividadesRealizadas + 1
		} else {
			self.error("No podes realizar mas actividades. Llegaste al limite")
		}
	}

	//punto 5
	method legustaActividad(actividad) {
		return self.soySocioTranquilo(actividad) or self.soySocioCoherente(actividad) or self.soySocioRelajado(actividad)
	}

	method soySocioTranquilo(actividad) {
		return actividad.cantDias() >= 4
	}

	method soySocioCoherente(actividad) {
		return self.esAdoradorDelSol() and actividad.sirveParaBroncearse()
	}

	method soySocioRelajado(actividad) {
		return actividad.idiomas().intersection(idiomasQueHabla).size() >= 1
	}

}