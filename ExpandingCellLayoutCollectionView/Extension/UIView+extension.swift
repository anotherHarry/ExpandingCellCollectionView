//
//  UIView+extension.swift
//  ExpandingCellLayoutCollectionView
//
//  Created by Harry Cao on 30/8/17.
//  Copyright © 2017 Harry Cao. All rights reserved.
//

import UIKit

extension UIView {
  
  @discardableResult func constraintAnchorTo(leading: NSLayoutXAxisAnchor?, leadingConstant: CGFloat?, trailing: NSLayoutXAxisAnchor?, trailingConstant: CGFloat?, top: NSLayoutYAxisAnchor?, topConstant: CGFloat?, bottom: NSLayoutYAxisAnchor?, bottomConstant: CGFloat?, left: NSLayoutXAxisAnchor?, leftConstant: CGFloat?, right: NSLayoutXAxisAnchor?, rightConstant: CGFloat?) -> [NSLayoutConstraint] {
    
    self.translatesAutoresizingMaskIntoConstraints = false
    
    var constraints = [NSLayoutConstraint]()
    
    if let leading = leading {
      constraints.append(self.leadingAnchor.constraint(equalTo: leading, constant: leadingConstant ?? 0))
    }
    
    if let trailing = trailing {
      constraints.append(self.trailingAnchor.constraint(equalTo: trailing, constant: trailingConstant ?? 0))
    }
    
    if let top = top {
      constraints.append(self.topAnchor.constraint(equalTo: top, constant: topConstant ?? 0))
    }
    
    if let bottom = bottom {
      constraints.append(self.bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant ?? 0))
    }
    
    if let left = left {
      constraints.append(self.leftAnchor.constraint(equalTo: left, constant: leftConstant ?? 0))
    }
    
    if let right = right {
      constraints.append(self.rightAnchor.constraint(equalTo: right, constant: rightConstant ?? 0))
    }
    
    constraints.forEach{ $0.isActive = true }
    
    return constraints
  }
  
  @discardableResult func constraintSizeToConstant(widthConstant: CGFloat?, heightConstant: CGFloat?) -> [NSLayoutConstraint] {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    var constraints = [NSLayoutConstraint]()
    
    if let widthConstant = widthConstant {
      constraints.append(self.widthAnchor.constraint(equalToConstant: widthConstant))
    }
    
    if let heightConstant = heightConstant {
      constraints.append(self.heightAnchor.constraint(equalToConstant: heightConstant))
    }
    
    constraints.forEach{ $0.isActive = true }
    
    return constraints
  }
  
  @discardableResult func constraintSizeToMultipler(widthAnchor: NSLayoutDimension?, widthMultiplier: CGFloat?, heightAnchor: NSLayoutDimension?, heightMultiplier: CGFloat?) -> [NSLayoutConstraint] {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    var constraints = [NSLayoutConstraint]()
    
    if let widthAnchor = widthAnchor {
      constraints.append(self.widthAnchor.constraint(equalTo: widthAnchor, multiplier: widthMultiplier ?? 1))
    }
    
    if let heightAnchor = heightAnchor {
      constraints.append(self.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier ?? 1))
    }
    
    constraints.forEach{ $0.isActive = true }
    
    return constraints
  }
  
  @discardableResult func constraintCenterTo(centerX: NSLayoutAnchor<NSLayoutXAxisAnchor>?, xConstant: CGFloat?, centerY: NSLayoutAnchor<NSLayoutYAxisAnchor>?, yConstant: CGFloat?) -> [NSLayoutConstraint] {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    var constraints = [NSLayoutConstraint]()
    
    if let centerX = centerX {
      constraints.append(self.centerXAnchor.constraint(equalTo: centerX, constant: xConstant ?? 0))
    }
    
    if let centerY = centerY {
      constraints.append(self.centerYAnchor.constraint(equalTo: centerY, constant: yConstant ?? 0))
    }
    
    constraints.forEach{ $0.isActive = true }
    
    return constraints
  }
}
