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
    var delegate: ExpandableHeaderViewDelegate?
    var section: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, section: Int, delegate: ExpandableHeaderViewDelegate) {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor(red: (191.0/255.0), green: (155.0/255.0), blue: (110.0/255.0), alpha: 1.0)
        self.textLabel?.textAlignment = .center
        self.textLabel?.font = UIFont(name: "HelveticaNeue", size: 18)
        self.contentView.backgroundColor = UIColor(red: (248.0/255.0), green: (247.0/255.0), blue: (241.0/255.0), alpha: 1.0)
    }

    
}
