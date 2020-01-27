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
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        guard let destinationView = transitionContext.view(forKey: .to) else { return }
        guard let sourceView = transitionContext.view(forKey: .from) else { return }
        
        
        let sourceAnimojiFrame = self.source.getSourceFrame()
        let destinationAnimojiFrame = self.destination.getDestinationFrame()
        
        let animojiView = AnimojiViewManager.instance.getAnimojiView()
        
        animojiView.frame = sourceAnimojiFrame
        
        
        containerView.addSubview(sourceView)
        containerView.addSubview(animojiView)
        
        
        let duration = self.transitionDuration(using: transitionContext)
         let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.95) {
            
            if
                let sourceTransition = self.source.sourceTransitionAnimation() {
                sourceTransition()
                print("Source is up!")
            }
            
            animojiView.frame = destinationAnimojiFrame
                    
        }

        
        animator.addCompletion { (position) in
            
            containerView.addSubview(destinationView)
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

            self.source.sourceTransitionDidEnd()
            self.destination.destinationTransitionDidEnd()
            
//            containerView.addSubview(destinationView)
//
            animojiView.removeFromSuperview()
            
            AnimojiViewManager.instance.configure(on: self.destination)
            
            self.destination.animatePresentation(with: 5)
            
            print("Completed animation")
        }
        
        self.source.sourceTransitionWillStart()
        self.destination.destinationTransitionWillStart()
        
        animator.startAnimation()
    }
}
