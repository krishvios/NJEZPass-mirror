//
//  CityStateTableViewCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 20/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class CityStateTableViewCell: UITableViewCell, ApolloTextInputFieldDelegate {

    @IBOutlet weak var cityTextField: ApolloTextInputField!
    @IBOutlet weak var stateTextField: ApolloTextInputField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        stateTextField.delegate = self
//        stateTextField.inputAccessoryView = CMPickerView(frame: .zero)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPickerView(picker:CMPickerView, with Target:EditProfileViewController) {
        
    }
    
    func lawTextFieldDidBeginEditing(textField: ApolloTextInputField) {
//        textField.inputAccessoryView = CMPickerView(frame: CGRect.zero)
        
    }
}
