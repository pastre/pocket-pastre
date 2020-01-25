//
//  StoryDetailPushTransition.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation
import UIKit

class MilestoneTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let fromDelegate: MilestoneTransitionAnimatorDelegate!
    let toDelegate: MilestoneTransitionAnimatorDelegate!
    
    init? (fromDelegate: Any, toStoryDetailVc vc: MilestoneTransitionAnimatorDelegate) {
        guard let del = fromDelegate as? MilestoneTransitionAnimatorDelegate else { return nil }
        self.fromDelegate = del
        self.toDelegate = vc
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    
    static func defaultOffscreenFrameForPresentaion() -> CGRect {
        return CGRect(origin: .zero, size: CGSize(width: 300, height: 300))
    }
    
    
}
