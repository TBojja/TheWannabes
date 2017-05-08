//
//  HoursCell.swift
//  Omo Hub
//
//  Created by Casper Castellini on 5/2/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class HoursCell: UITableViewCell {
    
    
    @IBOutlet var hoursImg: UIImageView!
    
    @IBOutlet var headerLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
