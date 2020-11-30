//
//  SettingsViewController.swift
//  MoneyTracker
//
//  Created by Apple on 11/17/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var segmentedControll:UISegmentedControl!
    @IBOutlet var tableView:UITableView!
    var dataSource = [IncomeCostType]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFromDataBase()
    }
    
    func fetchFromDataBase(){
        if let fetchResults = CoreDataManager.shared.fetchIncomeCostType(isCost: segmentedControll.selectedSegmentIndex != 0){
            dataSource = fetchResults
            tableView.reloadData()
        }
    }
    
    @IBAction func addNewItem(){
        
        let strItemType = segmentedControll.selectedSegmentIndex == 0 ? "income":"cost"
        let alert = UIAlertController(title: "New Item", message: "Enter name for \(strItemType)", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let isCostType = self.segmentedControll.selectedSegmentIndex == 0 ? false:true
            let name = alert.textFields![0].text!
            CoreDataManager.shared.insertIncomeCostType(name: name, isCostType: isCostType)
            self.fetchFromDataBase()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func segmentedControlSelectedIndexChanged(){
        fetchFromDataBase()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = dataSource[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let incomeCostType = dataSource[indexPath.row]
            dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            CoreDataManager.shared.deleteIncomeCostType(incomeCostType)
        }
    }
}
