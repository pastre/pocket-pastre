//
//  Story.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class Story {
    
    internal init(name: String?, milestones: [Milestone]?, iconName: String?) {
        self.name = name
        self.milestones = milestones
        self.iconName = iconName
    }
    
    
    var name: String!
    var milestones: [Milestone]!
    var iconName: String!
    
    
}
