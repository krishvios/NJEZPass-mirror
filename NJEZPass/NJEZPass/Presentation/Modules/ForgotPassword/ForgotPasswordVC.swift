//
//  ForgotPasswordVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 17/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS
import Entities
import MBProgressHUD
import Platform

protocol IForgotPasswordViewable {
    func forgotPasswordSuccess(viewModel: ForgotPasswordModel.PresentionModel)
    func forgotPasswordFailed(viewModel: ForgotPasswordModel.PresentionModel)
}

class ForgotPasswordVC: UIViewController {
    
    @IBOutlet weak var forgotPasswordLbl: UILabel!
    @IBOutlet weak var forgotPasswordText: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userNameInputField: ApolloTextInputField!
    @IBOutlet weak var orLbl: UILabel!
    @IBOutlet weak var accountNumberInputField: ApolloTextInputField!
    @IBOutlet weak var zipCodeinputField: ApolloTextInputField!
    @IBOutlet weak var countinueButtonLbl: UIButton!
    
    var username:String?
    var accountNO:String?
    var zipcode:String?
    
    var interactor: IForgotPasswordInteractable?
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
              let configurator = ForgotPasswordConfigurator()
              configurator.build(viewController: self)
              interactor = configurator.interactor
              router = configurator.router
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countinueButtonLbl.isEnabled = false
        userNameInputField.delegate = self
        accountNumberInputField.delegate = self
        zipCodeinputField.delegate = self
        
        toggleLoginButtonColor()
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
        
        let activeField: ApolloTextInputField? = [accountNumberInputField, userNameInputField, zipCodeinputField].first { $0.isFirstResponder }
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
    
    @objc func backButtonClick(sender : UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func countinueButtonClicked(_ sender: Any) {
        self.view.endEditing(true)
        if let username = userNameInputField.text,
            let accountNO = accountNumberInputField.text,
            let zipcode = zipCodeinputField.text,
            (FieldValidator.shared.isValidUserID(userIDString: username) || FieldValidator.shared.isValidString(stringToBeChecked: accountNO, expression: AppRegExKeys.accountNo)),FieldValidator.shared.isValidZipCode(value: zipcode) {
            
            self.username = username
            self.accountNO = accountNO
            self.zipcode = zipcode
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
                   
            let request = ForgotPasswordModel.Request(action: APIConstants.ServiceNames.forgotPassword, userName: username, accountNumber: accountNO, zipCode: zipcode, securityQuestion: "", securityAnswer: "", newPassword: "", retypePassword: "", emailFlag: "")
            interactor?.forgotPassword(request:request, requestType: .remote)
        } else  {
            DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.invalidUserDetails), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: AppStringKeys.invalidUserDetails)
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func validateInput() {
        if let userName = userNameInputField.text,let zipCode = zipCodeinputField.text, userName.count > 0  && zipCode.count>0 {
            countinueButtonLbl.isEnabled = true
        } else if let accountNO = accountNumberInputField.text,let zipCode = zipCodeinputField.text,  accountNO.count > 0 && zipCode.count>0 {
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


extension ForgotPasswordVC: ApolloTextInputFieldDelegate {
    func lawShouldChangeCharactersIn(_ textField: ApolloTextInputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            validateInput()
        
        let text = textField.text
        if  text!.count >= 0  {
            // Move front to cursor position
            switch textField {
            case userNameInputField:
                accountNumberInputField.text = ""
            case accountNumberInputField:
                userNameInputField.text = ""
            default:
                break
            }
        }
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

extension ForgotPasswordVC: IForgotPasswordViewable {
    func forgotPasswordSuccess(viewModel: ForgotPasswordModel.PresentionModel) {
        CMUtility.accountNumber = accountNO
        CMUtility.userName = username
        CMUtility.zipCode = zipcode
        CMUtility.forgotPasswordRes = viewModel
        MBProgressHUD.hide(for: self.view, animated: true)
        self.performSegue(withIdentifier: "showResetPassword", sender: nil)
    }
    
    func forgotPasswordFailed(viewModel: ForgotPasswordModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension ForgotPasswordVC: IRoutable {
    func showMessage(message: String) {
        DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: message), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: message)
    }
    
    func popCurrent() {
        // dismiss current viewcontroller like back action
    }
}
