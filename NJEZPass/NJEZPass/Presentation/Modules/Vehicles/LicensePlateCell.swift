//
//  LicensePlateCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

protocol LicensePlateDelegate: class {
    func countryInputTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func stateInputTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func plateTypeInputTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func continueButtonTapped(_ sender: Any)
}

class LicensePlateCell: UITableViewCell {
    
    weak var  LicensePlateDelegate: LicensePlateDelegate?
    @IBOutlet weak var plateNumberInputField: ApolloTextInputField!
    @IBOutlet weak var countryInputField: ApolloTextInputField!{
        didSet {
            countryInputField.validationType = .dropdown
        }
    }
    @IBOutlet weak var stateInputField: ApolloTextInputField!{
        didSet {
            stateInputField.validationType = .dropdown
        }
    }
    @IBOutlet weak var plateTypeInputField: ApolloTextInputField!{
        didSet {
            plateTypeInputField.validationType = .dropdown
        }
    }
    @IBOutlet weak var continueBtnLbl: CMButton!
    
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var plateTypeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        countryInputField.delegate = self
        stateInputField.delegate = self
        plateTypeInputField.delegate = self
        
        countryLbl.isHidden = true
        stateLbl.isHidden = true
        plateTypeLbl.isHidden = true
        
        continueBtnLbl.isEnabled = false
        toggleButtonColor()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func continueBtnTapped(_ sender: Any) {
        LicensePlateDelegate?.continueButtonTapped(sender)
    }
    
    func toggleButtonColor() {
        if continueBtnLbl.isEnabled {
            continueBtnLbl.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            continueBtnLbl.backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.1254901961, blue: 0.4941176471, alpha: 0.5)
        }
    }
}

extension LicensePlateCell : ApolloTextInputFieldDelegate {
    
    func lawShouldChangeCharactersIn(_ textField: ApolloTextInputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.endEditing(true)
        return true
    }
    
    
    func lawTextFieldTapped(_ textField: ApolloTextInputField) {
        
        switch  textField {
        case countryInputField:
            LicensePlateDelegate?.countryInputTapped(textField, placeHolder: "Country",lable: countryLbl)
            LicensePlateDelegate?.countryInputTapped(textField, placeHolder: "Country",lable: countryLbl)
        case stateInputField:
            LicensePlateDelegate?.stateInputTapped(textField, placeHolder: "State",lable: stateLbl)
            LicensePlateDelegate?.stateInputTapped(textField, placeHolder: "State",lable: stateLbl)
            continueBtnLbl.isEnabled = true
            toggleButtonColor()
        case plateTypeInputField:
            LicensePlateDelegate?.plateTypeInputTapped(textField, placeHolder: "Plate Type",lable: plateTypeLbl)
            LicensePlateDelegate?.plateTypeInputTapped(textField, placeHolder: "Plate Type",lable: plateTypeLbl)
        default:
            continueBtnLbl.isEnabled = true
            toggleButtonColor()
            break
        }
    }
}
