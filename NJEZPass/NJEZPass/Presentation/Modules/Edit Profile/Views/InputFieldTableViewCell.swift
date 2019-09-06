//
//  InputFieldTableViewCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 19/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class InputFieldTableViewCell: UITableViewCell, ApolloTextInputFieldDelegate {
    
    @IBOutlet weak var textField: ApolloTextInputField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func setPlaceHolder(with string:String) {
        textField.placeholder = string
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool{
        print(#function)
        self.endEditing(true)
        return true
    }
    
}
