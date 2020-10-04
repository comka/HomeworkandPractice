//
//  ViewController.swift
//  vezbanje
//
//  Created by Apple on 9/24/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet var collectionview:UICollectionView!
    
    let loader = FlowerJSON()
    var imageDonwloaderInProggress = [IndexPath:FlowerImageDownloader]()
    var imageDownloaderLock = NSLock()

    override func viewDidLoad() {
        super.viewDidLoad()
        loader.startLoading { (success) in
            if success {
                self.collectionview.reloadData()
            }else{
                print("Neuspesno ucitavanje")
            }
        }
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loader.flowers.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flowerCell", for: indexPath) as! FlowerCollectionViewCell
        
        let flower = loader.flowers[indexPath.row]
        if flower.image == nil {
            startImageDownload(flower: flower, indexpath: indexPath, cell: cell)
        }else{
            cell.flowerImage.image = flower.image
        }
        return cell
       }
    
    func startImageDownload (flower:Flower,indexpath:IndexPath,cell:FlowerCollectionViewCell){
        
        if imageDonwloaderInProggress[indexpath] != nil {
            return
        }
        
        let imageDownloader = FlowerImageDownloader()
        imageDownloader.flower = flower
        imageDownloader.completionHandelr = {
           // let cell = self.collectionview.cellForItem(at: indexpath) as! FlowerCollectionViewCell
            self.imageDownloaderLock.lock()
            cell.flowerImage.image = flower.image
            self.imageDownloaderLock.unlock()
            self.imageDonwloaderInProggress[indexpath] = nil
        }
        imageDonwloaderInProggress[indexpath] = imageDownloader
        imageDownloader.startDownload()
    }
}

