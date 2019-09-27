//
//  CountryCell.swift 
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 20/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

protocol CountryCellDelegate:class {
    func countrySelected(countryField:ApolloTextInputField?)
}

class CountryCell: UITableViewCell, ApolloTextInputFieldDelegate {

    @IBOutlet weak var countryTextField: ApolloTextInputField!

    weak var delegate:CountryCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func lawTextFieldDidBeginEditing(textField: ApolloTextInputField) {
        //        textField.inputAccessoryView = CMPickerView(frame: CGRect.zero)
        
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.endEditing(true)
        return true
    }
    
    @IBAction func countryClicked(_ sender: Any) {
        delegate?.countrySelected(countryField: countryTextField)
    }
    
}
