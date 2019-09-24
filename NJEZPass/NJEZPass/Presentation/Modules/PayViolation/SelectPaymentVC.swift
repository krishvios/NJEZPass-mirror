//
//  SelectPaymentVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class SelectPaymentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        if let payViolationVC = navigationController!.viewControllers.filter({ $0 is PayViolationVC }).first {
            navigationController?.popToViewController(payViolationVC, animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
