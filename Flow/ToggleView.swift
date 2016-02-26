//
//  ToggleView.swift
//  Flow
//
//  Created by Andrew Copp on 2/25/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

class ToggleView: UIView, SwipeControl {
    
    let segmentedControl: UISegmentedControl = UISegmentedControl(items: ["Feed", "Matches"])
    weak var delegate: SwipeControlDelegate?

    convenience init() {
        self.init(frame: CGRectMake(0.0, 0.0, 120.0, 28.0))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(segmentedControl)
        
        let views = ["segmentedControl" : segmentedControl]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[segmentedControl]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[segmentedControl]|", options: [], metrics: nil, views: views))
        
        segmentedControl.addTarget(self, action: "segmentedControlValueChanged:", forControlEvents: .ValueChanged)
        
        sizeToFit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setIndexState(index: CGFloat) {
        if index < 0.5 {
            segmentedControl.selectedSegmentIndex = 0
        } else {
            segmentedControl.selectedSegmentIndex = 1
        }
    }
    
    func setSelectedIndex(index: Int) {
        segmentedControl.selectedSegmentIndex = index
    }
    
    func segmentedControlValueChanged(sender: UISegmentedControl) {
        delegate?.swipeControl(self, didSelectIndex: segmentedControl.selectedSegmentIndex)
    }
    
}
