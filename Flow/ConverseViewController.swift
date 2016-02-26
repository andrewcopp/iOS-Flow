//
//  ConverseViewController.swift
//  Flow
//
//  Created by Andrew Copp on 2/25/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

class ConverseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellowColor()
        
        navigationItem.hidesBackButton = true
        
        let image = UIImage(named: "backButton")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .Plain, target: self, action: "leftBarButtonItemPressed:")
        navigationItem.leftBarButtonItem?.tintColor = UIColor.blackColor()
    }

    func leftBarButtonItemPressed(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}
