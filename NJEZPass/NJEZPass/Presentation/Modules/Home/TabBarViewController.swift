
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
        
//        var arrayOfImageNameForSelectedState = ["tabHome","tabBalances","tabTransactions","tabMyAccount", "tabMore"]
        var arrayOfImageNameForSelectedState = ["tabHome","tabTransactions","tabMyAccount","tabNotifications", "tabMore"]
        var arrayOfImageNameForUnselectedState = ["tabSelectedHome","tabSelectedTransactions", "tabSelectedMyAccount","tabSelectedNotifications", "tabSelectedMore"]
        
        if let count = self.tabBar.items?.count {
            for i in 0...(count - 1) {
                
                let imageNameForSelectedState   = arrayOfImageNameForSelectedState[i]
                let imageNameForUnselectedState = arrayOfImageNameForUnselectedState[i]
                
                self.tabBar.items?[i].selectedImage = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysTemplate)
                self.tabBar.items?[i].image = UIImage(named: imageNameForUnselectedState)?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}
