//
//  LoginVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 07/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
