//
//  CitiesViewController.swift
//  domaci16
//
//  Created by Apple on 9/9/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

   @IBOutlet var tableview:UITableView!
    var country:Countries?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableview.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country!.city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = country?.city[indexPath.row]
        return cell!
    }
}
