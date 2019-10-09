//
//  RequestTagsCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 04/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

protocol RequestTagsAdelegate: class {
    func tagMountTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func quantityTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func vehicleTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func planeNumberTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func continueButtonTapped(_ sender: Any)
}


class RequestTagsCell: UITableViewCell {

    @IBOutlet weak var continueBtnLbl: CMButton!
    @IBOutlet weak var tagMounTLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var vehicleLbl: UILabel!
    @IBOutlet weak var planNameLbl: UILabel!
    @IBOutlet weak var tagMountTypeTxtField: ApolloTextInputField! {
        didSet {
            tagMountTypeTxtField.validationType = .dropdown
        }
    }
    @IBOutlet weak var quantityTxtField: ApolloTextInputField! {
        didSet {
            quantityTxtField.validationType = .dropdown
        }
    }
    @IBOutlet weak var vehicleTypeTxtField: ApolloTextInputField! {
        didSet {
            vehicleTypeTxtField.validationType = .dropdown
        }
    }
    @IBOutlet weak var planNameTxtField: ApolloTextInputField! {
        didSet {
            planNameTxtField.validationType = .dropdown
        }
    }
    
    weak var  requestDelegate: RequestTagsAdelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tagMountTypeTxtField.clearButton.isHidden = true
        quantityTxtField.clearButton.isHidden = true
        vehicleTypeTxtField.clearButton.isHidden = true
        planNameTxtField.clearButton.isHidden = true
        
        tagMountTypeTxtField.delegate = self
        quantityTxtField.delegate = self
        vehicleTypeTxtField.delegate = self
        planNameTxtField.delegate = self
        
        continueBtnLbl.isEnabled = false
        toggleButtonColor()
        
        tagMounTLbl.isHidden = true
        quantityLbl.isHidden = true
        vehicleLbl.isHidden = true
        planNameLbl.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        requestDelegate?.continueButtonTapped(sender)
    }
    
    func toggleButtonColor() {
        if continueBtnLbl.isEnabled {
            continueBtnLbl.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            continueBtnLbl.backgroundColor = #colorLiteral(red: 0.4489307404, green: 0.09403731674, blue: 0.5118483901, alpha: 0.5)
        }
    }
}

extension RequestTagsCell : ApolloTextInputFieldDelegate {
    
    func lawTextFieldDidBeginEditing(textField: ApolloTextInputField) {
        requestDelegate?.tagMountTapped(textField, placeHolder: "Tag Mount Type",lable: tagMounTLbl)
    }
    
    func lawTextFieldDidEndEditing(textField: ApolloTextInputField) {
    }
    
    func lawTextFieldDidChange(textField: ApolloTextInputField) {
        
    }
    
    func lawShouldChangeCharactersIn(_ textField: ApolloTextInputField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    func lawTextFieldShouldReturn(_ textField: ApolloTextInputField) -> Bool {
        self.endEditing(true)
        return true
    }
    
    
    func lawTextFieldTapped(_ textField: ApolloTextInputField) {
        
        switch  textField {
        case tagMountTypeTxtField:
            requestDelegate?.tagMountTapped(textField, placeHolder: "Tag Mount Type",lable: tagMounTLbl)
            requestDelegate?.tagMountTapped(textField, placeHolder: "Tag Mount Type",lable: tagMounTLbl)
        case quantityTxtField:
            requestDelegate?.quantityTapped(textField, placeHolder: "Quantity",lable: quantityLbl)
             requestDelegate?.quantityTapped(textField, placeHolder: "Quantity",lable: quantityLbl)
        case planNameTxtField:
            requestDelegate?.planeNumberTapped(textField, placeHolder: "Plan Name",lable: planNameLbl)
            requestDelegate?.planeNumberTapped(textField, placeHolder: "Plan Name",lable: planNameLbl)
            continueBtnLbl.isEnabled = true
            toggleButtonColor()
            
        case vehicleTypeTxtField:
            requestDelegate?.vehicleTapped(textField, placeHolder: "vehicle Type",lable: vehicleLbl)
            requestDelegate?.vehicleTapped(textField, placeHolder: "vehicle Type",lable: vehicleLbl)
            
        default:
            break
        }
    }
}
