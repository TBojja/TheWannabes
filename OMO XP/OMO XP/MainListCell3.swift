//
//  MainListCell3.swift
//  OMO XP
//
//  Created by Casper Castellini on 5/9/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class MainListCell3: UITableViewCell {
    
    @IBOutlet var vendorImg: UIImageView!
    
    @IBOutlet var vendorLabel: UILabel!
    
    @IBOutlet var vendorLocation: UILabel!
    
    @IBOutlet var amountLabel: UILabel!
    
    @IBOutlet var cuisineLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
