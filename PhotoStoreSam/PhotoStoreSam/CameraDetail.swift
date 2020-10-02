//
//  CameraDetail.swift
//  PhotoStoreSam
//
//  Created by Apple on 8/28/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class CameraDetail: UIViewController {
    
    @IBOutlet var manufacturerLabel:UILabel!
    @IBOutlet var modelLabel:UILabel!
    @IBOutlet var sensorResoulutionLabel:UILabel!
    @IBOutlet var wifiLabel:UILabel!
    @IBOutlet var cameraImageView:UIImageView!
    
    var camera: DigitalCameras?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let camera = camera {
            cameraImageView.image = camera.image
            modelLabel.text = "Model: \(camera.model)"
            manufacturerLabel.text = "Manufacturer: \(camera.manufacturer)"
            sensorResoulutionLabel.text = "Sensor resolution: \(camera.sensorResolution)"
            let wifiStr = "Wifi: \(camera.wifi ? "Available":"Not Available")"
            wifiLabel.text = "\(wifiStr)"
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}



