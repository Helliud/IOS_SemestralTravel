//
//  modeloConcierto.swift
//  travel
//
//  Created by equipo on 12/11/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import Foundation

class modeloConcierto{
    var nombreBanda : String
    var fechaInicio : String
    var fechaFin : String
    var paisBanda : String
    var estadoBanda : String
    var ciudadBanda : String
    var lugarBanda : String
    var ubicacionBanda : String
    var horaInicio : String
    var horaFin : String
    var imagen1Banda : String
    var imagen2Banda : String
     
    init(diccionario : NSDictionary){
        nombreBanda = ""
        fechaInicio = ""
        fechaFin = ""
        paisBanda = ""
        estadoBanda = ""
        ciudadBanda = ""
        lugarBanda = ""
        ubicacionBanda = ""
        horaInicio = ""
        horaFin = ""
        imagen1Banda = ""
        imagen2Banda = ""
        
        if let acf = diccionario.value(forKey: "acf") as? NSDictionary{
                   if let nombreBanda = acf.value(forKey: "nombrebanda") as? String{
                       self.nombreBanda = nombreBanda
                   }
            if let fechaInicio = acf.value(forKey: "fechainicio") as? String{
                self.fechaInicio = fechaInicio
            }
            if let fechaFin = acf.value(forKey: "fechafin") as? String{
                           self.fechaFin = fechaFin
                       }
            if let paisBanda = acf.value(forKey: "paisbanda") as? String{
                                      self.paisBanda = paisBanda
                                  }
            if let estadoBanda = acf.value(forKey: "estadobanda") as? String{
                self.estadoBanda = estadoBanda
            }
            if let ciudadBanda = acf.value(forKey: "ciudadbanda") as? String{
                           self.ciudadBanda = ciudadBanda
                       }
            if let lugarBanda = acf.value(forKey: "lugarbanda") as? String{
                self.lugarBanda = lugarBanda
            }
            if let ubicacionBanda = acf.value(forKey: "ubicacionbanda") as? String{
                           self.ubicacionBanda = ubicacionBanda
                       }
            if let horaInicio = acf.value(forKey: "horainicio") as? String{
                self.horaInicio = horaInicio
            }
            if let horaFin = acf.value(forKey: "horafin") as? String{
                self.horaFin = horaFin
            }
            if let imagen1Banda = acf.value(forKey: "imagen1banda") as? String{
                           self.imagen1Banda = imagen1Banda
                       }
            if let imagen2Banda = acf.value(forKey: "imagen2banda") as? String{
                                    self.imagen2Banda = imagen2Banda
                                }
        }
    }    
}
