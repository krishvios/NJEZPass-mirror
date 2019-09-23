//
//  SignupAndSaveVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class SignupAndSaveVC: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var confirmationDesc: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var confirmationImage: UIImageView!
    @IBOutlet weak var confirmationTitle: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    
    var flowString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if flowString == "disputeFlow" {
            button.setTitle("OK", for: .normal)
            confirmationDesc.text = "Your request has been submitted and will be processed as soon as possible."
            confirmationTitle.text = "Request Submitted"
            confirmationImage.image = #imageLiteral(resourceName: "confirmCheck")
            skipButton.isHidden = true
            backButton.isHidden = true
        } else {
            button.setTitle("SIGN UP", for: .normal)
            confirmationDesc.text = "Sign up with E-ZPass today, and save 20% on your bill."
            confirmationTitle.text = "Sign Up & Save!"
            confirmationImage.image = #imageLiteral(resourceName: "Signup")
            skipButton.isHidden = false
            backButton.isHidden = false
        }

    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
