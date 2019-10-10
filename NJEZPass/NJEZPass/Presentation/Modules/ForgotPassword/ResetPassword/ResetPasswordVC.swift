//
//  ResetPasswordVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS
import Entities
import MBProgressHUD
import Platform

protocol IResetPasswordViewable {
    func sendEmailLinkSuccess(viewModel: ResetPasswordModel.PresentionModel)
    func sendEmailLinkFailed(viewModel: ResetPasswordModel.PresentionModel)
}

class ResetPasswordVC: UIViewController {
    
    @IBOutlet weak var resetPasswordLbl: UILabel!
    @IBOutlet weak var resetPasswordText: UILabel!
    @IBOutlet weak var continueButtonText: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var emailOption: UIImageView!
    @IBOutlet weak var answerOption: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    var selectedOption: Bool?
    
    var interactor: IResetPasswordInteractable?
          var router: IRouter?
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let configurator = ResetPasswordConfigurator()
        configurator.build(viewController: self)
        interactor = configurator.interactor
        router = configurator.router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButtonText.isEnabled = false
        toggleLoginButtonColor()
        
        if let response = CMUtility.forgotPasswordRes {
            
            let email = response.emailMessage
            if email == "Y" {
                self.handleEmailProtection(with: response.emailId!)
            }

        }
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
                continueButtonText.isEnabled = false
                toggleLoginButtonColor()
                answerOption.image = #imageLiteral(resourceName: "selectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
                
            } else {
                continueButtonText.isEnabled = true
                toggleLoginButtonColor()
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
                continueButtonText.isEnabled = false
                toggleLoginButtonColor()
                answerOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "selectedRadioButton")
            } else {
                continueButtonText.isEnabled = true
                toggleLoginButtonColor()
                answerOption.image = #imageLiteral(resourceName: "selectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
            }
        }
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        
        if selectedOption == false {
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            let username = CMUtility.userName
            let accountNO = CMUtility.accountNumber
            let zipcode = CMUtility.zipCode
                              
            let request = ResetPasswordModel.Request(action: APIConstants.ServiceNames.forgotPassword, userName: username!, accountNumber: accountNO!, zipCode: zipcode!, securityQuestion: "", securityAnswer: "", newPassword: "", retypePassword: "", emailFlag: "Y")
                interactor?.sendEmailLinkToResetPassword(request:request, requestType: .remote)
            
        }
        else {
            self.performSegue(withIdentifier: "showSecurityQuestions", sender: nil)
        }
//        if let option = selectedOption {
//            self.performSegue(withIdentifier: option ? "showSecurityQuestions" : "showEmailConfirmation", sender: nil)
//        }
    }
    
    func toggleLoginButtonColor() {
        if continueButtonText.isEnabled {
            continueButtonText.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            continueButtonText.backgroundColor = #colorLiteral(red: 0.4489307404, green: 0.09403731674, blue: 0.5118483901, alpha: 0.5)
        }
    }
    
}

extension ResetPasswordVC: IResetPasswordViewable {
    
    func sendEmailLinkSuccess(viewModel: ResetPasswordModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        self.performSegue(withIdentifier:"showEmailConfirmation", sender: nil)
    }
    
    func sendEmailLinkFailed(viewModel: ResetPasswordModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension ResetPasswordVC: IRoutable {
    func showMessage(message: String) {
        DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: message), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: message)
    }
    
    func popCurrent() {
        // dismiss current viewcontroller like back action
    }
}
