//
//  ViewController.swift
//  Xylophone
//
//  Created by Apple on 10/28/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func play (_ sender:UIButton){
        let buttonTitle = sender.titleLabel!.text
               sender.alpha = 0.5
               playSound(buttonName: buttonTitle!)
               DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
                   sender.alpha = 1
               }
           }
           
           func playSound(buttonName:String) {
                     let url = Bundle.main.url(forResource: "\(buttonName)", withExtension: "wav")
                         player = try! AVAudioPlayer(contentsOf: url!)
                         player!.play()
                 }
}

