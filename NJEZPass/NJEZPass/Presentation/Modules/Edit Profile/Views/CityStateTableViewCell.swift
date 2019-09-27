//
//  CityStateTableViewCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 20/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

protocol CityStateDelegate:class {
    func stateSelected(stateField:ApolloTextInputField?)
}

class CityStateTableViewCell: UITableViewCell {

    @IBOutlet weak var cityTextField: ApolloTextInputField!
    @IBOutlet weak var stateTextField: ApolloTextInputField!{
        didSet{
            stateTextField.validationType = .dropdown
        }
    }
    @IBOutlet weak var stateSelectButton: UIButton!

    weak var delegate:CityStateDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stateTextField.delegate = self
        stateTextField.clearButton.isHidden = true
//        stateTextField.inputAccessoryView = CMPickerView(frame: .zero)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPickerView(picker:CMPickerView, with Target:EditProfileViewController) {
        
    }
    
  
    
}
extension CityStateTableViewCell: ApolloTextInputFieldDelegate {
    func lawTextFieldTapped(_ textField: ApolloTextInputField) {
        delegate?.stateSelected(stateField: stateTextField)
    }
    func lawTextFieldDidBeginEditing(textField: ApolloTextInputField) {
        self.stateTextField.clearButton.isHidden = true
        delegate?.stateSelected(stateField: stateTextField)
    }
}
