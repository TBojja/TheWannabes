//
//  MainListViewCell.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/16/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class MainListViewCell: UITableViewCell {

    @IBOutlet var vendorImage: UIImageView!
    
    @IBOutlet var vendorTitle: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}