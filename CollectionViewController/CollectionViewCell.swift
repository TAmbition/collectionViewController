//
//  CollectionViewCell.swift
//  CollectionViewController
//
//  Created by 胡雨阳 on 15/11/29.
//  Copyright © 2015年 胡雨阳. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLine: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelLeadCons: NSLayoutConstraint!
    
    var horizonalContraint = NSLayoutConstraint()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5.0
        self.horizonalContraint = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
    }
}
