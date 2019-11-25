//
//  conciertoDetalleController.swift
//  travel
//
//  Created by equipo on 23/11/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class conciertoDetalleControler: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tvConciertoDetalles: UITableView!
    
    override func viewDidLoad() {
        self.title = concierto?.nombreBanda
    }
    
    var concierto : modeloConcierto?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaConciertoDetalle") as? celdaConciertoDetalleController
        
        celda?.lblNombreBanda.text = concierto!.nombreBanda
        celda?.lblFechaInicio.text = concierto!.fechaInicio
        celda?.lblFechaInicio.text = concierto!.fechaFin
        celda?.lblPaisBanda.text = concierto!.paisBanda
         celda?.lblEstadoBanda.text = concierto!.estadoBanda
         celda?.lblCiudadBanda.text = concierto!.ciudadBanda
         celda?.lblLugarBanda.text = concierto!.lugarBanda
         celda?.lblHoraInicio.text = concierto!.horaInicio
        celda?.lblHoraFinal.text = concierto!.horaFin
       

          AF.request("https://molletravel.azurewebsites.net/" + concierto!.imagen1Banda).responseImage{
              response in
              switch(response.result) {
              case .success(let data) :
                  celda?.imagenBanda1.image =  data
              case .failure(_) :
                  print("Algo salio mal")
          }
        }
            
            AF.request("https://molletravel.azurewebsites.net/" + self.concierto!.imagen2Banda).responseImage{
                response in
                switch(response.result) {
                case .success(let data) :
                    celda?.imagenBanda2.image =  data
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

