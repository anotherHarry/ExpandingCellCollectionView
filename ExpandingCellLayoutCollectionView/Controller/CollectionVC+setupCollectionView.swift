//
//  CollectionVC+setupCollectionView.swift
//  ExpandingCellLayoutCollectionView
//
//  Created by Harry Cao on 30/8/17.
//  Copyright © 2017 Harry Cao. All rights reserved.
//

import UIKit

extension CollectionViewController {
  
  func setupCollectionView() {
    self.collectionView?.backgroundColor = .clear
    
    self.collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: CVCConstants.cellIdentifier)
//    self.collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: CVCConstants.footerCellIdentifier)
    
    self.collectionView?.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0)
    self.collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
    
    self.collectionView?.addSubview(refreshControl)
  }
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return girls.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: CVCConstants.cellIdentifier, for: indexPath) as! CollectionViewCell
    cell.girl = girls[indexPath.item]
    return cell
  }
  
//  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//    let cell = self.collectionView!.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CVCConstants.footerCellIdentifier, for: indexPath)
//    cell.addSubview(spinner)
//    return cell
//  }
  
  // For load data when scrolling to bottom
  override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if indexPath.item >= girls.count - 5 && !isFetchingData {
      isFetchingData = true
      
      DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2.0) { [unowned self] in
        self.girls.append(contentsOf: GirlManager.shared.getGirls())
        
        DispatchQueue.main.async {
          self.collectionView?.reloadData()
          self.isFetchingData = false
        }
      }
    }
  }
}
