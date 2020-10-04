//
//  DigitalCameras.swift
//  PhotoStoreSam
//
//  Created by Apple on 8/28/20.
//  Copyright © 2020 milic. All rights reserved.
//

import Foundation
import UIKit


class DigitalCameras {
    var manufacturer:String
    var model:String
    var sensorResolution:String
    var wifi: Bool
    var image: UIImage?
    
    init (manufacturer:String, model:String, sensorResolution:String, wifi:Bool, image:UIImage?){
        self.manufacturer = manufacturer
        self.model = model
        self.sensorResolution = sensorResolution
        self.wifi = wifi
        self.image = image
    }
}
