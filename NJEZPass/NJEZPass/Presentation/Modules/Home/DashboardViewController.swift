//
//  DashboardViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 17/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import SideMenu

class DashboardViewController: UIViewController {
   
    @IBOutlet weak var prepaidBalanceView: CMView!
    @IBOutlet weak var violationsBalanceView: CMView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepaidBalanceView.configure(with: 4.0, borderColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1))
        violationsBalanceView.configure(with: 4.0, borderColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1))
        
        let alert = UIAlertController(title: "", message: "Please update the mailing address linked to your account.", preferredStyle:.alert)
        let updateAddressActionButton = UIAlertAction(title: "Update", style: .default) { action in
            
            if let storyboard = self.storyboard {
                let vc = storyboard.instantiateViewController(withIdentifier: "UpdateAddressViewController") as! UpdateAddressViewController
                self.present(vc, animated: true, completion: nil)
            }
        }
        alert.addAction(updateAddressActionButton)
        self.present(alert, animated: true, completion: nil)
    }
}
