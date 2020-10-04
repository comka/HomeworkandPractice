//
//  FlowerJSON.swift
//  vezbanje
//
//  Created by Apple on 10/4/20.
//  Copyright © 2020 milic. All rights reserved.
//

import Foundation
import UIKit

class FlowerJSON{
    var flowers = [Flower]()
    
    func startLoading (completeion:@escaping (Bool) -> Void){
        DispatchQueue.global().async {
            let path = Bundle.main.path(forResource: "flowers", ofType: "json")!
            let url = URL(fileURLWithPath: path)
            let success:Bool
            do {
                let jsonData = try Data (contentsOf: url)
                let JSONObject = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [[String:String]]
                for dict in JSONObject {
                    let flower = Flower(imageURL: dict["link"]!)
                    self.flowers.append(flower)
                }
                success = true
            }
            catch{
                success = false
            }
            DispatchQueue.main.async {
                completeion(success)
            }
        }
    }
}
