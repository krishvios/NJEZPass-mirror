//
//  NewPasswordVC.swift
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

protocol INewsPasswordViewable {
    func setNewPasswordSuccess(viewModel: ResetPasswordModel.PresentionModel)
    func setNewPasswordFailed(viewModel: ResetPasswordModel.PresentionModel)
}


class NewPasswordVC: UIViewController {

    @IBOutlet weak var newPasswordLbl: UILabel!
    @IBOutlet weak var newpasswordTxt: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var newPasswordInputField: ApolloTextInputField! {
        didSet {
            newPasswordInputField.configureTheme(type: .none, forView: self, placeholderText: "New Password")
        }
    }
    
    @IBOutlet weak var confirmPasswordInputField: ApolloTextInputField! {
        didSet {
            confirmPasswordInputField.configureTheme(type: .none, forView: self, placeholderText: "Confirm New Password")
        }
    }
    
    @IBOutlet weak var saveButtonLbl: UIButton!
    @IBOutlet weak var passwordRequirementsLbl: UILabel!
    @IBOutlet weak var pwdRequirement1: UILabel!
    @IBOutlet weak var pwdRequirement2: UILabel!
    @IBOutlet weak var pwdRequirement3: UILabel!
    @IBOutlet weak var dot1: UILabel!
    @IBOutlet weak var dot2: UILabel!
    @IBOutlet weak var dot3: UILabel!
    
    var interactor: INewPasswordInteractable?
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
              let configurator = NewPasswordConfigurator()
              configurator.build(viewController: self)
              interactor = configurator.interactor
              router = configurator.router
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newPasswordInputField.delegate = self
        confirmPasswordInputField.delegate = self
        saveButtonLbl.isEnabled = false
        
        setKeyBoardforText()
        toggleLoginButtonColor()
        
        self.navigationController?.navigationBar.tintColor = .purple
        navigationController?.viewControllers.removeAll(where :{
            (vc) -> Bool in if  vc.isKind(of: SecurityQuestionsVC.self){
                return true
            }
            return false
        })
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
        
        let activeField: ApolloTextInputField? = [newPasswordInputField,confirmPasswordInputField].first { $0.isFirstResponder }
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
    
     @IBAction func saveButtonClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
     }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
        dismiss(animated: false, completion: nil)
    }
    
    private func validateInput() {
        
        if let newPassword = newPasswordInputField.text,let confirmPassword = confirmPasswordInputField.text, newPassword.count > 0  && confirmPassword.count > 0 {
            saveButtonLbl.isEnabled = true
        }else
        {
            saveButtonLbl.isEnabled = false
        }
        toggleLoginButtonColor()
    }
    
    func toggleLoginButtonColor() {
        if saveButtonLbl.isEnabled {
            saveButtonLbl.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            saveButtonLbl.backgroundColor = #colorLiteral(red: 0.4489307404, green: 0.09403731674, blue: 0.5118483901, alpha: 0.5)
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
extension NewPasswordVC: ApolloTextInputFieldDelegate {
    
    func lawShouldChangeCharactersIn(_ textField: ApolloTextInputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        validateInput()
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

extension NewPasswordVC: INewsPasswordViewable {
    func setNewPasswordSuccess(viewModel: ResetPasswordModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func setNewPasswordFailed(viewModel: ResetPasswordModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension NewPasswordVC: IRoutable {
    func showMessage(message: String) {
        DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: message), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: message)
    }
    
    func popCurrent() {
        // dismiss current viewcontroller like back action
    }
}
