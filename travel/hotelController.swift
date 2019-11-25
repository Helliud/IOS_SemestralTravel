//
//  hotelController.swift
//  travel
//
//  Created by equipo on 18/11/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class hotelController:
    UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   
    @IBOutlet weak var tvHotel: UITableView!
    
    var hotel : [modeloHotel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://molletravel.azurewebsites.net/wp-json/acf/v3/hoteles").responseJSON {
                   response in switch(response.result){
                   case .success(let datos) :
                       if let arregloHoteles = datos as? NSArray{
                           for hotel in arregloHoteles {
                               if let diccionarioHotel = hotel as? NSDictionary{
                                   let nuevoHotel = modeloHotel(diccionario: diccionarioHotel)
                                   self.hotel.append(nuevoHotel)
                               }
                           }
                           self.tvHotel.reloadData()
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
         return hotel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaHotel") as? celdaHotelController
        celda?.lblHotel.text = hotel[indexPath.row].nombreHotel
        
        AF.request("https://molletravel.azurewebsites.net/" + hotel[indexPath.row].imagen1Hotel).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgHotel1.image =  data
            case .failure(_) :
                print("Algo salio mal")
                
            }
        }
        return celda!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHotelDetalles"{
                   let destino = segue.destination as? hotelDetalleControler
                       destino?.hotel = hotel[tvHotel.indexPathForSelectedRow!.row]
    }
    
    
}
}
