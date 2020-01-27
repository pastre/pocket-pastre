//
//  AnimojiViewManager.swift
//  NC1
//
//  Created by Bruno Pastre on 27/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation
import UIKit

class AnimojiViewManager {
    static let instance = AnimojiViewManager()
    
    private let view: AnimojiView = {
       let view = AnimojiView()
        
        view.backgroundColor = .green
        
        return view
    }()
    
    private init() {
        
    }
    
    func getAnimojiView() -> UIView {
        return self.view
    }
}
