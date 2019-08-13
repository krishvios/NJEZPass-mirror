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
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.addNavBarImage()
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
              let personalInfo = delegate.detailInfo?.personalInformation,
              let email = personalInfo.emailAddress,
              let mobile = personalInfo.cellPhone else {
                handleEmailProtection(with: "narasimhulu@conduent.com")
                handleMobileNumberProtection(with: "(000)345-4562")
            return
        }
        
        handleEmailProtection(with: email)
        handleMobileNumberProtection(with: mobile)
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
        print("emailName", (protectedEmail + "@" + emailName[1]))
        emailLabel.text = "Email \(protectedEmail + "@" + emailName[1])"
    }
    
    func handleMobileNumberProtection(with mobile: String) {
        var protectedMobile = ""
        for (index, number) in mobile.enumerated() {
            if index < mobile.count - 4 {
                if hasSpecialCharacters(character: "\(number)") {
                    protectedMobile.append(number)
                } else {
                    protectedMobile.append("*")
                }
            } else {
                protectedMobile.append(number)
            }
        }
        print("mobile", protectedMobile)
        mobileLabel.text = "Text \(protectedMobile)"
    }
    
    
    func hasSpecialCharacters(character: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: character, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, character.count)) {
                return true
            }
            
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
        return false
    }
    
    @IBAction func emailTapped(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                // set deselected
               // button.isSelected = false
                mobileOption.image = #imageLiteral(resourceName: "selectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
            } else {
                // set selected
               // button.isSelected = true
                mobileOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "selectedRadioButton")
            }
        }
    }
    
    @IBAction func mobileTapped(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                // set deselected
                // button.isSelected = false
                mobileOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "selectedRadioButton")
            } else {
                // set selected
                // button.isSelected = true
                mobileOption.image = #imageLiteral(resourceName: "selectedRadioButton")
                emailOption.image = #imageLiteral(resourceName: "unselectedRadioButton")
            }
        }
    }
    
}
