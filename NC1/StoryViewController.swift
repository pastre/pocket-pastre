//
//  StoryViewController.swift
//  NC1
//
//  Created by Bruno Pastre on 22/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var storiesCollectionView: UICollectionView!
    
    @IBOutlet weak var animojiView: AnimojiViewFrame!
    var story: Story!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.storiesCollectionView.dataSource = self
        self.storiesCollectionView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTap))
        
        self.animojiView.addGestureRecognizer(tapGesture)
        
    }
    
    

    @objc func onTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    // MARK: - CollectionView methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
        return self.story.milestones.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyDeselected", for: indexPath)
//        let milestone = self.story.milestones[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.height * 0.6
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return CGPoint(x: 100, y: 100)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return -90
    }
    
}



extension StoryViewController: AnimojiViewContainer {
    func getParentView() -> UIView {
        return self.animojiView
    }
    
    func getSourceFrame() -> CGRect {
        return self.animojiView.frame
    }
    
    func getDestinationFrame() -> CGRect {
        return self.animojiView.frame
    }
    
    func sourceTransitionWillStart() {
        // TODO
    }
    
    func sourceTransitionDidEnd() {
        // TODO
    }
    
    func destinationTransitionWillStart() {
        // TODO
    }
    
    func destinationTransitionDidEnd() {
        // TODO
    }
    
    
}
