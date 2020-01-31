//
//  VideoManager.swift
//  NC1
//
//  Created by Bruno Pastre on 30/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import AVFoundation

class VideoManager  {
    
    var players: [Expression : AVPlayer]! = [Expression: AVPlayer]()
    
    var currentPlayer: AVPlayer?
    init() {
        Expression.allCases.forEach { (c) in

            guard let url = Bundle.main.url(forResource: c.rawValue, withExtension:"mov") else { return }
            let player = AVPlayer(url: url)
            
            players[c] = player
        }
    }
    
    var isSetup: Bool! = false
    
    func setup() {
        if self.isSetup { return }
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(fileComplete),
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
            object: nil)
        
        DispatchQueue.main.async {
            self.configureAnimator()
        }
        
        self.playVideo()
        
        self.isSetup = true
    }
    
    func configureAnimator() {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
//            if !self.canPlay { return }
//
//                self.playVideo()
//
//        }
    }
    
    @objc func fileComplete(_ notification: NSNotification) {
        
        self.currentPlayer?.pause()
        self.currentPlayer = nil
        self.isPlaying = false
        self.playVideo()
    }
    
    var isIdle: Bool = false
    var isPlaying: Bool = false
    
    
    func playVideo() {
        
        if self.isPlaying { return }
        
        
        self.isPlaying = true
        
        guard let animoji = isIdle ? .idle : Expression.allCases.filter ({ (e) -> Bool in
            return e != .idle
        }).randomElement() else { return }
        
        guard let url = Bundle.main.url(forResource: animoji.rawValue, withExtension:"mov") else { return }
        let player = AVPlayer(url: url)
        player.isMuted = true
        self.currentPlayer = player
        
        
        AnimojiViewManager.instance.getAnimojiView().play(self.currentPlayer!)
        
        self.isIdle = !self.isIdle
        
    }
    
}
