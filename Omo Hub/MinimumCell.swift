//
//  MinimumCell.swift
//  Omo Hub
//
//  Created by Casper Castellini on 5/2/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class MinimumCell: UITableViewCell {
    
    @IBOutlet var minImg: UIImageView!
    
    @IBOutlet var headerLabel: UILabel!
    
    @IBOutlet var amtLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
