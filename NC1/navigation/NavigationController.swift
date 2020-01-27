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
        
        if let from = fromVC as? AnimojiViewContainer, let to = toVC as? AnimojiViewContainer {
            
            let transition = MilestoneTransition(source: from, destination: to)
            transition.shouldFlip = operation == .pop
            
            result = transition
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
