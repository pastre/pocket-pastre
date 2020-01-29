//
//  StoryViewController.swift
//  NC1
//
//  Created by Bruno Pastre on 22/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AnimojiViewContainer {

    @IBOutlet weak var contentContainerView: AnimatedGradientBorderView!
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    @IBOutlet weak var animojiParentView: UIView!
    @IBOutlet weak var animojiView: AnimojiViewFrame!
    
    var story: Story!
    
    var currentSelectedItem: IndexPath?
    
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
        
        self.setupContentView()
        self.storiesCollectionView.reloadData()
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.presentContentView()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Setup methods
    
    func setupContentView() {
        self.contentContainerView.transform = self.contentContainerView.transform.translatedBy(x: -500, y: 0)
    }
    
    // MARK: - Presentation methods
    
    func presentContentView() {
        UIView.animate(withDuration: 0.5) {
            self.contentContainerView.transform = .identity
        }
    }

    
    // MARK: - CollectionView methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
        return self.story.milestones.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyDeselected", for: indexPath) as! MilestoneCollectionViewCell
        
        cell.transform = cell.transform.scaledBy(x: 0.001, y: 0.001)
        if indexPath.item < self.story.milestones.count {

            let milestone = self.story.milestones[indexPath.item]
            
            cell.iconImageView.image = indexPath != self.currentSelectedItem ? milestone.getDeselectedIcon() : milestone.getSelectedIcon()
            
            UIView.animate(withDuration: 0.5) {
                cell.transform = .identity
            }
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selecionou")
        if indexPath == self.currentSelectedItem { return }
        
        
        
        if let prevSelectedItem = self.currentSelectedItem {

            self.currentSelectedItem = indexPath
            self.storiesCollectionView.reloadItems(at: [ prevSelectedItem, indexPath])
            
            return
        }

        self.currentSelectedItem = indexPath
        self.storiesCollectionView.reloadItems(at: [ indexPath])
        
        
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.height * 0.6
        return CGSize(width: size, height: size)
    }
    
//    func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
//        return CGPoint(x: 100, y: 100)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return -90
//    }
    
    // MARK: - AnimojiViewContainer
    
    func sourceTransitionAnimation() -> (() -> ())? {
        return {
            self.contentContainerView.transform = self.contentContainerView.transform.translatedBy(x: -500, y: 0)
            self.storiesCollectionView.visibleCells.forEach {
                $0.contentView.transform = $0.contentView.transform.scaledBy(x: 0.001, y: 0.001)
                print("Saca o transform na collection")
            }
        
        }
    }

    
    func onAnimojiViewTapped() {
         self.onTap()
    }
    
    func getParentView() -> UIView {
        return self.view
    }
    
    func getSourceFrame() -> CGRect {
        return self.animojiParentView.convert(self.animojiView.frame, to: self.view)

    }
    
    func getDestinationFrame() -> CGRect {
        return self.getSourceFrame()

    }
    
    func sourceTransitionWillStart() {
        // TODO
    }
    
    func sourceTransitionDidEnd() {
        // TODO
    }
    
    func destinationTransitionWillStart() {
    }
    
    func destinationTransitionDidEnd() {
        
        self.storiesCollectionView.visibleCells.forEach { (cell) in
            cell.contentView.transform = cell.contentView.transform.scaledBy(x: 0.001, y: 0.001)
            print("Saca esse transform")
        }    }
    
    func animatePresentation(with duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.storiesCollectionView.visibleCells.forEach { (cell) in
                cell.contentView.transform = .identity
            }
        }
    }
    
    
    // MARK: - Callbacks
    
    
    @objc func onTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
