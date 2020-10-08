//
//  Posts.swift
//  UserInternetLoader
//
//  Created by Apple on 10/6/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class Posts: NSObject {
    var id: Int
    var title:String
    var body:String
    var comment:[Comments]?
    
    init (dict:[String:Any]){
        id = dict["id"] as! Int
        title = dict["title"] as! String
        body = dict["body"] as! String
    }
}
