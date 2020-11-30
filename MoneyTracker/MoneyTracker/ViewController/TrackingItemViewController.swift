//
//  TrackingItemViewController.swift
//  MoneyTracker
//
//  Created by Apple on 11/17/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class TrackingItemViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var amountTextFiled:UITextField!
    @IBOutlet var segmentedControll:UISegmentedControl!
    @IBOutlet var typePicker:UIPickerView!
    
    var typeDataSource = [IncomeCostType]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFromDataBase()
        // Do any additional setup after loading the view.
    }
    
    func fetchFromDataBase(){
           if let fetchResults = CoreDataManager.shared.fetchIncomeCostType(isCost: segmentedControll.selectedSegmentIndex != 0){
            
               typeDataSource = fetchResults
               typePicker.reloadAllComponents()
           }
       }
    
    @IBAction func segmentedControlSelectedIndexChanged(){
           fetchFromDataBase()
       }
    
    @IBAction func save (){
        let name = nameTextField.text!
        let amount = Double(amountTextFiled.text!)!
        let type = typeDataSource[typePicker.selectedRow(inComponent: 0)]
        
        CoreDataManager.shared.insertMoneyTracker(name: name, amount: amount, type: type)
        
        navigationController?.popViewController(animated: true)
    }
    

     func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeDataSource.count
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeDataSource[row].name
    }

}
