//
//  CountryTableViewCell.swift
//  domaci16
//
//  Created by Apple on 9/9/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet var countryNameLabel:UILabel!
    @IBOutlet var countryFlagImageView:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
