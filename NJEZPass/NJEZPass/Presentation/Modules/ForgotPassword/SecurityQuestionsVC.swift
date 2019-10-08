//
//  SecurityQuestionsVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 19/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS


class SecurityQuestionsVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var securityQuestionLbl: UILabel!
    @IBOutlet weak var securityQuestionTextDisplayLbl: UILabel!
    @IBOutlet weak var securityQuestionNo: UILabel!
    @IBOutlet weak var firstSecurityQuestionlnl: UILabel!
    @IBOutlet weak var firstSecurityQuestionAnswerInputField: ApolloTextInputField!
    @IBOutlet weak var continueBtnLbl: UIButton!
    
    var flowKey = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstSecurityQuestionAnswerInputField.delegate = self
        continueBtnLbl.isEnabled = false
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
        
        let activeField: ApolloTextInputField? = [firstSecurityQuestionAnswerInputField].first { $0.isFirstResponder }
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
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueClicked(_ sender: Any) {
        switch flowKey {
        case RegisterYourAccountFLow.registerAccount.rawValue:
            break
        default:
            self.performSegue(withIdentifier: "showNewPassword", sender: nil)
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    private func validateInput() {
        if let firstAuthenticationQues = firstSecurityQuestionAnswerInputField.text, firstAuthenticationQues.count>0 {
            continueBtnLbl.isEnabled = true
        } else {
            continueBtnLbl.isEnabled = false
        }
        toggleLoginButtonColor()
    }
    
    func toggleLoginButtonColor() {
        if continueBtnLbl.isEnabled {
            continueBtnLbl.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            continueBtnLbl.backgroundColor = #colorLiteral(red: 0.4489307404, green: 0.09403731674, blue: 0.5118483901, alpha: 0.5)
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension SecurityQuestionsVC: ApolloTextInputFieldDelegate {
    
    func lawShouldChangeCharactersIn(_ textField: ApolloTextInputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        validateInput()
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
