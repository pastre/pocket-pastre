//
//  ViewController.swift
//  NC1
//
//  Created by Bruno Pastre on 21/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var bgview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupCABackground()
    }
    
    func setupSKBackground() {
        let backgroundView: SKView = {
           let view = SKView()
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            return view
        }()
        
        self.view.addSubview(backgroundView)
        
        backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
        let scene = GameScene()
        
        backgroundView.presentScene(scene)
        
        print("Configured BG")
    }
    
    func setupCABackground() {
//        let backgroundView: SKView = {
//            let view = SKView()
//            view.translatesAutoresizingMaskIntoConstraints = false
//
//            view.ignoresSiblingOrder = true
//
//            view.showsFPS = true
//            view.showsNodeCount = true
//
//            return view
//        }()
//
//        let scene = BackgroundScene()
//
        let backgroundView: UIView = {
            let view = UIView()
            
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
            
            return view
        }()
        
        self.bgview.addSubview(backgroundView)
        
        backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        let starsLayer = CAEmitterLayer()
        
        starsLayer.emitterPosition = self.view.center
        starsLayer.emitterSize = self.view.frame.size
        starsLayer.emitterShape = .cuboid
//        starsLayer.emitterMode = .points
        
        
        let cell = CAEmitterCell()
        
        cell.birthRate = 6
        cell.lifetime = 5
        cell.alphaSpeed = -1.5
        cell.scale = 0.5
//        cell.velocity = 30
        
        cell.color = UIColor.white.cgColor
//        cell.emissionRange = 10
        cell.contents = UIImage.circle(diameter: 5, color: UIColor.white.withAlphaComponent(0.7)).cgImage
        
        starsLayer.emitterCells = [cell]
        
        backgroundView.layer.addSublayer(starsLayer)
        
        print("Configured CA BG")
    }

}

