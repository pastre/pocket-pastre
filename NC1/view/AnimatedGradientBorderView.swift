//
//  AnimatedGradientBorderView.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation
import UIKit

class AnimatedGradientBorderView: UIView {

    var hasSetup = false
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if hasSetup { return }
        self.hasSetup = true
        self.clipsToBounds = true
        
        let border = CAGradientLayer(layer: self.layer)
        
        border.colors = [CGColor(srgbRed: 0, green: 180/255, blue: 196/255, alpha: 1), CGColor(srgbRed: 186/255, green: 0, blue: 221/255, alpha: 1)]
        border.locations = [0, 1]
        border.startPoint = .zero
        border.endPoint = CGPoint(x: 0, y: 1)
        border.frame = self.bounds
        
        self.layer.insertSublayer(border, at: 0)
                
        let shape = CAShapeLayer()
        
        shape.lineWidth = 4
    
        shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 20).cgPath
        
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        let animation = CABasicAnimation(keyPath: "colors")
        
        animation.fromValue = [CGColor(srgbRed: 0, green: 180/255, blue: 196/255, alpha: 1), CGColor(srgbRed: 186/255, green: 0, blue: 221/255, alpha: 1)]
        animation.toValue = [CGColor(srgbRed: 186/255, green: 0, blue: 221/255, alpha: 1), CGColor(srgbRed: 0, green: 180/255, blue: 196/255, alpha: 1)]
        
        animation.autoreverses = true
        animation.repeatCount = .infinity
        animation.duration = 3

        
        border.mask = shape
        border.add(animation, forKey: nil)
        
        print("Completed drawing for gradient")
    }
}
