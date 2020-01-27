//
//  StoryDetailTransitionAnimatorDelegate.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

protocol MilestoneTransitionAnimatorDelegate1: class {
    func transitionWillStart()
    func transitionDidEnd()
    
    func frame() -> CGRect?
    
    func transitionAnimojiView() -> AnimojiViewFrame
}
