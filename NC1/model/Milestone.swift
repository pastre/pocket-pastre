//
//  Milestone.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

class Milestone {
    internal init(name: String?, description: String?, iconName: String?) {
        self.name = name
        self.description = description
        self.iconName = iconName
    }
    
    
    var name: String!
    var description: String!
    var iconName: String!
    
    func getSelectedIcon() -> UIImage? {
        return UIImage(named: (self.iconName) + "Selected")
    }
    
    func getDeselectedIcon() -> UIImage? {
        return UIImage(named: (self.iconName) + "Deselected")
    }
    
    
}
