//
//  AutoresizingScrollView.swift
//  Flow
//
//  Created by Andrew Copp on 2/25/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

class AutoresizingScrollView: UIScrollView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentSize = CGSizeMake(contentSize.width, CGRectGetHeight(bounds))
    }

}
