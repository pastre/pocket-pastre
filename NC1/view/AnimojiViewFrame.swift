//
//  AnimojiView.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation
import UIKit

class AnimojiViewFrame: UIView {
    
    override var debugDescription: String {
        return "AnimojiFrame"
    }
    
}

class AnimojiView: UIView {
    
    var debugImage: UIImageView!
    
    override var debugDescription: String {
        return "AnimojiView"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.commonInit()
    }
    
    func commonInit () {
        
       
        let debugImage = UIImageView(frame: self.frame)
        
        debugImage.translatesAutoresizingMaskIntoConstraints = false
        debugImage.image = UIImage(named: "winky")
        
        self.addSubview(debugImage)
        
        debugImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        debugImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        debugImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        debugImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        
        self.debugImage = debugImage
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.debugImage.frame = self.frame
    }
    
}
