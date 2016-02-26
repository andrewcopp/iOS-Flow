//
//  AppDelegate.swift
//  Flow
//
//  Created by Andrew Copp on 2/25/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let authenticateViewController = AuthenticateViewController()
        let navigationController = UINavigationController(rootViewController: authenticateViewController)
        
        let window = UIWindow()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window

        UINavigationBar.appearance().barStyle = .Default
        UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
        navigationController.navigationBar.translucent = false
        
        return true
    }

}

