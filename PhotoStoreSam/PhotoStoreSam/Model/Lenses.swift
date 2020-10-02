//
//  Lenses.swift
//  PhotoStoreSam
//
//  Created by Apple on 8/28/20.
//  Copyright © 2020 milic. All rights reserved.
//

import Foundation
import UIKit

class Lenses{
    var manufacturer:String
    var focalLength:String
    var maxAperture:String
    var minAperture:String
    var minFocus:String
    
    init(manufacturer:String,focalLength:String,maxAperture:String,minAperture:String,minFocus:String) {
        self.manufacturer = manufacturer
        self.focalLength = focalLength
        self.maxAperture = maxAperture
        self.minFocus = minFocus
        self.minAperture = minAperture
    }
    
    init (dict:[String:String]){
        let manufacturer = dict["manufacturer"]!
        let focalLength = dict["focalLength"]!
        let maxAperture = dict["maxAperture"]!
        let minAperture = dict["minAperture"]!
        let minFocus = dict["minFocus"]!
        
        self.manufacturer = manufacturer
        self.focalLength = focalLength
        self.maxAperture = maxAperture
        self.minAperture = minAperture
        self.minFocus = minFocus
    }
    
}
