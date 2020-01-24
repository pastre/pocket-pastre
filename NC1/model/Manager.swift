//
//  Manager.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

class Manager  {
    
    static let instance = Manager()
    
    var stories: [Story]!
    
    private init() {
        self.stories = []
    }
    
    func getStory(at index: Int) -> Story? {
        if index  < 0 { return nil }
        if index >= stories.count { return nil }
        
        return self.stories[index]
    }
}
