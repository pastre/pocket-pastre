//
//  MilestoneTransition.swift
//  NC1
//
//  Created by Bruno Pastre on 25/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

class MilestoneTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var source: AnimojiViewContainer
    var destination: AnimojiViewContainer!
    
    var shouldFlip: Bool = false
    
    init(source: AnimojiViewContainer, destination: AnimojiViewContainer) {
        self.source = source
        self.destination = destination
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        guard let destinationView = transitionContext.view(forKey: .to) else { return }
        
        
        let sourceAnimojiFrame = self.source.getSourceFrame()
        let destinationAnimojiFrame = self.destination.getDestinationFrame()
        
        let animojiView = AnimojiViewManager.instance.getAnimojiView()
        
        animojiView.frame = sourceAnimojiFrame
        
        
        containerView.addSubview(destinationView)
        containerView.addSubview(animojiView)
        
        

        
         let animator = UIViewPropertyAnimator(duration: self.transitionDuration(using: transitionContext), dampingRatio: 0.95) {
            
            animojiView.frame = destinationAnimojiFrame
                    
        }

        
        animator.addCompletion { (position) in
            
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

            self.source.sourceTransitionDidEnd()
            self.destination.destinationTransitionDidEnd()
            
//            containerView.addSubview(destinationView)
//
            animojiView.removeFromSuperview()
            
            AnimojiViewManager.instance.configure(on: self.destination)
            
            print("Completed animation")
        }
        
        self.source.sourceTransitionWillStart()
        self.destination.destinationTransitionWillStart()
        
        animator.startAnimation()
    }
    
    
}


protocol AnimojiViewContainer: class {
    
    func getSourceFrame() -> CGRect
    func getDestinationFrame() -> CGRect
    
    func sourceTransitionWillStart()
    func sourceTransitionDidEnd()
    
    func destinationTransitionWillStart()
    func destinationTransitionDidEnd()
    
    func getParentView() -> UIView
    
    func onAnimojiViewTapped()
}

extension CGSize {
    static func > (_ a: CGSize, _ b: CGSize) -> Bool {
        return a.width * a.height > b.width * b.height
    }
}

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}
