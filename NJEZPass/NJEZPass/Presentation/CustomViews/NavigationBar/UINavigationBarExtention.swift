//
//  UINavigationBarExtention.swift
//  NJEZPass
//
//  Created by Alam, Sk on 03/10/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func navBarWith(title:String?=nil, backAction:backButtonAction? = nil){
        self.navBarWith(title: title, backAction: backAction, rightButtonImage: nil, rightButtonAction: nil)
    }
    func navBarWith( backAction:backButtonAction? = nil , rightButtonImage:UIImage? = nil, rightButtonAction:backButtonAction? = nil){
        self.navBarWith(title: nil, backAction: backAction, rightButtonImage: rightButtonImage, rightButtonAction: rightButtonAction)
    }
    
    
    
  private  func navBarWith(title:String?=nil, backAction:backButtonAction? = nil , rightButtonImage:UIImage? = nil, rightButtonAction:backButtonAction? = nil){
        
        
       let navView =  self.initiateEZYPassNavBar()
        
        navView.navBarWith(title: title, backAction: backAction, rightButtonImage: rightButtonImage, rightButtonAction: rightButtonAction)
    
    }
    func initiateEZYPassNavBar() ->  EZYPassNavView {
        
//        self.setGradientBackground(colors: [
//            UIColor(red: 105/255, green: 32/255, blue: 126/255, alpha: 1.0).cgColor,
//            UIColor(red: 19/255, green: 140/255, blue: 145/255, alpha: 1.0).cgColor
//            ])
        self.tintColor = .white
        
        
        if let existingNavView = self.viewWithTag(6687) {
            existingNavView.removeFromSuperview()
        }
        let navBarView: EZYPassNavView = EZYPassNavView.fromNib()
        navBarView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        navBarView.tag = 6687
        self.addSubview(navBarView)
        return navBarView
        
    }
    
    func removeCurrentNavView() {
        if let existingNavView = self.viewWithTag(6687) {
            existingNavView.removeFromSuperview()
        }
    }
    
    
}

extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)![0] as! T
    }
}

extension UIViewController {
    
    func showNavBarWith(title:String?=nil, backAction:backButtonAction? = nil){
        self.navigationController?.navigationBar.navBarWith(title: title, backAction: {
            // back
            self.navigationController?.navigationBar.removeCurrentNavView()
            if let backButtonClicked = backAction {
                backButtonClicked()
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        })
        
        
    }
    func showNavBarWith( backAction:backButtonAction? = nil , rightButtonImage:UIImage? = nil, rightButtonAction:backButtonAction? = nil){
        self.navigationController?.navigationBar.navBarWith(backAction: {
            // back
            self.navigationController?.navigationBar.removeCurrentNavView()
            if let backButtonClicked = backAction {
                backButtonClicked()
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        }, rightButtonImage: rightButtonImage, rightButtonAction: rightButtonAction)
    }
    
   
    
}
