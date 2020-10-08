//
//  Adderess.swift
//  UserInternetLoader
//
//  Created by Apple on 10/3/20.
//  Copyright © 2020 milic. All rights reserved.
//

import Foundation
import CoreLocation

class Address{
    var street:String
    var city:String
    var zipcode:String
    var geo:CLLocationCoordinate2D
    
    init(dict:[String:Any]){
        street = dict["street"] as! String
        city = dict["city"] as! String
        zipcode = dict["zipcode"] as! String
        let geo = dict["geo"] as! [String:String]
        let lat = Double(geo["lat"]!)
        let lng = Double(geo["lng"]!)
        self.geo = CLLocationCoordinate2D(latitude: lat!, longitude: lng!)
    }
}
