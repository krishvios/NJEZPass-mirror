//
//  LoginMethodsTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 10/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS
import KeychainAccess

protocol LoginMethodsCellDelegate:class {
    func loginClicked(username: String?, password: String?)
    func signinClicked(_ sender: Any)
    func forgotPasswordClicked(_ sender: Any)
    func forgotUserNameCllicked(_ sender: Any)
}

class LoginMethodsTableViewCell: UITableViewCell {


    @IBOutlet weak var txtUserID: ApolloTextInputField!
    @IBOutlet weak var txtPassword: ApolloTextInputField! {
        didSet {
            txtPassword.validationType = .password
        }
    }
    @IBOutlet weak var signUPButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var rememberMe: UISwitch!

     weak var loginDelegate: LoginMethodsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        txtUserID.delegate = self
        txtUserID.text = "WHESS4"
        txtPassword.delegate = self
        loginButton.isEnabled = false
        signUPButton.backgroundColor = .clear
        signUPButton.layer.borderWidth = 1
        signUPButton.layer.borderColor = #colorLiteral(red: 0.4117647059, green: 0.1254901961, blue: 0.4941176471, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func loginClicked(_ sender: Any) {
        loginDelegate?.loginClicked(username: txtUserID.text, password: txtPassword.text)
    }
    
    @IBAction func signinClicked(_ sender: Any) {
        loginDelegate?.signinClicked(sender)
    }
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        loginDelegate?.forgotPasswordClicked(sender)
    }
    @IBAction func forgotUserNameCllicked(_ sender: Any) {
        loginDelegate?.forgotUserNameCllicked(sender)
    }
    
    private func validateInput() {
        //loginButton.isEnabled = false
        if let userName = txtUserID.text, let password = txtPassword.text, userName.count > 0, password.count > 0 {
            loginButton.isEnabled = true
        }
        toggleLoginButtonColor()
    }
    
    func toggleLoginButtonColor() {
        if loginButton.isEnabled {
            loginButton.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            loginButton.backgroundColor = #colorLiteral(red: 0.4489307404, green: 0.09403731674, blue: 0.5118483901, alpha: 0.5)
        }
    }
    
    func hideKeyboardWhenTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginMethodsTableViewCell.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    private func fillCredentials() {
        print(#function)
        let keychain = Keychain(service: "com.conduent.NJEZPass")
        
        DispatchQueue.global().async {
            do {
                if let userId = try keychain.authenticationPrompt("Authenticate to login to server").get("userId") {
                    self.txtUserID.text = userId
                }
            }
            catch let error {
                print(error)
            }
            do {
                if let password = try keychain.authenticationPrompt("Authenticate to login to server").get("password") {
                    self.txtPassword.text = password
                }
            }
            catch let error {
                print(error)
            }
        }
        validateInput()
    }

    
    public func saveCredentials() {
        let keychain = Keychain(service: "com.conduent.NJEZPass")
        do {
            try keychain.set(txtUserID.text!, key: "userId")
        }
        catch let error {
            print(error)
        }
        do {
            try keychain.set(txtPassword.text!, key: "password")
        }
        catch let error {
            print(error)
        }
    }
}

extension LoginMethodsTableViewCell: ApolloTextInputFieldDelegate {
    func lawTextFieldDidBeginEditing(textField: ApolloTextInputField) {
    }
    
    func lawTextFieldDidEndEditing(textField: ApolloTextInputField) {
        
    }
    
    func lawTextFieldDidChange(textField: ApolloTextInputField) {
    }
    
    func lawShouldChangeCharactersIn(_ textField: ApolloTextInputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        validateInput()
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        return true
    }
}
