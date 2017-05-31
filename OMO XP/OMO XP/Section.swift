//
//  Section.swift
//  OMO XP
//
//  Created by Casper Castellini on 5/4/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import Foundation

struct Section {
    var headerTitle: String!
    var content: [String]!
    var expanded: Bool!
    var subtitle: String!
    
    
    // Initializer
    init(headerTitle: String, content: [String], expanded: Bool, subtitle: String) {
        self.headerTitle = headerTitle
        self.content = content
        self.expanded = expanded
        self.subtitle = subtitle
        
    }
}
