//
//  AnimojiView.swift
//  NC1
//
//  Created by Bruno Pastre on 30/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit
import AVFoundation


class AnimojiView: UIView {
    
    var debugImage: UIImageView!
    
    var currentLayer: AVPlayerLayer?
    var player: AVPlayer?
    
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
//        debugImage.image = UIImage(named: "winky")
        
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
    
    
    func play(_ player: AVPlayer) {
      
        self.player?.pause()
        self.currentLayer?.removeFromSuperlayer()
        
        
        self.currentLayer = nil
        self.player = nil
        
        let layer = AVPlayerLayer(player: player)

        layer.bounds = self.debugImage.bounds
        layer.frame = self.debugImage.frame
        
        layer.repeatCount = 1
        layer.repeatDuration = 0
        
        layer.videoGravity = .resizeAspectFill

        player.actionAtItemEnd = .none
        player.externalPlaybackVideoGravity = .resizeAspectFill

        self.layer.addSublayer(layer)
        
        self.currentLayer = layer
        self.player = player
        
        self.player?.play()
    }
    
    func clear() {
//        self.currentLayer?.player?.pause()
//        self.currentLayer?.removeFromSuperlayer()
//        self.currentLayer = nil
//        self.debugImage.isHidden = false
    }

    
}

