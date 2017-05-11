//
//  MainListCell2.swift
//  OMO XP
//
//  Created by Casper Castellini on 5/10/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class MainListCell2: UITableViewCell {
    
    @IBOutlet var vendorImage: UIImageView!
    
    @IBOutlet var vendorLabel: UILabel!
    
    @IBOutlet var vendorLocation: UILabel!
    
    @IBOutlet var cuisineLabel: UILabel!
    
    @IBOutlet var amountLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
