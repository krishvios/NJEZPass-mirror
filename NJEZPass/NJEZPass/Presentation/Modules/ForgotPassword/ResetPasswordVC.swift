//
//  ResetPasswordVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class ResetPasswordVC: UIViewController {
    
    @IBOutlet weak var resetPasswordLbl: UILabel!
    @IBOutlet weak var resetPasswordText: UILabel!
    @IBOutlet weak var continueButtonText: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var emailOption: UIImageView!
    @IBOutlet weak var answerOption: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    var selectedOption: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButtonText.isEnabled = false
        toggleLoginButtonColor()
    }
   
    func handleEmailProtection(with email: String) {
        var emailName = email.split(separator: "@")
        var protectedEmail = ""
        for (index, letter) in emailName[0].enumerated() {
            if index == 0 || index == emailName[0].count - 1 {
                protectedEmail.append(letter)
            } else {
                protectedEmail.append("*")
            }
        }
        emailLabel.text = "Email \(protectedEmail + "@" + emailName[1])"
    }
    
    @IBAction func emailTapped(_ sender: Any) {
        
        selectedOption = false
         continueButtonText.isEnabled = true
        if let button = sender as? UIButton {
            if button.isSelected {
                // set deselected
                answerOption.image = #imageLiteral(resourceName: "selectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
                
            } else {
                answerOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "selectedRadioButton")
            }
        }
    }
    
    @IBAction func answerTapped(_ sender: Any) {
        
        selectedOption = true
        continueButtonText.isEnabled = true
        if let button = sender as? UIButton {
            if button.isSelected {
                answerOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "selectedRadioButton")
            } else {
                answerOption.image = #imageLiteral(resourceName: "selectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
            }
        }
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        if let option = selectedOption {
            self.performSegue(withIdentifier: option ? "showSecurityQuestions" : "showEmailConfirmation", sender: nil)
        }
    }
    
    func toggleLoginButtonColor() {
        if continueButtonText.isEnabled {
            continueButtonText.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            continueButtonText.backgroundColor = #colorLiteral(red: 0.4489307404, green: 0.09403731674, blue: 0.5118483901, alpha: 0.5)
        }
    }
    
}
