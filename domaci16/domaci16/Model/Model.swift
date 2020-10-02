//
//  Model.swift
//  domaci16
//
//  Created by Apple on 9/4/20.
//  Copyright © 2020 milic. All rights reserved.
//

import Foundation
import UIKit

class Model{
    var countries2 = [Countries]()
    
    static let shared:Model = Model()
    private init(){
        countries2 = [Countries]()
    }
    var europeCountries = ["Albania","Andorra","Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina","Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany","Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania","Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia","Norway","Poland","Portugal","Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey","Ukraine","United Kingdom","Vatican City"]

    func loadJson(){
        if let path = Bundle.main.path(forResource: "countries and cities", ofType: "json") {
        let countiresURL = URL(fileURLWithPath: path)
        if let countriesData = try? Data(contentsOf: countiresURL){
            if let countiresArray = try? JSONSerialization.jsonObject(with: countriesData, options: .allowFragments) as! Dictionary<String,Array<String>>{
               
                for dict in countiresArray {
                    for country in europeCountries{
                        if country == dict.key{
                            countries2.append(Countries(country: dict.key, city: dict.value))
            }
        }
                    countries2.sort(by: {$0.country < $1.country})
    }
}
}
}
}
}
