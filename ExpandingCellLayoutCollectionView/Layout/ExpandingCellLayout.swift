//
//  ExpandingCellLayout.swift
//  ExpandingCellLayoutCollectionView
//
//  Created by Harry Cao on 30/8/17.
//  Copyright © 2017 Harry Cao. All rights reserved.
//

import UIKit

class ExpandingCellLayout: UICollectionViewLayout {
  struct ECLConstants {
    static let standardHeight: CGFloat = 130.0
    static let featuredHeight: CGFloat = 300.0
    static let dragOffset: CGFloat = 200.0
  }
  
  let standardHeight = ECLConstants.standardHeight
  let featuredHeight = ECLConstants.featuredHeight
  let dragOffset = ECLConstants.dragOffset
  
  var cachedLayoutAttribites: [UICollectionViewLayoutAttributes]?
  
  var height: CGFloat? {
    get {
      return collectionView?.bounds.height
    }
  }
  
  var width: CGFloat? {
    get {
      return collectionView?.bounds.width
    }
  }
  
  var numberOfItems: Int? {
    get {
      return collectionView?.numberOfItems(inSection: 0)
    }
  }
  
  var featuredItem: Int? {
    get {
      guard let contentOffsetY = collectionView?.contentOffset.y else { return nil }
      return max(Int(contentOffsetY/dragOffset), 0)
    }
  }
  
  var nextItemPercentageOffset: CGFloat? {
    get {
      guard
        let contentOffsetY = collectionView?.contentOffset.y,
        let featuredItem = featuredItem
      else { return nil }
      return contentOffsetY/dragOffset - CGFloat(featuredItem)
    }
  }
  
  override var collectionViewContentSize: CGSize {
    get {
      guard
        let numberOfItems = numberOfItems,
        let height = height,
        let width = width
      else {
          return CGSize(width: 0.0, height: 0.0)
      }
      
      let contentHeight = CGFloat(numberOfItems - 1)*dragOffset + height
      return CGSize(width: width, height: contentHeight)
    }
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
  override func prepare() {
    guard
      let collectionView = collectionView,
      let width = width,
      let numberOfItems = numberOfItems,
      let featuredItem = featuredItem,
      let nextItemPercentageOffset = nextItemPercentageOffset
    else { return }
    
    if cachedLayoutAttribites != nil {
      cachedLayoutAttribites!.removeAll(keepingCapacity: false)
    } else {
      cachedLayoutAttribites = [UICollectionViewLayoutAttributes]()
    }
    
    var y: CGFloat = 0.0
    
    for item in 0..<numberOfItems {
      let indexPath = IndexPath(item: item, section: 0)
      let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
      
      var height: CGFloat = standardHeight
      
      if item == featuredItem {
        height = featuredHeight
        y = collectionView.contentOffset.y - nextItemPercentageOffset*standardHeight
      } else if item == (featuredItem + 1) && item != numberOfItems {
        height = standardHeight + max(nextItemPercentageOffset*(featuredHeight - standardHeight), 0.0)
        y = y + standardHeight - height
      }
      
      let frame = CGRect(x: 0, y: y, width: width, height: height)
      attribute.frame = frame
      attribute.zIndex = item
      cachedLayoutAttribites!.append(attribute)
      y = frame.maxY
    }
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let cachedLayoutAttributes = cachedLayoutAttribites else { return nil }
    
    var layoutAttributes = [UICollectionViewLayoutAttributes]()
    for cachedLayoutAttribute in cachedLayoutAttributes {
      if cachedLayoutAttribute.frame.intersects(rect) {
        layoutAttributes.append(cachedLayoutAttribute)
      }
    }
    
    return layoutAttributes
  }
  
  /* After release finger, snap to the nearest full featured cell*/
  override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
    let itemIndex = round(proposedContentOffset.y/dragOffset)
    let yOffset = itemIndex*dragOffset
    return CGPoint(x: 0, y: yOffset)
  }
}
