//
//  VillainCollectionViewController.swift
//  BondVillains
//
//  Created by Anna Rogers on 7/6/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation

import UIKit

class VillainCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances.
    let allVillains = Villain.allVillains
    
    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        tabBarController?.tabBar.hidden = false
//        
//        let space: CGFloat = 3.0
////        let dimension = (view.frame.size.height - (2 * space)) / 3.0
//        let dimension = view.frame.size.width >= view.frame.size.height ? (view.frame.size.width - (5 * space)) / 6.0 :  (view.frame.size.height - (2 * space)) / 3.0
////        when the phone is landscape then you need to use height to calculate the height
//        
//        flowLayout.minimumInteritemSpacing = space
//        flowLayout.minimumLineSpacing = space
//        flowLayout.itemSize = CGSizeMake(dimension, dimension)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
//        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
//            return
//        }
        
        if UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation) {
            flowLayout.itemSize = CGSize(width: 170, height: 170)
        } else {
            flowLayout.itemSize = CGSize(width: 192, height: 192)
        }
        
        flowLayout.invalidateLayout()
    }
    
    
    // MARK: Collection View Data Source
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allVillains.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("VillainCollectionViewCell", forIndexPath: indexPath) as! VillainCollectionViewCell
        let villain = self.allVillains[indexPath.row]
        
        // Set the name and image
//        cell.nameLabel.text = villain.name
        cell.villainImageView?.image = UIImage(named: villain.imageName)
        //cell.schemeLabel.text = "Scheme: \(villain.evilScheme)"
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("VillainDetailViewController") as! VillainDetailViewController
        detailController.villain = self.allVillains[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}


