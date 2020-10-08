//
//  JSONuserLoad.swift
//  UserInternetLoader
//
//  Created by Apple on 10/3/20.
//  Copyright © 2020 milic. All rights reserved.
//

import Foundation
import UIKit

class JSONdata {
    
    static let BASE_URL = "https://jsonplaceholder.typicode.com/"
    
    static func loadUsers (completion: @escaping (Bool,[User]?) -> ()) {
        let endpoint = "users"
        let url = URL(string: BASE_URL + endpoint)!
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data,response,error) in
            if error == nil {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String:Any]]
                    var users = [User]()
                    for dict in jsonData {
                        let newUser = User(dict: dict)
                        users.append(newUser)
                    }
                    DispatchQueue.main.async {
                        completion(true,users)
                    }
                }
                catch{
                    completion(false,nil)
                }
            }
        }
        task.resume()
    }
    
    static func loadPosts (user:User?,completion:@escaping (Bool) -> ()) {
        let endpoint = "posts?userId=\(user!.id)"
        let url = URL(string: BASE_URL + endpoint)!
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data,response,error) in
            if error == nil {
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String:Any]]
                    var posts = [Posts]()
                    for dict in jsonData {
                        let newPost = Posts(dict: dict)
                        posts.append(newPost)
                    }
                    user?.post = posts
                    DispatchQueue.main.async {
                        completion(true)
                    }
                }
                catch{
                    completion(false)
                }
            }
            
        }
        task.resume()
    }
    
    static func loadComments (posts:Posts, completion:@escaping (Bool) -> ()) {
        let endpoint = "comments?postId=\(posts.id)"
        let url = URL(string: BASE_URL + endpoint)!
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) {(data,response,error) in
            if error == nil {
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String:Any]]
                    var comments = [Comments]()
                    for dict in jsonData{
                        let newCommnet = Comments(dict: dict)
                        comments.append(newCommnet)
                    }
                    posts.comment = comments
                    DispatchQueue.main.async {
                        completion(true)
                    }
                }
                catch{
                    completion(false)
                }
            }
        }
        task.resume()
    }
}
