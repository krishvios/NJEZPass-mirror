//
//  ForgotUserNameVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 17/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class ForgotUserNameVC: UIViewController {
    
    @IBOutlet weak var forgotUsernameLbl: UILabel!
    @IBOutlet weak var forgotUsernameText: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tagInputField: ApolloTextInputField!
    @IBOutlet weak var orLbl: UILabel!
    @IBOutlet weak var accountNumberInputField: ApolloTextInputField!
    @IBOutlet weak var zipCodeInputField: ApolloTextInputField!
    @IBOutlet weak var countinueButtonLbl: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        countinueButtonLbl.isEnabled = false
        tagInputField.delegate = self
        accountNumberInputField.delegate = self
        zipCodeInputField.delegate = self
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
        scrollView.isScrollEnabled = false
    }
    
    func setNavBar() {
        //image in nav bar
        self.navigationController?.navigationBar.isHidden = false
        let navImageView = UIImageView(frame: CGRect(x: 2, y: 0, width: 256, height: 16))
        navImageView.contentMode = .scaleAspectFit
        let navImage = UIImage(named: "navHeaderImage")
        navImageView.image = navImage
        navigationItem.titleView = navImageView
        
        //Back buttion
        let btnLeftMenu: UIButton = UIButton()
        btnLeftMenu.setImage(UIImage(named: "purpleArrow"), for: UIControl.State())
        btnLeftMenu.addTarget(self, action: #selector (backButtonClick(sender:)), for: UIControl.Event.touchUpInside)
        btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func backButtonClick(sender : UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func countinueButtonClicked(_ sender: Any) {
        if  let tag = tagInputField.text,
            let accountNo = accountNumberInputField.text,
            let zipcode = zipCodeInputField.text,
            (FieldValidator.shared.isValidUserID(userIDString: tag) || FieldValidator.shared.isValidUserID(userIDString: accountNo)),FieldValidator.shared.isValidZipCode(value: zipcode){
            
        }
        else{
            DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.invalidUserDetails), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: AppStringKeys.invalidUserDetails)
        }
    }
   
    private func validateInput() {
        //loginButton.isEnabled = false
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
        if let accountNO = accountNumberInputField.text, textField == zipCodeInputField && accountNO.count > 0 {
            validateInput()
        } else if let tagNo = tagInputField.text, textField == zipCodeInputField && tagNo.count > 0 {
            validateInput()
        }
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
