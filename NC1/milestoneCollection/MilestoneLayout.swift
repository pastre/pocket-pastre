//
//  MilestoneLayoutAttributes.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation
import UIKit

class MilestoneLayout: UICollectionViewFlowLayout {
    
    let nColumns: CGFloat = 1
    let cellPadding: CGFloat = -6
    
    var cache: [UICollectionViewLayoutAttributes] = []
    
    private var contentWidth: CGFloat {
      guard let collectionView = collectionView else {
        return 0
      }
      let insets = collectionView.contentInset
      return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    
    override func prepare() {
        guard let collectionView = self.collectionView else { return }
      
        let columnWidth = (collectionView.frame.width * 0.35) - 20
        let height: CGFloat = columnWidth
        
        let collectionHeight = collectionView.bounds.height
        
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let xOffset = CGFloat(item) * columnWidth
            let yOffset = collectionHeight * 0.1
            
            let frame = CGRect(x: 20 + xOffset, y: item % 2 == 0 ? yOffset : collectionHeight - height - yOffset, width: columnWidth, height: height)
            
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            attributes.frame = insetFrame
            
            cache.append(attributes)


        }
        
        self.scrollDirection = .horizontal
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
      var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
      
      // Loop through the cache and look for items in the rect
      for attributes in cache {
        if attributes.frame.intersects(rect) {
          visibleLayoutAttributes.append(attributes)
        }
      }
      return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath)
        -> UICollectionViewLayoutAttributes? {
      return cache[indexPath.item]
    }
}
