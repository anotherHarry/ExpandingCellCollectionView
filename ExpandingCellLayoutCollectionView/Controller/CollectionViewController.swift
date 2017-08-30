//
//  CollectionViewController.swift
//  ExpandingCellLayoutCollectionView
//
//  Created by Harry Cao on 30/8/17.
//  Copyright © 2017 Harry Cao. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
  
  struct CVCConstants {
    static let cellIdentifier = "cellIdentifier"
    static let footerCellIdentifier = "footerCellIdentifier"
  }
  
  var girls = GirlManager.shared.getGirls()
  
  var isFetchingData = false
  
  // For pull to refresh
  lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(handleRefresh), for: UIControlEvents.valueChanged)
    
    return refreshControl
  }()
  
//  lazy var spinner: UIActivityIndicatorView = { [unowned self] in
//    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//    spinner.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
//    spinner.startAnimating()
//    return spinner
//  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    
    setupCollectionView()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  /* Handle pull to refresh */
  @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
    DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2.0) { [unowned self] in
      self.girls = GirlManager.shared.getGirls()

      DispatchQueue.main.async {
        self.collectionView?.reloadData()
        self.refreshControl.endRefreshing()
      }
    }
  }
}

