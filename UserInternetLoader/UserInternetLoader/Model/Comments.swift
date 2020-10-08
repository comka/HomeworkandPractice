//
//  Comments.swift
//  UserInternetLoader
//
//  Created by Apple on 10/6/20.
//  Copyright © 2020 milic. All rights reserved.
//

import Foundation

class Comments {
    var id:Int
    var name:String
    var email:String
    var body:String
    
    init (dict:[String:Any]){
        id = dict["id"] as! Int
        name = dict["name"] as! String
        email = dict["email"] as! String
        body = dict["body"] as! String
    }
}
