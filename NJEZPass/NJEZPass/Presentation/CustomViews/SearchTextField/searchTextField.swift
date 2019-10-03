//
//  searchTextField.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 01/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol searchTextFieldDelegate:class  {
 func textFieldDidBeginEditing(_ textField: UITextField)
 func textFieldDidEndEditing(_ textField: UITextField)
 func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
 func textFieldShouldReturn(_ textField: UITextField) -> Bool 
}

class searchTextField: UIView {

    @IBOutlet var customeSearchField: UIView!
    @IBOutlet weak internal var textFieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit(){
       Bundle.main.loadNibNamed("searchTextField", owner: self, options: nil)
        addSubview(customeSearchField)
        customeSearchField.translatesAutoresizingMaskIntoConstraints = false
        fixConstraintsInView(customeSearchField)
        textField.delegate = self
        
    }
    
    @IBInspectable
    public var text: String? {
        get {
                return textField.text
            }
        set {
                textField.text = newValue
            }
    }
    
    func fixConstraintsInView(_ container: UIView!) -> Void {
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
extension searchTextField:  UITextFieldDelegate{
    public func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
       
    }
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       return true
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
