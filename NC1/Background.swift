//
//  Background.swift
//  NC1
//
//  Created by Bruno Pastre on 21/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

//class BackgroundScene: SKScene {
//    
//    var starPool: [StarNode] = []
//    let starManager: StarManager = StarManager()
//    
//    // Write setup SpriteKit code here
//    override func didMove(to view: SKView) {
//        
//    }
//    
//    func setupStarControl() {
//        
//        DispatchQueue.main.async {
//            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
//                self.starManager.updateStars(self.starPool)
//            }
//        }
//    }
//    
//}

class GameScene: SKScene {
    
    var lastUpdate: TimeInterval = 0
    let displaySize: CGRect = UIScreen.main.bounds

    let light = SKLightNode()
    
    override func didMove(to view: SKView) {
        
        let center = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(color: SKColor.purple, size: displaySize.size)
        background.position = center
        background.lightingBitMask = 1
        addChild(background)
        
        let light = self.light.copy() as! SKLightNode
        light.position = CGPoint(x: 0.5, y: 0.5)
        light.falloff = 3
        light.lightColor = .white
        light.shadowColor = .black
        addChild(light)
        
        
//        let fadeIn = SKAction.falloff(by: 9, duration: 1)
        let action = SKAction.customAction(withDuration: 3) { (node, time) in
            guard let ligthNode = node as? SKLightNode else { return }
            ligthNode.falloff = time
            
        }
        light.run(action) {
            print("Rodei!!")
        }

    }

    override func update(_ currentTime: TimeInterval) {
        let timeDelta = currentTime - lastUpdate
        return
        if timeDelta < 1 && self.lastUpdate != 0 { return }
        if self.lastUpdate != 0 { return }
        
        
        let light = SKLightNode.init()
        let lightColor = SKColor(hue: 0.62 , saturation: 0.89, brightness: 1.0, alpha: 0.4)
//        let offColor = lightColor.withAlphaComponent(0)
        
//        light.position = CGPoint(x: CGFloat.random(in: 0..<1), y: CGFloat.random(in:  0..<1))
        light.position = CGPoint(x: 0.5, y: 0.5)
        light.falloff = 2
        light.lightColor = .white
        light.shadowColor = .black
        
        addChild(light)
        
            let fadeIn = SKAction.falloff(to: 2, duration: 1)
        light.run(fadeIn) {
            print("Rodei!!")
        }
//            let fadeOut = SKAction.falloff(to: 1, duration: 3)
//
//            let sequence = SKAction.sequence([fadeIn, fadeOut])
//
//            light.run(sequence)
            

    

        
//        SKAction.fadeAlpha(to: 0, duration: 1)
//        light.removeFromParent()
        
        self.lastUpdate = currentTime
    }

}


class StarManager {
    
    static func updateStars(_ stars: [StarNode]){
        for star in stars {
            switch star.state {
            case .spawned:
                self.onSpawned(star: star)
            case .dead:
                self.onDead(star: star)
            case .climax:
                self.onClimax(star: star)
            default: continue
            }
        }
    }
    
    static func onSpawned(star: StarNode) {
        star.rise()
    }
    
    static func onDead(star: StarNode) {
        star.removeFromParent()
    }
    
    static func onClimax(star: StarNode) {
        
    }
    
    
}

enum StarState {
    case spawned
    case rising
    case climax
    case falling
    case dead
}

class StarNode: SKNode {
    
    var state: StarState = .spawned
    
    func rise(){
        self.state = .rising
    }
    
    
}
