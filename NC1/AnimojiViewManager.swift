//
//  AnimojiViewManager.swift
//  NC1
//
//  Created by Bruno Pastre on 27/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation
import UIKit

class AnimojiViewManager {
    static let instance = AnimojiViewManager()
    
    private let view: AnimojiView = {
        let view = AnimojiView()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.00001)
        
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    var delegate: AnimojiViewContainer?
    
    private init() {
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.onViewTapped))
        
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func onViewTapped() {
        self.delegate?.onAnimojiViewTapped()
    }
    
    func getAnimojiView() -> UIView {
        return self.view
    }
    
    func configure(on view: AnimojiViewContainer) {
        
        let frame = view.getDestinationFrame()
        
        view.getParentView().addSubview(self.view)
        
        self.view.frame = frame
        view.getParentView().bringSubviewToFront(self.view)
        
        self.delegate = view
        
        print("Configured animoji view on", view)
        
    }
}
