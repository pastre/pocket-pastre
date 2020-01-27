//
//  AnimojiViewContainer.swift
//  NC1
//
//  Created by Bruno Pastre on 27/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

protocol AnimojiViewContainer: class {
    
    func getSourceFrame() -> CGRect
    func getDestinationFrame() -> CGRect
    
    func sourceTransitionWillStart()
    func sourceTransitionAnimation() -> (() -> ())?
    func sourceTransitionDidEnd()
    
    func destinationTransitionWillStart()
    func destinationTransitionDidEnd()
    
    func getParentView() -> UIView
    
    func onAnimojiViewTapped()
    
    func animatePresentation(with duration: TimeInterval)

}

