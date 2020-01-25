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
    
    @IBOutlet weak var story1View: UIImageView!
    @IBOutlet weak var story2View: UIImageView!
    @IBOutlet weak var story3View: UIImageView!
    @IBOutlet weak var story4View: UIImageView!
    @IBOutlet weak var story5View: UIImageView!
    @IBOutlet weak var story6View: UIImageView!
    
    @IBOutlet weak var winkyImageView: UIImageView!
    
    @IBOutlet weak var animojiView: AnimojiView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupViewPan()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Setup functions
    
    
    func setupViewPan() {
        
        for button in self.getButtons() {
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.onPan))
            
            button.isUserInteractionEnabled = true
            button.addGestureRecognizer(panGesture)
        }
    }
    
    // MARK: - Pan gesture methods
    
    var isBig: Bool?
    var prevLocation: CGPoint?
    
    func onStart(_ view: UIView){
        self.view.bringSubviewToFront(view)
        
        self.isBig = false
    }
    
    func onChanged(_ view: UIView, location: CGPoint) {
//        print("location", location, view.center)
        defer { self.testIntersect(view) }
        if let prev = self.prevLocation {
            UIView.animate(withDuration: 0.1) {
                
                view.transform = view.transform.translatedBy(x: location.x - prev.x, y: location.y - prev.y)
            }
        }
        
        self.prevLocation = location
//        view.transform.tx = location.x
//        view.transform.ty = location.y
    }
    
    func onFinished(_ view: UIView) {
    
        UIView.animate(withDuration: 0.1) {
            view.transform = .identity
        }
    
        if isBig ?? false {
            self.onStorySelected(view)
        }
        
        self.prevLocation = nil
        self.isBig = nil
    }
    
    func testIntersect(_ view: UIView) {
        guard let isBig = self.isBig else { return }
        let scale: CGFloat = 2
        
        if self.getStoryHighlightArea().contains(CGPoint(x: view.frame.midX, y: view.frame.midY)){
            
            if isBig { return }
            
            self.isBig = true
            UIView.animate(withDuration: 0.1) {
                view.transform = view.transform.scaledBy(x: scale, y: scale)
            }
        } else if isBig {
            UIView.animate(withDuration: 0.1) {
                view.transform = view.transform.scaledBy(x: 1/scale, y: 1/scale)
            }
            
            self.isBig = false
        }
    }
    
    func onStorySelected(_ view: UIView) {
        guard let index = self.getButtons().firstIndex(of: view) else { return }
        
        self.performSegue(withIdentifier: "story", sender: index)
    }
 
    // MARK: - Callbacks
    
    @objc func onPan(_ sender: Any?) {
        
        guard let gesture = sender as? UIPanGestureRecognizer else { return }
        guard let view = gesture.view else { return }
//        guard let view = sender as? UIView else  { return }
//        guard let gesture = view.gestureRecognizers?.first as? UIPanGestureRecognizer else { return }
        
        let location = gesture.translation(in: self.view)
        
        switch gesture.state {
        case .began:
            self.onStart(view)
        case .changed:
            self.onChanged(view, location: location)
        case .ended:
            self.onFinished(view)
        default:
            break
        }
        
        
    }
    
    
    // MARK: - Helpers
    
    func getButtons() -> [UIView] {
        return [
            self.story1View,
            self.story2View,
            self.story3View,
            self.story4View,
            self.story5View,
            self.story6View,
        ]
    }
    
    func getStoryHighlightArea() -> CGRect {
        let screen = self.view.frame.size
        
        let middleX = screen.width / 2
        let middleY = screen.height / 2
        let areaSize: CGFloat = 200
        
        return CGRect(x: middleX - (areaSize / 2), y: middleY - (areaSize / 2), width: areaSize, height: areaSize)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewIndex = sender as? Int {
        
            guard let dest = segue.destination as? StoryViewController else { return }
            
            dest.story = Manager.instance.getStory(at: viewIndex)
            
        }
        
        
        // TODO: - Add story to view controller
    }

}

extension ViewController: MilestoneTransitionAnimatorDelegate {
    func frame() -> CGRect? {
        return self.animojiView.frame
    }
    
    func transitionAnimojiView() -> AnimojiView {
        
        return self.animojiView
    }
    
    func transitionWillStart() {
        print("Ta comecaaando na VC")
    }

    func transitionDidEnd() {
        
        print("Acabou na VC")
    }

    
}
