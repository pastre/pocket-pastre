//
//  BackgroundView.swift
//  NC1
//
//  Created by Bruno Pastre on 23/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

class BackgroundView: UIView {

    var hasSetup: Bool = false
    
    override func layoutSubviews() {
        if self.hasSetup { return }
        
        self.hasSetup = true
        
        let backgroundView: UIView = {
            let view = UIView()
            
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
            
            return view
        }()
        
        self.addSubview(backgroundView)
        
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        let starsLayer = CAEmitterLayer()
        let cell = CAEmitterCell()
        
        starsLayer.emitterPosition = self.center
        starsLayer.emitterSize = self.frame.size
        starsLayer.emitterShape = .cuboid
        
        cell.birthRate = 6
        cell.lifetime = 5
        cell.alphaSpeed = -1.5
        cell.scale = 0.5
        
        
        cell.color = UIColor.white.cgColor
        cell.contents = UIImage.circle(diameter: 5, color: UIColor.white.withAlphaComponent(0.7)).cgImage
        
        starsLayer.emitterCells = [cell]
        
        backgroundView.layer.addSublayer(starsLayer)
        
        print("Configured CA BG")
    }

}
