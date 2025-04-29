object nave{
    const pasajeros = []
    method cantidadPasajeros() = pasajeros.size()
    method pasajeroDeMayorVitalidad(){return pasajeros.max({p => p.vitalidad()})}
    method estaEquilibrada(){
        return self.pasajeroDeMayorVitalidad().vitalidad() < self.pasajeroDeMenorVitalidad().vitalidad() * 2
    }
    method pasajeroDeMenorVitalidad(){return pasajeros.min({p => p.vitalidad()})}
    method hayPasajeroElegido(){return pasajeros({p => p.any(esElElegido())})}
    method chocar(){
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
        //pasajeros.forEach({p => pasajeros.remove(p)})
    }
    method acelerar(){
        self.pasajerosSinElegido().forEach({p => p.saltar()})
    }
    method pasajerosSinElegido(){
        return pasajeros({p => !p.esElElegido})
    }
}

object neo{
    var energia = 100
    method esElElegido() = true
    method saltar(){energia = energia / 2}
    method vitalidad() = energia * 0.1
}

object trinity{
    method vitalidad() = 0
    method esElElegido() = false
    method saltar(){}
}

object morfeo{
    var vitalidad = 8
    var estaCansado = false
    method esElElegido() = false
    method saltar() {
        vitalidad = 0.max(vitalidad - 1)
        estaCansado = !estaCansado
        }
    method estaCansado(){estaCansado}
    method vitalidad(){return vitalidad}
}