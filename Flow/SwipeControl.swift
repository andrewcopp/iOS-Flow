//
//  SwipeControl.swift
//  Flow
//
//  Created by Andrew Copp on 2/25/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

protocol SwipeControl {
    weak var delegate: SwipeControlDelegate? { get set }
    
    func setIndexState(index: CGFloat)
}

protocol SwipeControlDelegate: class {
    func swipeControl(swipeControl: SwipeControl, didSelectIndex index: Int)
}