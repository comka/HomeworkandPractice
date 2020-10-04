//
//  ViewController.swift
//  PhotoStoreSam
//
//  Created by Apple on 8/28/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class CamerasViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableview:UITableView!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Digital Cameras"
        // Do any additional setup after loading the view.
    }

//MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Model.shared.digitalCameras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! DigitalCameraTableViewCell
        
        let camera = Model.shared.digitalCameras[indexPath.row]
        cell.titleLabel.font = .systemFont(ofSize: 25)
        cell.titleLabel.text = "\(camera.model)"
        cell.manufacturerLabel.text = "\(camera.manufacturer)"
        cell.wifiLabel.text = "Wifi"
        cell.wifiSwitch.isOn = camera.wifi
        cell.imageView?.image = camera.image
        cell.accessoryType = .detailButton
        return cell
    }
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CameraDetailsViewController", sender: nil)
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexpath = tableview.indexPathForSelectedRow {
            let cameraDetailVC = segue.destination as! CameraDetail
            let camera = Model.shared.digitalCameras[indexpath.row]
            cameraDetailVC.camera = camera
        }
    }
    

}
