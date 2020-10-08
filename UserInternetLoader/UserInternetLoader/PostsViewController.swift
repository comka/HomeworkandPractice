//
//  PostsViewController.swift
//  UserInternetLoader
//
//  Created by Apple on 10/6/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableview:UITableView!
    var user:User!

    override func viewDidLoad() {
        super.viewDidLoad()
        JSONdata.loadPosts(user: user) { (success) in
            if success {
                self.tableview.reloadData()
            }else{
                print("Greska")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.post == nil ? 0:user.post!.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        
        let post = user.post![indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
       }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showComments", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showComments" {
            let vc = segue.destination as! CommentsViewController
            if let indexpath = tableview.indexPathForSelectedRow{
                let selectedPost = user.post![indexpath.row]
                vc.post = selectedPost
        }
    }

}
}
