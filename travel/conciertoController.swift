//
//  conciertoController.swift
//  travel
//
//  Created by equipo on 19/11/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class conciertoController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tvConcierto: UITableView!
    
    var concierto : [modeloConcierto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://molletravel.azurewebsites.net/wp-json/acf/v3/conciertos").responseJSON {
                   response in switch(response.result){
                   case .success(let datos) :
                       if let arregloConcierto = datos as? NSArray{
                           for concierto in arregloConcierto {
                            
                               if let diccionarioConcierto = concierto as? NSDictionary{
                                   let nuevoConcierto = modeloConcierto(diccionario: diccionarioConcierto)
                                   self.concierto.append(nuevoConcierto)
                               }
                           }
                           self.tvConcierto.reloadData()
                       }
                   case .failure(_) :
                       print("Error")
                   }
               }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return concierto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaConcierto") as? celdaConciertoController
        celda?.lblClasificacion.text = concierto[indexPath.row].ciudadBanda
        celda?.lblConcierto.text = concierto[indexPath.row].nombreBanda
        
        AF.request("https://molletravel.azurewebsites.net/" + concierto[indexPath.row].imagen1Banda).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgConcierto.image =  data
            case .failure(_) :
                print("Algo salio mal")
                
            }
        }
        return celda!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToConciertoDetalles"{
                   let destino = segue.destination as? conciertoDetalleControler
            destino?.concierto = concierto[tvConcierto.indexPathForSelectedRow!.row]
    }
    
    
}
}
