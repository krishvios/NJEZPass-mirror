//
//  SignupAndSaveVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

enum FlowKeys: String {
    case disputeFlow
    case payNowFlow
    case forgotUsernameFlow
    case balanceIncreaseFlow
    case requestLostFlow
    case requestStolenFlow
    case requestTag
}

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
        
        switch flowString {
        case FlowKeys.disputeFlow.rawValue:
            button.setTitle("OK", for: .normal)
            confirmationDesc.text = "Your request has been submitted and will be processed as soon as possible."
            confirmationTitle.text = "Request Submitted"
            confirmationImage.image = #imageLiteral(resourceName: "confirmCheck")
            skipButton.isHidden = true
            backButton.isHidden = true
        case FlowKeys.payNowFlow.rawValue:
            button.setTitle("OK", for: .normal)
            confirmationDesc.text = "We’ve successfully processed your payment. If you entered an email, we will email you a confirmation."
            confirmationTitle.text = "Payment Successful"
            confirmationImage.image = #imageLiteral(resourceName: "confirmCheck")
            skipButton.isHidden = true
            backButton.isHidden = true
        case FlowKeys.forgotUsernameFlow.rawValue:
            button.setTitle("OK", for: .normal)
            confirmationDesc.text = "We’ve sent your username to the email address on file."
            confirmationTitle.text = "Username Sent"
            confirmationImage.image = #imageLiteral(resourceName: "confirmCheck")
            skipButton.isHidden = true
            backButton.isHidden = true
        case FlowKeys.balanceIncreaseFlow.rawValue:
            button.setTitle("OK", for: .normal)
            confirmationDesc.text = "We’ve successfully processed your payment. Confirmation details have been sent to the email on file."
            confirmationTitle.text = "Payment Successful"
            confirmationImage.image = #imageLiteral(resourceName: "confirmCheck")
            skipButton.isHidden = true
            backButton.isHidden = true
        case FlowKeys.requestLostFlow.rawValue:
            button.setTitle("OK", for: .normal)
            confirmationDesc.text = "Your tag has been reported as Lost."
            confirmationTitle.text = "Lost Tag"
            confirmationImage.image = #imageLiteral(resourceName: "confirmCheck")
            skipButton.isHidden = true
            backButton.isHidden = true
        case FlowKeys.requestStolenFlow.rawValue:
            button.setTitle("OK", for: .normal)
            confirmationDesc.text = "Your tag has been reported as stolen."
            confirmationTitle.text = "Stolen Tag"
            confirmationImage.image = #imageLiteral(resourceName: "confirmCheck")
            skipButton.isHidden = true
            backButton.isHidden = true
        case FlowKeys.requestTag.rawValue:
            button.setTitle("OK", for: .normal)
            confirmationDesc.text = "Your request has been submitted and will be processed as soon as possible."
            confirmationTitle.text = "Request Submitted"
            confirmationImage.image = #imageLiteral(resourceName: "confirmCheck")
            skipButton.isHidden = true
            backButton.isHidden = true
        default:
            button.setTitle("SIGN UP", for: .normal)
            confirmationDesc.text = "Sign up with E-ZPass today, and save 20% on your bill."
            confirmationTitle.text = "Sign Up & Save!"
            confirmationImage.image = #imageLiteral(resourceName: "Signup")
            skipButton.isHidden = false
            backButton.isHidden = false
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        switch flowString {
        case FlowKeys.forgotUsernameFlow.rawValue:
            self.navigationController?.navigationBar.isHidden = true
        case FlowKeys.payNowFlow.rawValue:
            self.navigationController?.navigationBar.isHidden = true
        default:
             self.navigationController?.navigationBar.isHidden = false
        }
    }
    @IBAction func signUpTapped(_ sender: Any) {
        
        switch flowString {
        case FlowKeys.disputeFlow.rawValue: 
            self.performSegue(withIdentifier: "showSelectPayment", sender: nil)
        case FlowKeys.payNowFlow.rawValue:
            let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
            let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(loginVC, animated: true)
        case FlowKeys.forgotUsernameFlow.rawValue:
            let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
            let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(loginVC, animated: true)
        case FlowKeys.requestLostFlow.rawValue,FlowKeys.requestStolenFlow.rawValue,FlowKeys.requestTag.rawValue:
//            let storyBoard = UIStoryboard(name: "MyAccount", bundle: nil)
//            let myAccount = storyBoard.instantiateViewController(withIdentifier: "TagsViewController") as! TagsViewController
//            self.navigationController?.pushViewController(myAccount, animated: false)
            
            if let disputeVC = navigationController!.viewControllers.filter({ $0 is TagsViewController }).first {
                navigationController?.popToViewController(disputeVC, animated: false)
            } else {
                navigationController?.popViewController(animated: true)
            }
        case FlowKeys.balanceIncreaseFlow.rawValue:
            navigationController?.viewControllers.removeAll(where :{
                (vc) -> Bool in if  vc.isKind(of: PayNowVC.self) || vc.isKind(of: PaymentAmountVC.self){
                    return true
                }
                return false
            })
            self.navigationController?.popViewController(animated: true)
        default:
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
    
    @IBAction func backButtonTapped(_ sender: Any) {
        if let disputeVC = navigationController!.viewControllers.filter({ $0 is DisputedSelectedVC }).first {
            navigationController?.popToViewController(disputeVC, animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
