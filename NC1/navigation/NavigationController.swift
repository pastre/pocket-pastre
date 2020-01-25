//
//  NavigationController.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate {

   var currentAnimationTransition: UIViewControllerAnimatedTransitioning?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        var result: UIViewControllerAnimatedTransitioning?
        
        if let milestoneVc = toVC as? StoryViewController, operation == .push {
            result = MilestonePushTransition(fromDelegate: fromVC, toStoryDetailVc: milestoneVc)
        } else if let storiesVc = toVC as? ViewController, operation == .pop {
            result = MilestonePopTransition(fromDelegate: fromVC, toStoryDetailVc: storiesVc)
        }
        
        self.currentAnimationTransition = result
        return result
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
