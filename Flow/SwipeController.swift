//
//  SwipeController.swift
//  Flow
//
//  Created by Andrew Copp on 2/25/16.
//  Copyright © 2016 Andrew Copp. All rights reserved.
//

import UIKit

class SwipeController: UIViewController, UIScrollViewDelegate, SwipeControlDelegate {
    
    private var _scrollView: UIScrollView!
    var viewControllers: [UIViewController]? {
        didSet {
            if let _ = _scrollView {
                configureChildViewControllers(viewControllers)
            }
        }
    }
    
    var swipeControl: SwipeControl? {
        didSet {
            swipeControl?.delegate = self
            
            let swipeState = calculateSwipeState()
            swipeControl?.setIndexState(swipeState)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _scrollView = AutoresizingScrollView()
        _scrollView.delegate = self
        
        _scrollView.pagingEnabled = true
        _scrollView.showsHorizontalScrollIndicator = false
        _scrollView.showsVerticalScrollIndicator = false
        _scrollView.bounces = false
        
        _scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(_scrollView)
        
        let views = ["scrollView" : _scrollView]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: [], metrics: nil, views: views))
        
        configureChildViewControllers(viewControllers)        
    }
    
    func configureChildViewControllers(viewControllers: [UIViewController]?) {
        if let viewControllers = self.viewControllers {
            viewControllers.forEach() { viewController in
                viewController.willMoveToParentViewController(nil)
                viewController.view.removeFromSuperview()
                viewController.didMoveToParentViewController(nil)
            }
        }
        if let viewControllers = viewControllers {
            _scrollView.contentSize = CGSizeMake(CGRectGetWidth(view.bounds) * CGFloat(viewControllers.count), CGRectGetHeight(view.bounds))
                        
            viewControllers.forEach() { viewController in
                viewController.willMoveToParentViewController(self)
                addChildViewController(viewController)
                let index = viewControllers.indexOf(viewController)
                let subview = viewController.view
                
                if let index = index {
                    var frame = view.bounds
                    frame.origin.x = CGRectGetWidth(frame) * CGFloat(index)
                    subview.frame = frame
                }
                
                _scrollView.addSubview(subview)
                
                viewController.didMoveToParentViewController(self)
            }
            
        } else {
            _scrollView.contentSize = view.bounds.size
        }
    }
    
    private func calculateSwipeState() -> CGFloat {
        return _scrollView.contentOffset.x / (_scrollView.contentSize.width / CGFloat(viewControllers!.count))
    }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let swipeState = calculateSwipeState()
        swipeControl?.setIndexState(swipeState)
    }
    
    // MARK: SwipeControlDelegate
    
    func swipeControl(swipeControl: SwipeControl, didSelectIndex index: Int) {
        let bounds = _scrollView.bounds
        let rect = CGRectMake(CGRectGetWidth(bounds) * CGFloat(index), 0.0, CGRectGetWidth(bounds), CGRectGetHeight(bounds))
        _scrollView.scrollRectToVisible(rect, animated: true)
    }
    
}
