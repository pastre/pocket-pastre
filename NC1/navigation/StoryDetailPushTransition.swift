//
//  StoryDetailPushTransition.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation
import UIKit

class StoryDetailPushTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let fromDelegate: StoryDetailTransitionAnimatorDelegate
    let storyDetailVc: StoryViewController
    
    init? (fromDelegate: Any, toStoryDetailVc vc: StoryViewController) {
        guard let del = fromDelegate as? StoryDetailTransitionAnimatorDelegate else { return nil }
        self.fromDelegate = del
        self.storyDetailVc = vc
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
                
        let transitionAnimojiView = self.fromDelegate.transitionAnimojiView()
        let toAnimationView = self.storyDetailVc.animojiView
        transitionAnimojiView.translatesAutoresizingMaskIntoConstraints = true
        
        containerView.addSubview(toView)
        containerView.addSubview(transitionAnimojiView)
        
        let duration = self.transitionDuration(using: transitionContext)
        let spring: CGFloat = 0.95
        
        let deltaX = toAnimationView!.center.x - transitionAnimojiView.center.x
        let deltaY = toAnimationView!.center.y - transitionAnimojiView.center.y + toAnimationView!.frame.height / 2
        
        let scaleX = toAnimationView!.frame.width / transitionAnimojiView.frame.width
        let scaleY = toAnimationView!.frame.width / transitionAnimojiView.frame.width

        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: spring) {
            transitionAnimojiView.transform = transitionAnimojiView.transform.translatedBy(x: deltaX, y: deltaY).scaledBy(x: scaleX, y: scaleY)
        }
        
        
        animator.addCompletion { (position) in
            // Remove the transition image
//            self.transitionView.removeFromSuperview()

            // Tell UIKit we're done with the transition
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

            // Tell our view controllers that we're done, too.
            self.storyDetailVc.transitionDidEnd()
            self.fromDelegate.transitionDidEnd()
            
            transitionAnimojiView.removeFromSuperview()
            
            print("Completed animation")
        }


        self.storyDetailVc.transitionWillStart()
        self.fromDelegate.transitionWillStart()
        animator.startAnimation()
    }
    
    
    static func defaultOffscreenFrameForPresentaion() -> CGRect {
        return CGRect(origin: .zero, size: CGSize(width: 300, height: 300))
    }
    
    
}
