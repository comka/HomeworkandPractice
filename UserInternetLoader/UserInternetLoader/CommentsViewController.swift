//
//  CommentsViewController.swift
//  UserInternetLoader
//
//  Created by Apple on 10/6/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableview:UITableView!
    var post:Posts!

    override func viewDidLoad() {
        super.viewDidLoad()
        JSONdata.loadComments(posts: post!) { (success) in
            if success {
                self.tableview.reloadData()
            }else{
                print("Greska")
            }
        }

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comment == nil ? 0:post.comment!.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        
        let comment = post.comment![indexPath.row]
        cell.name.text = comment.name
        cell.email.text = comment.email
        cell.body.text = comment.body
        return cell
       }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }

}
