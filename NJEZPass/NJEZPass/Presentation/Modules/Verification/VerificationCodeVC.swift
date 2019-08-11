//
//  VerificationCodeVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 07/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class VerificationCodeVC: UIViewController, UITextFieldDelegate, CMTextFieldDelegate {
    
    @IBOutlet weak var firstTextField: CMTextField!
    @IBOutlet weak var secondTextField: CMTextField!
    @IBOutlet weak var thirdTextField: CMTextField!
    @IBOutlet weak var fourthTextField: CMTextField!
    @IBOutlet weak var fifthTextField: CMTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.addNavBarImage()
        
        textFieldCosmeticSetUp()
    }
    
    func textFieldCosmeticSetUp() {
        
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self
        fifthTextField.delegate = self

        firstTextField.cmtfDelegate = self
        secondTextField.cmtfDelegate = self
        thirdTextField.cmtfDelegate = self
        fourthTextField.cmtfDelegate = self
        fifthTextField.cmtfDelegate = self

        firstTextField.addBottomBorder()
        secondTextField.addBottomBorder()
        thirdTextField.addBottomBorder()
        fourthTextField.addBottomBorder()
        fifthTextField.addBottomBorder()
        
        firstTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        thirdTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        fourthTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        fifthTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    
    
    let TEXT_FIELD_LIMIT = 1
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return (textField.text?.utf16.count ?? 0) + string.utf16.count - range.length <= TEXT_FIELD_LIMIT
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        let text = textField.text
        if  text!.count >= 1  {
            // Move front to cursor position
            switch textField {
            case firstTextField:
                secondTextField.becomeFirstResponder()
            case secondTextField:
                thirdTextField.becomeFirstResponder()
            case thirdTextField:
                fourthTextField.becomeFirstResponder()
            case fourthTextField:
                fifthTextField.becomeFirstResponder()
            case fifthTextField:
                fifthTextField.resignFirstResponder()
            default:
                break
            }
        } else {
            
            // Move back to cursor position
            switch textField {
            case firstTextField:
                firstTextField.becomeFirstResponder()
            case secondTextField:
                firstTextField.becomeFirstResponder()
            case thirdTextField:
                secondTextField.becomeFirstResponder()
            case fourthTextField:
                thirdTextField.becomeFirstResponder()
            case fifthTextField:
                fourthTextField.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
    func textFieldDidDelete(textField: UITextField?) {
        // Move back to cursor position
        switch textField {
        case firstTextField:
            firstTextField.becomeFirstResponder()
        case secondTextField:
            firstTextField.becomeFirstResponder()
        case thirdTextField:
            secondTextField.becomeFirstResponder()
        case fourthTextField:
            thirdTextField.becomeFirstResponder()
        case fifthTextField:
            fourthTextField.becomeFirstResponder()
        default:
            break
        }
    }
}
