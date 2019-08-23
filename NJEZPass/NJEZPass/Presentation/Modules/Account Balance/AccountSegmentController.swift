//
//  AccountSegmentController.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 23/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class AccountSegmentController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Account Balance"
        
        if let storyboard = self.storyboard {
            let accountPrepaidVC = storyboard
                .instantiateViewController(withIdentifier: "AccountPrepaidVC")
            accountPrepaidVC.title = "Prepaid"
            
            let accountViolationVC = storyboard
                .instantiateViewController(withIdentifier: "AccountViolationVC")
            accountViolationVC.title = "Violation"
            
            let segmentedViewController = SJSegmentedViewController(headerViewController: nil,
                                                                    segmentControllers: [
                                                                        accountPrepaidVC,
                                                                        accountViolationVC])
            addChild(segmentedViewController)
            self.view.addSubview(segmentedViewController.view)
            segmentedViewController.view.frame = self.view.bounds
            segmentedViewController.didMove(toParent: self)
        }
    }
    
}

