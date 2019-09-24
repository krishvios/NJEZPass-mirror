//
//  LoginViewController.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 21/08/19.
//  Copyright © 2019 Conduent. All rights reserved.


import UIKit
import Entities
import Domain
import Platform
import Apollo_iOS
import MBProgressHUD
import KeychainAccess

protocol ILoginViewable {
    func loginSuccess(viewModel: LoginModel.PresentionModel)
    func loginFailed(viewModel: LoginModel.PresentionModel)
    func userProfileSuccess(viewModel: ProfileModel.PresentionModel)
    func userProfileFailed(viewModel: ProfileModel.PresentionModel)
}

class LoginViewController: UIViewController {
    
    var interactor: ILoginInteractable?
    var router: IRouter?
    
    @IBOutlet weak var txtUserID: ApolloTextInputField!
    @IBOutlet weak var txtPassword: ApolloTextInputField! {
        didSet {
            txtPassword.validationType = .password
        }
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var rememberMe: UISwitch!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let configurator = LoginConfigurator()
        configurator.build(viewController: self)
        interactor = configurator.interactor
        router = configurator.router
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        fillCredentials()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUserID.delegate = self
        txtPassword.delegate = self
        loginButton.isEnabled = false
        hideKeyboardWhenTap()
        toggleLoginButtonColor()
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBOutlet weak var biometricAuthBtn: UIButton!
    
    // MARK: IBActions
    @IBAction func loginClicked(_ sender: Any) {
        self.view.endEditing(true)
        self.resignFirstResponder()
        doLogin()
    }
    
    func doLogin() {
        if let username = txtUserID.text, let password = txtPassword.text {
            
            //online login flow
//            MBProgressHUD.showAdded(to: self.view, animated: true)
//            interactor?.login(username: username, password: password, requestType: .remote)
            
//            direct login flow in case of api error
//            var viewModel = ProfileModel.PresentionModel()
//            viewModel.route = Route(id: AppStringKeys.loginSuccess, path: AppUIElementKeys.deviceVerification, nextURL: "", navigation: NavigationInfo.push)
//
//            router?.perform(viewModel: viewModel)
            var viewModel = ProfileModel.PresentionModel()
//            viewModel.route = Route(id: AppStringKeys.loginSuccess, path: AppUIElementKeys.deviceVerification, nextURL: "", navigation: NavigationInfo.push)
            viewModel.route = Route(id: AppStringKeys.loginSuccess, path: AppUIElementKeys.securityQuestions, nextURL: "", navigation: NavigationInfo.push)
            router?.perform(viewModel: viewModel)
            saveCredentials()
            
        } else {
            DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.invalidUserDetails), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: AppStringKeys.invalidUserDetails)
        }
    }
    
    @IBAction func forgotPassClicked(_ sender: Any) {
        
    }
    
    @IBAction func biometricAuthBtnClicked(_ sender: Any) {
        
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
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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

extension LoginViewController: ApolloTextInputFieldDelegate {
    func lawTextFieldDidBeginEditing(textField: ApolloTextInputField) {
    }
    
    func lawTextFieldDidEndEditing(textField: ApolloTextInputField) {
        validateInput()
    }
    
    func lawTextFieldDidChange(textField: ApolloTextInputField) {
    }
    
    func lawShouldChangeCharactersIn(_ textField: ApolloTextInputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        return true
    }
}

extension LoginViewController: ILoginViewable {
    func loginSuccess(viewModel: LoginModel.PresentionModel) {
        //        progressActivity.stopAnimating()
        
        if rememberMe.isOn {
            
            self.saveCredentials()
        }
        
        //        MBProgressHUD.hide(for: self.view, animated: true)
        let token:String = UserDefaults.standard.value(forKey: AppStringKeys.accessToken) as! String
        interactor?.getProfileOverview(accessToken: token, requestType: .remote)
        //        router?.perform(viewModel: viewModel)
    }
    func loginFailed(viewModel: LoginModel.PresentionModel) {
        //        progressActivity.stopAnimating()
        MBProgressHUD.hide(for: self.view, animated: true)
        var viewModel = viewModel
        viewModel.route = Route(id: AppStringKeys.loginFailure, path: AppUIElementKeys.home, nextURL: "", navigation: NavigationInfo.present)
        router?.perform(viewModel: viewModel)
    }
    func userProfileSuccess(viewModel: ProfileModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        
        router?.perform(viewModel: viewModel)
    }
    func userProfileFailed(viewModel: ProfileModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
        router?.perform(viewModel: viewModel)
    }
}

extension LoginViewController: IRoutable {
    func showMessage(message: String) {
        DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: message), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: message)
    }
    
    func popCurrent() {
        // dismiss current viewcontroller like back action
    }
}
