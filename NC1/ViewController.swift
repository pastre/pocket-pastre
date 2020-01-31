//
//  ViewController.swift
//  NC1
//
//  Created by Bruno Pastre on 21/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController, AnimojiViewContainer {
   
    @IBOutlet weak var story1View: UIView!
    @IBOutlet weak var story2View: UIView!
    @IBOutlet weak var story3View: UIView!
    @IBOutlet weak var story4View: UIView!
    @IBOutlet weak var story5View: UIView!
    @IBOutlet weak var story6View: UIView!
    
    @IBOutlet weak var animojiView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onTap))
        
        self.view.addGestureRecognizer(tap)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.currentSelectedView = nil
        
        self.setupButtons()
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.configureButtons()
        
        AnimojiViewManager.instance.startAnimation()
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Setup functions
    
    func setupButtons() {
        
        
        for ( button) in self.getButtons() {
            
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.onPan))
            
            button.isUserInteractionEnabled = true
            button.addGestureRecognizer(panGesture)
            
            button.transform = button.transform.scaledBy(x: 0.001, y: 0.001)
        }
    }
    
    // MARK: - Configure buttons
    
    func configureButtons() {
        UIView.animate(withDuration: 0.5) {
            self.getButtons().forEach {
                $0.transform = .identity

                $0.layoutIfNeeded()
                $0.setNeedsDisplay()
                
            }
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
    
       
    
        if isBig ?? false {
            self.onStorySelected(view)
        } else {
            UIView.animate(withDuration: 0.1) {
                       view.transform = .identity
                   }
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
    
    var currentSelectedView: UIView?
    
    func onStorySelected(_ view: UIView) {
        guard let index = self.getButtons().firstIndex(of: view) else { return }
        self.currentSelectedView = view
        
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
    
    @objc func onTap(_ gesture: UITapGestureRecognizer?) {
        guard let gesture = gesture else {
            self.animateButtons()
            return
        }
        let location = gesture.location(in: self.view)
        
        for button in self.getButtons() {
            if button.frame.contains(location) {
                self.animateButton(button)
                return
            }
        }
        
        self.animateButtons()
    }
    
    
    // MARK: - Helpers
    
    func animateButton(_ button: UIView) {
        let buttonCenter = button.center
        let absCenter = self.view.center
        
        let dx = buttonCenter.x - absCenter.x
        let dy = buttonCenter.y - absCenter.y
        
        self.getButtons().forEach { self.view.bringSubviewToFront($0) }
        
        UIView.animate(withDuration: 0.15, animations: {
            button.transform = button.transform.translatedBy(x: -dx, y: -dy)
        }) { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                button.transform = button.transform.scaledBy(x: 2, y: 2)
            }) { (_) in
                UIView.animate(withDuration: 0.15, delay: 0.3, options: [], animations: {
                    button.transform = .identity
                }, completion: nil)
            }
        }
    }
    
    func animateButtons() {
        
        UIView.animate(withDuration: 0.3, animations:  {
            self.getButtons().forEach { (button) in
                button.alpha = 0
                button.transform = button.transform.scaledBy(x: 2, y: 2)
            }
        } ) { (_) in
            self.getButtons().forEach { (button) in
                
                button.alpha = 1
                button.transform = .identity
            }
        }
    }
    
    func getButtons() -> [UIView] {
        return [
            self.story1View,
//            self.story2View,
            self.story3View,
            self.story4View,
//            self.story5View,
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

    // MARK: - AnimojiViewContainer
    
    func onAnimojiViewTapped() {
        self.onTap(nil)
    }
    
    func getParentView() -> UIView {
        return self.view
    }
    
    func getSourceFrame() -> CGRect {
        return self.view.convert(self.animojiView.frame, to: self.view)
    }
    
    func getDestinationFrame() -> CGRect {
        return self.view.convert(self.animojiView.frame, to: self.view)
    }
    
    func sourceTransitionWillStart() {
        // TODO
    }
    
    func sourceTransitionDidEnd() {
        self.getButtons().forEach {
            $0.alpha = 1
            $0.transform = .identity
        }
    }
    
    func destinationTransitionWillStart() {
        
    }
    
    func destinationTransitionDidEnd() {
        self.getButtons().forEach { self.view.bringSubviewToFront($0) }
    }
    
    func sourceTransitionAnimation() -> (() -> ())? {
        
        return {
            
            self.getButtons().forEach {
                let scale: CGFloat = $0 == self.currentSelectedView ? 5 : 0.001
                $0.transform = $0.transform.scaledBy(x: scale, y: scale)
                
                if $0 == self.currentSelectedView {
                    $0.alpha = 0
                }
                
            }
            
        }
    }
    
    func animatePresentation(with duration: TimeInterval) {
        // TODO
    }
    
    
}
