//
//  MilestonePopTransition.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

class MilestonePopTransition: MilestoneTransition {
    
    override func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5
    }
    
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        let fromAnimojiView = self.fromDelegate.transitionAnimojiView()
        let toAnimationView = self.toDelegate.transitionAnimojiView()
        
        let duration = self.transitionDuration(using: transitionContext)
        let spring: CGFloat = 0.95
        
        containerView.subviews.forEach {$0.removeFromSuperview()}
        
        containerView.addSubview(fromAnimojiView)
        
        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: spring) {
//            transitionAnimojiView.transform = transitionAnimojiView.transform.translatedBy(x: deltaX, y: deltaY).scaledBy(x: scaleX, y: scaleY)
        }
        
        
        animator.addCompletion { (position) in
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

            self.toDelegate.transitionDidEnd()
            self.fromDelegate.transitionDidEnd()
            
//            fromView.addSubview(transitionAnimojiView)
//            transitionAnimojiView.transform = .identity
            
            print("Completed animation")
        }


        self.toDelegate.transitionWillStart()
        self.fromDelegate.transitionWillStart()
        animator.startAnimation()
        
    }
    
    
}

