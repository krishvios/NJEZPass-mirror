//
//  EZYPassNavView.swift
//  NJEZPass
//
//  Created by Alam, Sk on 03/10/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
typealias backButtonAction = (()->Void)

class EZYPassNavView: UIView {

    
    @IBOutlet weak var leftBarButton: UIButton!
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var rightBarButton: UIButton!
    @IBOutlet weak var navBarImageView: UIImageView!
    
    var backClickedAction:backButtonAction?
    var rightBottonClickedAction:backButtonAction?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func leftBarButtonClicked(_ sender: UIButton) {
        if let backClicked = backClickedAction {
            backClicked()
        }
    }
    
    @IBAction func rightBarButtonClicked(_ sender: Any) {
        
        if let rightBottonClicked = rightBottonClickedAction{
           rightBottonClicked()
        }
    }
    
    
    func navBarWith(title:String?=nil, backAction:backButtonAction? = nil , rightButtonImage:UIImage? = nil, rightButtonAction:backButtonAction? = nil){
        
        if title == nil{
            // Show nav bar Image and hide title
            self.navBarImageView.isHidden = false
            self.navTitle.isHidden = true
        }
        else{
            // show title and hide image
            self.navBarImageView.isHidden = true
            self.navTitle.isHidden = false
            self.navTitle.text = title
        }
        if let backClicked = backAction{
            self.backClickedAction = backClicked
        }
        
        if let rightButtonIcon = rightButtonImage {
            rightBarButton.setImage(rightButtonIcon, for: .normal)
        }
        
        if let rightBottonClicked = rightButtonAction{
            self.rightBottonClickedAction = rightBottonClicked
        }
        
    }
}
