//
//  CountryZipcodeTableViewCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 20/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

protocol CountryZipcodeDelegate:class {
    func countrySelected(countryField:ApolloTextInputField?)
}

class CountryZipcodeTableViewCell: UITableViewCell, ApolloTextInputFieldDelegate {

    @IBOutlet weak var countryTextField: ApolloTextInputField!
    @IBOutlet weak var zipcodeTextField: ApolloTextInputField!

    @IBOutlet weak var countrySelectButton: UIButton!

    weak var delegate:CountryZipcodeDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        zipcodeTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPickerView(picker:CMPickerView, with Target:EditProfileViewController) {
        
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.endEditing(true)
        return true
    }
    
    @IBAction func countryClicked(_ sender: Any) {
        delegate?.countrySelected(countryField: countryTextField)
    }
}
