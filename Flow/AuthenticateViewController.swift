//
//  AuthenticateViewController.swift
//  Flow
//
//  Created by Andrew Copp on 2/25/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

class AuthenticateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        let loginButton = UIButton()
        loginButton.setTitle("Push", forState: .Normal)
        loginButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        loginButton.addTarget(self, action: "loginButtonPressed:", forControlEvents: .TouchUpInside)
        loginButton.sizeToFit()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        view.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = true
    }
    
    func loginButtonPressed(sender: UIButton) {
                
        let userViewController = UserViewController()
        self.navigationController?.pushViewController(userViewController, animated: false)
    }

}
