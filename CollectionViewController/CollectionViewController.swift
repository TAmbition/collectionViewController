//
//  CollectionViewController.swift
//  CollectionViewController
//
//  Created by 胡雨阳 on 15/11/28.
//  Copyright © 2015年 胡雨阳. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"
let topPadding: CGFloat = 20.0
let backgroundColor = UIColor(red: 56.0/255.0, green: 51.0/255.0, blue: 76.0/255.0, alpha: 1.0)

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let colorArray = NSMutableArray()
    let rowNumber = 15
    
    let collectionView = UICollectionView(frame: CGRectMake(0, topPadding, screenWidth, screenHeight - topPadding), collectionViewLayout: CollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        
        collectionView.backgroundColor = backgroundColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = false
        collectionView.contentInset = UIEdgeInsetsMake(0, 0, verticalPadding, 0)
        
        self.view.addSubview(collectionView)
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        let random = arc4random() % 360
        for index in 0 ..< rowNumber {
            let color = UIColor(hue: CGFloat(Int(random) + index * 6) % 360.0 / 360.0, saturation: 0.8, brightness: 1.0, alpha: 1.0)
            colorArray.addObject(color)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // - MARK: Collection View Data Source
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return colorArray.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.backgroundColor = colorArray.objectAtIndex(colorArray.count - 1 - indexPath.section) as? UIColor
        cell.titleLabel.text = "Notebook + " + String(indexPath.section + 1)
        cell.titleLine.alpha = 0.0
        cell.textView.alpha = 0.0
        cell.backButton.alpha = 0.0
        cell.tag = indexPath.section
        
        return cell
    }
    
}

