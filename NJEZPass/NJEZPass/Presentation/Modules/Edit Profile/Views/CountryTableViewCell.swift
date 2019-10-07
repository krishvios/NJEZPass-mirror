//
//  CountryTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 27/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

protocol CountryTableViewCellDelegate:class {
    func countrySelected(countryField:ApolloTextInputField?)
}

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryTextField: ApolloTextInputField!{
        didSet{
            countryTextField.validationType = .dropdown
        }
    }
    weak var countryDelegate:CountryTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countryTextField.delegate = self
        countryTextField.clearButton.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func countryClicked(_ sender: Any) {
        countryDelegate?.countrySelected(countryField: countryTextField)
    }
}
extension CountryTableViewCell: ApolloTextInputFieldDelegate {
    
    func lawTextFieldTapped(_ textField: ApolloTextInputField) {
        countryDelegate?.countrySelected(countryField: countryTextField)
    }

}
