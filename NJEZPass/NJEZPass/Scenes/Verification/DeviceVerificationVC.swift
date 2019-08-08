//
//  DeviceVerificationVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 07/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class DeviceVerificationVC: UIViewController {

    @IBOutlet weak var emailOption: UIImageView!
    @IBOutlet weak var mobileOption: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.addNavBarImage()
       // self.navigationController?.navigationBar.addBackButton()
    }
    @IBAction func emailTapped(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                // set deselected
               // button.isSelected = false
                emailOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
            } else {
                // set selected
               // button.isSelected = true
                emailOption.image = #imageLiteral(resourceName: "selectedRadioButton") 
            }
        }
    }
    
    @IBAction func mobileTapped(_ sender: Any) {
        
    }
    
}
