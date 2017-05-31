//
//  ExpandableHeaderView.swift
//  OMO XP
//
//  Created by Casper Castellini on 5/4/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

protocol ExpandableHeaderViewDelegate {
    func toggleSection(header: ExpandableHeaderView, section: Int)
}

class ExpandableHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    var delegate: ExpandableHeaderViewDelegate?
    var section: Int!
    
    // Adds gesture recognizer that performs #selector action when tapped
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
    }
    
    // Initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
    }
    
    func selectHeaderView(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, subtitle: String, section: Int, delegate: ExpandableHeaderViewDelegate) {
        self.titleLabel.text = title
        self.subLabel.text = subtitle
        self.section = section
        self.delegate = delegate
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel?.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        self.subLabel?.textColor = UIColor.black
        self.subLabel?.textAlignment = .center
        self.subLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 13)
        self.subLabel?.alpha = 0.7
        self.contentView.backgroundColor = UIColor(red: (248.0/255.0), green: (247.0/255.0), blue: (241.0/255.0), alpha: 1.0)
        
    }

    
}
