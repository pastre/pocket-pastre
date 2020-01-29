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
            Story(name: "Apple Developer Academy", milestones: [
                Milestone(name: "Bubbles! Why not!", description: "This is the first app I have ever made. It was born as a WWDC entry, where I had my first contact with Apple technologies, 3D scenes, design and Augmented Reality. It was really fun to learn all that stuff, and a real challange to develop it in just 10 days", iconName: "bubbles"),
                Milestone(name: "Harmonify - Colors & Palettes", description: "TODO", iconName: "harmonify"),
                Milestone(name: ".space", description: "TODO", iconName: "dotspace"),
                Milestone(name: "Movie Genie", description: "TODO", iconName: "movieGenie"),
                                   
                ],
                  
                iconName: "academyIcon"),

            
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
