//
//  CommentTableViewCell.swift
//  UserInternetLoader
//
//  Created by Apple on 10/6/20.
//  Copyright © 2020 milic. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet var name:UILabel!
    @IBOutlet var email:UILabel!
    @IBOutlet var body:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        body.adjustsFontSizeToFitWidth = true
        body.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
