//
//  OverviewViewController.swift
//  MoneyTracker
//
//  Created by Apple on 11/17/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView:UITableView!
    var dataSourceMoney:[MoneyTracker]?
    
    override func viewWillAppear(_ animated: Bool) {
        fetchMoneyTrackers()
    }
    
    func fetchMoneyTrackers(){
        dataSourceMoney = CoreDataManager.shared.fetchMoneyTrackers()
        tableView.reloadData()
    }
    

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSourceMoney == nil ? 0 : dataSourceMoney!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        
        let oneItem = dataSourceMoney![indexPath.row]
        cell.textLabel?.text = "\(oneItem.relIncomeCostType!.name!): \(oneItem.name!) "
        cell.detailTextLabel?.text = "\(oneItem.amount)"
        
        if oneItem.relIncomeCostType!.isCostType {
            cell.imageView?.image = UIImage(named: "out arrow")
        }else{
            cell.imageView?.image = UIImage(named: "in arrow")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
            let incomeCostType = dataSourceMoney![indexPath.row]
            dataSourceMoney?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
            CoreDataManager.shared.deleteMoneyTrackerType(incomeCostType)
           }
    }
}
