//
//  NewPasswordVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class NewPasswordVC: UIViewController {

    @IBOutlet weak var newPasswordLbl: UILabel!
    @IBOutlet weak var newpasswordTxt: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var newPasswordInputField: ApolloTextInputField!{
        didSet {
            newPasswordInputField.validationType = .password
        }
    }
    
    @IBOutlet weak var confirmPasswordInputField: ApolloTextInputField! {
        didSet {
            confirmPasswordInputField.validationType = .password
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newPasswordInputField.delegate = self
        confirmPasswordInputField.delegate = self
        saveButtonLbl.isEnabled = false
        setNavBar()
        setKeyBoardforText()
        toggleLoginButtonColor()
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
    func setNavBar()
    {
        
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }*/
     @IBAction func saveButtonClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LandingVC") as! LandingVC
        self.navigationController?.pushViewController(loginVC, animated: true)
     }
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
        
       dismiss(animated: false, completion: nil)
    }
    private func validateInput() {
        //loginButton.isEnabled = false
        
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
        if let newPassword = newPasswordInputField.text,let confirmPassword = confirmPasswordInputField.text, newPassword.count > 0  && confirmPassword.count > 0
        {
            validateInput()
        }
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
