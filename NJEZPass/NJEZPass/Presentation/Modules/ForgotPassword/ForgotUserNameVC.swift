//
//  ForgotUserNameVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 17/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

enum RegisterYourAccountFLow: String {
    case registerAccount
    case forgotUsername
}

class ForgotUserNameVC: UIViewController {
    
    @IBOutlet weak var forgotUsernameLbl: UILabel!
    @IBOutlet weak var forgotUsernameText: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tagInputField: ApolloTextInputField!
    @IBOutlet weak var orLbl: UILabel!
    @IBOutlet weak var accountNumberInputField: ApolloTextInputField!
    @IBOutlet weak var zipCodeInputField: ApolloTextInputField!
    @IBOutlet weak var countinueButtonLbl: UIButton!
    
    var flowKey = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        countinueButtonLbl.isEnabled = false
        tagInputField.delegate = self
        accountNumberInputField.delegate = self
        zipCodeInputField.delegate = self
        toggleLoginButtonColor()
        setKeyBoardforText()
        
        switch flowKey {
        case RegisterYourAccountFLow.forgotUsername.rawValue:
            forgotUsernameText.text = "Enter your account or tag number, along with your account’s mailing zip code below."
        case RegisterYourAccountFLow.registerAccount.rawValue:
            forgotUsernameLbl.text = "Register Your Account"
            forgotUsernameText.text = "If you did not set up a username and password during your account enrollment, you can create them now using your account number or tag number, and zip code."
            accountNumberInputField.placeholder = "Username"
        default:
            forgotUsernameText.text = "Enter your account or tag number, along with your account’s mailing zip code below."
        }
    }
    
    func setKeyBoardforText() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow(notification:)),
            name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide(notification:)),
            name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        scrollView.isScrollEnabled = true
        let info = notification.userInfo!
        let rect: CGRect = info[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let kbSize = rect.size
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
        var aRect = self.view.frame;
        aRect.size.height -= kbSize.height;
        let activeField: ApolloTextInputField? = [accountNumberInputField,tagInputField,zipCodeInputField].first { $0.isFirstResponder }
        if let activeField = activeField {
            if aRect.contains(activeField.frame.origin) {
                let scrollPoint = CGPoint(x: 0, y: activeField.frame.origin.y-kbSize.height+1)
                scrollView.setContentOffset(scrollPoint, animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
        scrollView.contentOffset = .zero
        scrollView.isScrollEnabled = false
    }
    
    @objc func backButtonClick(sender : UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func countinueButtonClicked(_ sender: Any) {
        if  let tag = tagInputField.text,
            let accountNo = accountNumberInputField.text,
            let zipcode = zipCodeInputField.text,
            (FieldValidator.shared.isValidUserID(userIDString: tag) || FieldValidator.shared.isValidUserID(userIDString: accountNo)),FieldValidator.shared.isValidZipCode(value: zipcode){
            switch flowKey {
            case RegisterYourAccountFLow.forgotUsername.rawValue:
                self.performSegue(withIdentifier: "forgotUserName", sender: self)
            case RegisterYourAccountFLow.registerAccount.rawValue:
                self.performSegue(withIdentifier: "showSecurityQuestions", sender: nil)
            default:
                self.performSegue(withIdentifier: "forgotUserName", sender: self)
            }
            
        }
        else{
            DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.invalidUserDetails), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: AppStringKeys.invalidUserDetails)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forgotUserName" {
            let nextScene =  segue.destination as! SignupAndSaveVC
            nextScene.flowString = "forgotUsernameFlow"
        } else if segue.identifier == "showSecurityQuestions" {
            let nextScene =  segue.destination as! SecurityQuestionsVC
            nextScene.flowKey = "registerAccount"
        }
    }
    
    private func validateInput() {
        if let accountNO = accountNumberInputField.text,let zipCode = zipCodeInputField.text, accountNO.count > 0 && zipCode.count>0 {
            countinueButtonLbl.isEnabled = true
        }else if let tagNo = tagInputField.text,let zipCode = zipCodeInputField.text, tagNo.count > 0 && zipCode.count>0 {
            countinueButtonLbl.isEnabled = true
        } else {
            countinueButtonLbl.isEnabled = false
        }
        toggleLoginButtonColor()
    }
    
    func toggleLoginButtonColor() {
        if countinueButtonLbl.isEnabled {
            countinueButtonLbl.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            countinueButtonLbl.backgroundColor = #colorLiteral(red: 0.4489307404, green: 0.09403731674, blue: 0.5118483901, alpha: 0.5)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ForgotUserNameVC: ApolloTextInputFieldDelegate {
    
    func lawShouldChangeCharactersIn(_ textField: ApolloTextInputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        validateInput()
        
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
