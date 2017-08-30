//
//  Girl.swift
//  ExpandingCellLayoutCollectionView
//
//  Created by Harry Cao on 30/8/17.
//  Copyright © 2017 Harry Cao. All rights reserved.
//

import UIKit

class Girl {
  let name: String
  let quote: String
  let image: UIImage
  
  init(with dictionary: [String: Any]) {
    self.name = dictionary["name"] as! String
    self.quote = dictionary["quote"] as! String
    self.image = dictionary["image"] as! UIImage
  }
}
