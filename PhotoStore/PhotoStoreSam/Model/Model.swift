//
//  Model.swift
//  PhotoStoreSam
//
//  Created by Apple on 8/28/20.
//  Copyright © 2020 milic. All rights reserved.
//

import Foundation
import UIKit

class Model {
    
    static let shared:Model = Model()
    var digitalCameras = [DigitalCameras]()
    var lenses: [String:[Lenses]]
    
    private init (){
        digitalCameras = [DigitalCameras]()
        lenses = [String:[Lenses]]()
    }
    
    func loadData(){
        loadCameras()
        loadLenses()
    }
    
    func loadLenses (){
        if let path = Bundle.main.path(forResource: "lenses", ofType: "json"){
            let lensesURL = URL(fileURLWithPath: path)
            if let lensesData = try? Data(contentsOf: lensesURL){
                if let lensesDict = try? JSONSerialization.jsonObject(with: lensesData, options: .allowFragments) as? Dictionary<String,Array<Dictionary<String,String>>>{
                    
                    if let prime = lensesDict["prime"]{
                        var lensesArray = [Lenses]()
                        for dict in prime {
                            let lens = Lenses(dict: dict)
                            lensesArray.append(lens)
                        }
                        lenses["prime"] = lensesArray
                    }
                    
                    if let prime = lensesDict["zoom"]{
                                           var lensesArray = [Lenses]()
                                           for dict in prime {
                                               let lens = Lenses(dict: dict)
                                               lensesArray.append(lens)
                                           }
                                           lenses["zoom"] = lensesArray
                                       }
                    
                    if let prime = lensesDict["sale"]{
                                           var lensesArray = [Lenses]()
                                           for dict in prime {
                                               let lens = Lenses(dict: dict)
                                               lensesArray.append(lens)
                                           }
                                           lenses["sale"] = lensesArray
                                       }
                }
            }
        }
    }
    
    func loadCameras(){
        if let path = Bundle.main.path(forResource: "cameras", ofType: "json") {
            let camerasURL = URL(fileURLWithPath: path)
            if let camerasData = try? Data(contentsOf: camerasURL){
                if let cameras = try? JSONSerialization.jsonObject(with: camerasData, options: .allowFragments) as? Array <Dictionary <String,Any>>{
                    for dict in cameras {
                        let manufacturer = dict["manufacturer"] as! String
                        let model = dict["model"] as! String
                        let sensorResolution = dict["sensorResolution"] as! String
                        let wifi = dict["wifi"] as! Bool
                        let imageStr = dict["image"] as! String
                        let image = UIImage(named: imageStr)
                        
                        let digitalCamera = DigitalCameras(manufacturer: manufacturer, model: model, sensorResolution: sensorResolution, wifi: wifi, image: image)
                        digitalCameras.append(digitalCamera)
                    }
                }
            }
        }
    }
}
