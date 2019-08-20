//
//  UIViewController+Extension.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 20/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit


extension UIViewController {
  
    func restoreInitialStateWith(backButtonHidden: Bool, navBarHidden: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = convertToOptionalNSAttributedStringKeyDictionary([NSAttributedString.Key.foregroundColor.rawValue: UIColor.black])
        self.navigationItem.titleView = nil
        self.navigationItem.rightBarButtonItems?.removeAll()
        self.navigationItem.leftBarButtonItems?.removeAll()
        
        self.tabBarController?.title = ""
        self.tabBarController?.navigationItem.titleView = nil
        self.tabBarController?.navigationController?.navigationBar.titleTextAttributes = convertToOptionalNSAttributedStringKeyDictionary([NSAttributedString.Key.foregroundColor.rawValue: UIColor.white])
        self.tabBarController?.navigationItem.rightBarButtonItems?.removeAll()
        self.tabBarController?.navigationItem.leftBarButtonItems?.removeAll()
        
        self.navigationController?.setNavigationBarHidden(navBarHidden, animated: true)
        self.navigationItem.setHidesBackButton(backButtonHidden, animated:false)
        
        self.tabBarController?.navigationController?.setNavigationBarHidden(navBarHidden, animated: true)
        self.tabBarController?.navigationItem.setHidesBackButton(backButtonHidden, animated:false)
        
        // magic to remove the tiny bottom line of the navigation bar..
        if let navigationController = navigationController {
            for parent in navigationController.view.subviews {
                for child in parent.subviews {
                    for view in child.subviews {
                        if view is UIImageView && view.frame.height == 0.5 {
                            view.alpha = 0
                        }
                    }
                }
            }
        }
    }
}

fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
