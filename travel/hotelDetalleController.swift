//
//  hotelDetalleController.swift
//  travel
//
//  Created by equipo on 19/11/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class hotelDetalleControler: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tvHotelDetalle: UITableView!
    
    override func viewDidLoad() {
        self.title = hotel!.nombreHotel
    }
    var hotel : modeloHotel?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaHotelDetalle") as? celdaHotelDetalleController
        
        
        celda?.lblNombre.text = hotel!.nombreHotel.uppercased()
         celda?.lblPais.text = hotel!.paisHotel
         celda?.lblCosto.text = hotel!.costoHotel
         celda?.lblSitio.text = hotel!.ubicacionHotel
         celda?.lblCiudad.text = hotel!.ciudadHotel
         celda?.lblEstado.text = hotel!.estadoHotel
         celda?.lblTelefono.text = hotel!.telefonoHotel
         celda?.lblDireccion.text = hotel!.sitioHotel
         celda?.lblDescripcion.text = hotel!.descripcionHotel
         celda?.lblCalificacion.text = hotel!.calificacionHotel
       

          AF.request("https://molletravel.azurewebsites.net/" + hotel!.imagen1Hotel).responseImage{
              response in
              switch(response.result) {
              case .success(let data) :
                  celda?.imagenHotel1.image =  data
              case .failure(_) :
                  print("Algo salio mal")
          }
        }
            
            AF.request("https://molletravel.azurewebsites.net/" + self.hotel!.imagen2Hotel).responseImage{
                response in
                switch(response.result) {
                case .success(let data) :
                    celda?.imagenHotel2.image =  data
                case .failure(_) :
                    print("Algo salio mal")
            }
            
    }
        return celda!

        }
        

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 650
    }
    

}

