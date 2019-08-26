//
//  LandingViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 05/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var payBillView: CMView!
    @IBOutlet weak var signUpView: CMView!
    
    
    override func viewDidLoad() {
        payBillView.configure(with: 2.0, borderColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1))
         signUpView.configure(with: 2.0, borderColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func payBillTapped(_ sender: Any) {
        
    }
    
    @IBAction func languageButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
