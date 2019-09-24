//
//  DashboardViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 17/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
   
    @IBOutlet weak var prepaidBalanceView: CMView!
    @IBOutlet weak var violationsBalanceView: CMView!
    
    var nixieFlag = true
    var firstTimeUser = true
    
    private lazy var updateAddressAlert:UIAlertController! = {
        let alert = UIAlertController(title: "Update Address", message: "Please update the mailing address linked to your account.", preferredStyle:.alert)
        return alert
    }()
    
    private lazy var updateAddressActionButton:UIAlertAction! = {
        
        let actionButtonn = UIAlertAction(title: "Update", style: .default) { action in
            
            if let storyboard = self.storyboard {
                let vc = storyboard.instantiateViewController(withIdentifier: "UpdateAddressViewController") as! UpdateAddressViewController
                self.present(vc, animated: true, completion: nil)
            }
        }
        return actionButtonn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepaidBalanceView.configure(with: 4.0, borderColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1))
        violationsBalanceView.configure(with: 4.0, borderColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1))
        
        if firstTimeUser == true {
            if let storyboard = self.storyboard {
                let vc = storyboard.instantiateViewController(withIdentifier: "QuestionsViewController") as! QuestionsViewController
                self.present(vc, animated: true, completion: nil)
            }
            
            firstTimeUser = false
        }        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if firstTimeUser == false {
            if nixieFlag == true {
                updateAddressAlert.addAction(updateAddressActionButton)
                self.present(updateAddressAlert, animated: true, completion: nil)
                nixieFlag = false
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if firstTimeUser == false {
            if nixieFlag == true {
                updateAddressAlert.addAction(updateAddressActionButton)
                self.present(updateAddressAlert, animated: true, completion: nil)
                nixieFlag = false
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}


