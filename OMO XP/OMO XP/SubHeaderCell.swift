//
//  SubHeaderCell.swift
//  OMO XP
//
//  Created by Casper Castellini on 5/10/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class SubHeaderCell: UITableViewCell {
    
    @IBOutlet var reservationInfoLabel: UILabel!
    
    @IBOutlet var scheduleInfoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
