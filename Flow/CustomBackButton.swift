//
//  CustomBackButton.swift
//  Flow
//
//  Created by Andrew Copp on 2/26/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func configureCustomBackButton() {
        navigationItem.hidesBackButton = true
        
        let backButtonImage = UIImage(named: "backButton")
        let customBackBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .Plain, target: self, action: "customBackBarButtonItemPressed:")
        navigationItem.leftBarButtonItem = customBackBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.blackColor()
    }
    
    func customBackBarButtonItemPressed(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}