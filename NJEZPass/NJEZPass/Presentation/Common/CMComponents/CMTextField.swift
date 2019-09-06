//
//  CMTextField.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 08/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol CMTextFieldDelegate:class {
    func textFieldDidDelete(textField:UITextField?)
}

class CMTextField: UITextField {

    weak var cmtfDelegate:CMTextFieldDelegate?
    
    override func deleteBackward() {
        super.deleteBackward()
        
        cmtfDelegate?.textFieldDidDelete(textField: self)
    }
}
