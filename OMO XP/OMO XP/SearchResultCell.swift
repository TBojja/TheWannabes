//
//  SearchResultCell.swift
//  OMO XP
//
//  Created by Casper Castellini on 5/9/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet var imgPin: UIImageView!
    
    @IBOutlet var resultsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
