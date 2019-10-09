//
//  RequestSuppliesCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 05/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

protocol RequestSuppliesdelegate: class {
    func readPreventionBagTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func AdhesiveStripSetsTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func continueButtonTapped(_ sender: Any)
}

class RequestSuppliesCell: UITableViewCell {
    
    @IBOutlet weak var continueBtnLbl: CMButton!
    @IBOutlet weak var readPreventionBagLbl: UILabel!
    @IBOutlet weak var AdhesiveStripSetsLbl: UILabel!
    @IBOutlet weak var readPreventionBagTypeTxtField: ApolloTextInputField! {
        didSet {
            readPreventionBagTypeTxtField.validationType = .dropdown
        }
    }
    @IBOutlet weak var AdhesiveStripSetsTxtField: ApolloTextInputField! {
        didSet {
            AdhesiveStripSetsTxtField.validationType = .dropdown
        }
    }
    
    weak var  requestDelegate: RequestSuppliesdelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        readPreventionBagTypeTxtField.clearButton.isHidden = true
        AdhesiveStripSetsTxtField.clearButton.isHidden = true
       
        readPreventionBagTypeTxtField.delegate = self
        AdhesiveStripSetsTxtField.delegate = self
       
        continueBtnLbl.isEnabled = false
        toggleButtonColor()
        
        readPreventionBagLbl.isHidden = true
        AdhesiveStripSetsLbl.isHidden = true
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

extension RequestSuppliesCell: ApolloTextInputFieldDelegate {

    func lawTextFieldTapped(_ textField: ApolloTextInputField) {
        
        switch  textField {
        case readPreventionBagTypeTxtField:
            requestDelegate?.readPreventionBagTapped(textField, placeHolder: "Read-Prevention Bag",lable: readPreventionBagLbl)
            requestDelegate?.readPreventionBagTapped(textField, placeHolder: "Read-Prevention Bag",lable: readPreventionBagLbl)
        case AdhesiveStripSetsTxtField:
            continueBtnLbl.isEnabled = true
            toggleButtonColor()
            requestDelegate?.AdhesiveStripSetsTapped(textField, placeHolder: "Adhesive Strip Sets",lable: AdhesiveStripSetsLbl)
            requestDelegate?.AdhesiveStripSetsTapped(textField, placeHolder: "Adhesive Strip Sets",lable: AdhesiveStripSetsLbl)
        default:
            break
        }
    }
}
