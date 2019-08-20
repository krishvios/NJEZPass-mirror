//
//  CountryZipcodeTableViewCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 20/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class CountryZipcodeTableViewCell: UITableViewCell {

    @IBOutlet weak var countryTextField: ApolloTextInputField!
    @IBOutlet weak var zipcodeTextField: ApolloTextInputField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPickerView(picker:CMPickerView, with Target:EditProfileViewController) {
        
    }
}
