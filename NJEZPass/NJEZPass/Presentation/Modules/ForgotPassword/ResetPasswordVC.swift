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
    @IBOutlet weak var emailidInputField: ApolloTextInputField!
    @IBOutlet weak var continueButtonText: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailidInputField.delegate = self
        continueButtonText.isEnabled = false
        toggleLoginButtonColor()
        setNavBar()
        setKeyBoardforText()
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
        
        let activeField: ApolloTextInputField? = [emailidInputField].first { $0.isFirstResponder }
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
        scrollView.isScrollEnabled = false
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.isHidden = false
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 256, height: 16))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "navHeaderImage")
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "purpleArrow"), for: .normal)
        btn.addTarget(self, action: #selector (backButtonClick(sender:)), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn)
        self.navigationItem.setLeftBarButton(item1, animated: true)
    }
    
    @objc func backButtonClick(sender : UIButton) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        if let emailID = emailidInputField.text, FieldValidator.shared.isValidEmail(emailID: emailID) {
            self.performSegue(withIdentifier: "showEmailConfirmation", sender: nil)
        } else {
            DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.invalidEmailDetails), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: AppStringKeys.invalidUserDetails)
        }
    }
    
    @IBAction func authenticationQuestionsButtonClicked(_ sender: Any) {
        
    }
    
    func validateInput() -> Void {
        if let emailID = emailidInputField.text, FieldValidator.shared.isValidEmail(emailID: emailID) {
            continueButtonText.isEnabled = true
        } else {
            continueButtonText.isEnabled = false
        }
        toggleLoginButtonColor()
    }
    
    func toggleLoginButtonColor() {
        if continueButtonText.isEnabled {
            continueButtonText.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            continueButtonText.backgroundColor = #colorLiteral(red: 0.4489307404, green: 0.09403731674, blue: 0.5118483901, alpha: 0.5)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ResetPasswordVC: ApolloTextInputFieldDelegate {
    func lawShouldChangeCharactersIn(_ textField: ApolloTextInputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailidInputField {
            validateInput()
        }
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
