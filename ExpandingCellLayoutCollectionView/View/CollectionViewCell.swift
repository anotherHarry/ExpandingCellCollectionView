//
//  CollectionViewCell.swift
//  ExpandingCellLayoutCollectionView
//
//  Created by Harry Cao on 30/8/17.
//  Copyright © 2017 Harry Cao. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  
  var girl: Girl? {
    didSet {
      imageView.image = girl?.image
      nameLabel.text = girl?.name
      quoteLabel.text = girl?.quote
    }
  }
  
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  let overlayView: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    view.alpha = 0.3
    return view
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "AvenirNext-DemiBold", size: 44)
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()
  
  let quoteLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "AvenirNext-Medium", size: 17)
    label.textColor = .white
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.isOpaque = true
    self.clipsToBounds = true
    
    setupCell()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupCell() {
    self.addSubview(imageView)
    self.addSubview(overlayView)
    self.addSubview(nameLabel)
    self.addSubview(quoteLabel)
    
    imageView.constraintAnchorTo(leading: self.leadingAnchor, leadingConstant: 0, trailing: self.trailingAnchor, trailingConstant: 0, top: nil, topConstant: nil, bottom: nil, bottomConstant: nil, left: nil, leftConstant: nil, right: nil, rightConstant: nil)
    imageView.constraintSizeToConstant(widthConstant: nil, heightConstant: ExpandingCellLayout.ECLConstants.featuredHeight)
    imageView.constraintCenterTo(centerX: nil, xConstant: nil, centerY: self.centerYAnchor, yConstant: nil)
    
    overlayView.constraintAnchorTo(leading: self.leadingAnchor, leadingConstant: 0, trailing: self.trailingAnchor, trailingConstant: 0, top: self.topAnchor, topConstant: 0, bottom: self.bottomAnchor, bottomConstant: 0, left: nil, leftConstant: nil, right: nil, rightConstant: nil)
    
    nameLabel.constraintAnchorTo(leading: self.leadingAnchor, leadingConstant: 0, trailing: self.trailingAnchor, trailingConstant: 0, top: nil, topConstant: nil, bottom: nil, bottomConstant: nil, left: nil, leftConstant: nil, right: nil, rightConstant: nil)
    nameLabel.constraintSizeToConstant(widthConstant: nil, heightConstant: 44)
    nameLabel.constraintCenterTo(centerX: nil, xConstant: nil, centerY: self.centerYAnchor, yConstant: 0)
    
    quoteLabel.constraintAnchorTo(leading: self.leadingAnchor, leadingConstant: 25, trailing: self.trailingAnchor, trailingConstant: -25, top: nameLabel.bottomAnchor, topConstant: 5, bottom: nil, bottomConstant: nil, left: nil, leftConstant: nil, right: nil, rightConstant: nil)
    quoteLabel.constraintSizeToConstant(widthConstant: nil, heightConstant: 30)
  }
  
  override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
    super.apply(layoutAttributes)
    
    let standardHeight = ExpandingCellLayout.ECLConstants.standardHeight
    let featuredHeight = ExpandingCellLayout.ECLConstants.featuredHeight
    
    let minAlpha: CGFloat = 0.3
    let maxAlpha: CGFloat = 0.7
    
    let delta = (self.frame.height - standardHeight)/(featuredHeight - standardHeight)
    
    overlayView.alpha = maxAlpha - delta*(maxAlpha - minAlpha)
    
    let scale = max(delta, 0.5)
    nameLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
    quoteLabel.alpha = delta
  }
}
