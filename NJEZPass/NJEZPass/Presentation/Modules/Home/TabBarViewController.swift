
//
//  TabBarViewController.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 27/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var arrayOfImageNameForSelectedState = ["tabHome","tabBalances","tabTransactions","tabMyAccount", "tabMore"]
        var arrayOfImageNameForUnselectedState = ["tabSelectedHome", "tabSelectedBalances","tabSelectedTransactions", "tabSelectedMyAccount", "tabSelectedMore"]
        
        if let count = self.tabBar.items?.count {
            for i in 0...(count - 1) {
                
                let imageNameForSelectedState   = arrayOfImageNameForSelectedState[i]
                let imageNameForUnselectedState = arrayOfImageNameForUnselectedState[i]
                
                self.tabBar.items?[i].selectedImage = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysTemplate)
                self.tabBar.items?[i].image = UIImage(named: imageNameForUnselectedState)?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
}
