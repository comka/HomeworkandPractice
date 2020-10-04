//
//  FlowerImageDownloader.swift
//  vezbanje
//
//  Created by Apple on 10/4/20.
//  Copyright © 2020 milic. All rights reserved.
//

import Foundation
import UIKit

class FlowerImageDownloader {
    var flower:Flower?
    var completionHandelr:(()->())?
    
    func startDownload () {
        if let flower = flower, let completeion = completionHandelr {
            DispatchQueue.global().async {
                let imageURL = URL(string: flower.imageURL)!
                do {
                    let imageData = try Data (contentsOf: imageURL)
                    let image = UIImage (data: imageData)
                    flower.image = image
                    DispatchQueue.main.async {
                        completeion()
                    }
                }
                catch{
                    
                }
            }
        }
    }
}
