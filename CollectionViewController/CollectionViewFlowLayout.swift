//
//  CollectionViewFlowLayout.swift
//  CollectionViewController
//
//  Created by 胡雨阳 on 15/11/29.
//  Copyright © 2015年 胡雨阳. All rights reserved.
//

import UIKit

let horizonalPadding: CGFloat = 10.0
let verticalPadding: CGFloat = 10.0

let screenWidth = UIScreen.mainScreen().bounds.size.width
let screenHeight = UIScreen.mainScreen().bounds.size.height

let cellWidth = screenWidth - 2 * horizonalPadding
let cellHeight: CGFloat = 45.0

let springFactor: CGFloat = 10.0

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        itemSize = CGSizeMake(cellWidth, cellHeight)
        headerReferenceSize = CGSizeMake(screenWidth, verticalPadding)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        itemSize = CGSizeMake(cellWidth, cellHeight)
        headerReferenceSize = CGSizeMake(screenWidth, verticalPadding)
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let offsetY = self.collectionView!.contentOffset.y
        let attrsArray = super.layoutAttributesForElementsInRect(rect)
        let collectionViewFrameHeight = self.collectionView!.frame.size.height
        let collectionViewContentHeight = self.collectionView!.contentSize.height
        let scrollViewContentInsetBottom = self.collectionView!.contentInset.bottom
        let bottomOffset = offsetY + collectionViewFrameHeight - collectionViewContentHeight - scrollViewContentInsetBottom
        let numberOfItems = self.collectionView!.numberOfSections()
        
        for attr: UICollectionViewLayoutAttributes in attrsArray! {
            if (attr.representedElementCategory == UICollectionElementCategory.Cell) {
                var cellRect = attr.frame
                if offsetY <= 0 {
                    let distance = fabs(offsetY) / springFactor
                    cellRect.origin.y += offsetY + distance * CGFloat(attr.indexPath.section + 1)
                } else if bottomOffset > 0 {
                    let distance = bottomOffset / springFactor
                    cellRect.origin.y += bottomOffset - distance * CGFloat(numberOfItems - attr.indexPath.section)
                }
                attr.frame = cellRect
            }
        }
        return attrsArray
    }
}
