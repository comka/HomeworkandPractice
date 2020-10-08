//
//  User.swift
//  UserInternetLoader
//
//  Created by Apple on 10/3/20.
//  Copyright © 2020 milic. All rights reserved.
//

import Foundation
import UIKit

class User {
    var id:Int
    var name:String
    var username:String
    var address:Address
    var post:[Posts]?
    
    init(dict:[String:Any]) {
        id = dict["id"] as! Int
        name = dict["name"] as! String
        username = dict["username"] as! String
        let addressDict = dict["address"] as! [String:Any]
        address = Address(dict: addressDict)
    }
}

