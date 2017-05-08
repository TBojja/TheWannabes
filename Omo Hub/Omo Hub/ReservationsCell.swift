//
//  ReservationsCell.swift
//  Omo Hub
//
//  Created by Casper Castellini on 4/30/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class ReservationsCell: UITableViewCell {
    
    @IBOutlet var joinImg: UIImageView!
    
    @IBOutlet var orderImg: UIImageView!
    
    @IBOutlet var paidImg: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!

    @IBOutlet var infoLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
