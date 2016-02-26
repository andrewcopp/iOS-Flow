//
//  UserViewController.swift
//  Flow
//
//  Created by Andrew Copp on 2/25/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let flowLayout = UICollectionViewFlowLayout()
        let firstController = ListViewController(collectionViewLayout: flowLayout)
        let secondController = ListViewController(collectionViewLayout: flowLayout)
        
        let swipeController = SwipeController()
        swipeController.viewControllers = [firstController, secondController]
        
        addChildViewController(swipeController)
        
        let subview = swipeController.view
        subview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subview)
        
        let views = ["subview" : subview]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[subview]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[subview]|", options: [], metrics: nil, views: views))
        
        swipeController.didMoveToParentViewController(self)
        
        let swipeControl = ToggleView()
        navigationItem.titleView = swipeControl
        swipeController.swipeControl = swipeControl
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        navigationController?.navigationBarHidden = false
        navigationItem.hidesBackButton = true
        
        edgesForExtendedLayout = UIRectEdge.None
        extendedLayoutIncludesOpaqueBars = false
    }

}
