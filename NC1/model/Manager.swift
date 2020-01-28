//
//  Manager.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

class Manager  {
    
    static let instance = Manager()
    
    var stories: [Story]!
    
    private init() {
        self.stories = [
        Story(name: "Apple Developer Academy", milestones: nil, iconName: "academyIcon"),
        Story(name: "AI", milestones: nil, iconName: "aiIcon"),
        Story(name: "Personal Projects", milestones: nil, iconName: "personalIcon"),
        Story(name: "Music", milestones: nil, iconName: "guitarIcon"),
        Story(name: "Hobbies", milestones: nil, iconName: "hobbyIcon"),
        Story(name: "Readings", milestones: nil, iconName: "readingIcon"),
        ]
    }
    
    func getStory(at index: Int) -> Story? {
        if index  < 0 { return nil }
        if index >= stories.count { return nil }
        
        return self.stories[index]
    }
    
}
