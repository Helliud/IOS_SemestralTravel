//
//  modeloHotel.swift
//  travel
//
//  Created by equipo on 12/11/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import Foundation

class modeloHotel{
    var nombreHotel : String
    var paisHotel : String
    var estadoHotel : String
    var ciudadHotel : String
    var ubicacionHotel : String
    var costoHotel : String
    var sitioHotel : String
    var telefonoHotel : String
    var descripcionHotel : String
    var calificacionHotel : String
    var imagen1Hotel : String
    var imagen2Hotel : String
    
    init(diccionario : NSDictionary) {
        self.nombreHotel = ""
        self.paisHotel = ""
        self.estadoHotel = ""
        self.ciudadHotel = ""
        self.ubicacionHotel = ""
        self.costoHotel = ""
        self.sitioHotel = ""
        self.telefonoHotel = ""
        self.descripcionHotel = ""
        self.calificacionHotel = ""
        self.imagen1Hotel = ""
        self.imagen2Hotel = ""
        
        if let acf = diccionario.value(forKey: "acf") as? NSDictionary{
            if let nombreHotel = acf.value(forKey: "nombrehotel") as? String{
                self.nombreHotel = nombreHotel
                }
            if let paisHotel = acf.value(forKey: "paishotel") as? String{
                self.paisHotel = paisHotel
            }
            if let paisHotel = acf.value(forKey: "paishotel") as? String{
                self.paisHotel = paisHotel
            }
            if let estadoHotel = acf.value(forKey: "estadohotel") as? String{
                self.estadoHotel = estadoHotel
            }
            if let ciudadHotel = acf.value(forKey: "ciudadhotel") as? String{
                self.ciudadHotel = ciudadHotel
            }
            if let ubicacionHotel = acf.value(forKey: "ubicacionhotel") as? String{
                self.ubicacionHotel = ubicacionHotel
            }
            if let costoHotel = acf.value(forKey: "costohotel") as? String{
                self.costoHotel = costoHotel
            }
            if let sitioHotel = acf.value(forKey: "sitiohotel") as? String{
                self.sitioHotel = sitioHotel
            }
            if let telefonoHotel = acf.value(forKey: "telefonohotel") as? String{
                self.telefonoHotel = telefonoHotel
            }
            if let descripcionHotel = acf.value(forKey: "descripcionhotel") as? String{
               self.descripcionHotel = descripcionHotel
            }
            if let calificacionHotel = acf.value(forKey: "calificacionhotel") as? String{
               self.calificacionHotel = calificacionHotel
            }
            if let imagen1Hotel = acf.value(forKey: "imagenhotel1") as? String{
               self.imagen1Hotel = imagen1Hotel
            }
            if let imagen2Hotel = acf.value(forKey: "imagenhotel2") as? String{
               self.imagen2Hotel = imagen2Hotel
            }
        }
    }
}

