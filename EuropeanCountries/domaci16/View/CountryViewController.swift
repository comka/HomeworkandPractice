//
//  CountryViewController.swift
//  domaci16
//
//  Created by Apple on 9/4/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet var tableview:UITableView!
    var europeCountries = ["Albania","Andorra","Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina","Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany","Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania","Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia","Norway","Poland","Portugal","Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey","Ukraine","United Kingdom","Vatican City"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.countries2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryTableViewCell
        let countries = Model.shared.countries2
        cell.countryNameLabel.text = countries[indexPath.row].country
        cell.accessoryType = .disclosureIndicator
            for name in europeCountries{
                if countries[indexPath.row].country == name{
                    cell.countryFlagImageView.image = UIImage(named: "\(name)")
                }
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showCities", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let indexpath = tableview.indexPathForSelectedRow {
                let citiesVC = segue.destination as! CitiesViewController
                let country = Model.shared.countries2[indexpath.row]
                citiesVC.country = country
        }
}
}
