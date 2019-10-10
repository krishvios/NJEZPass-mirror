//
//  VehiclemakeCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

protocol vehicleMakeDelegate: class {
    func makeInputTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func yearInputTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func modelInputTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func vehicleTypeInputTapped(_ textField: ApolloTextInputField,placeHolder: String,lable :UILabel)
    func saveButtonTapped(_ sender: Any)
}

class VehicleMakeCell: UITableViewCell {
    
    @IBOutlet weak var rentalvehicleSwitch: UISwitch!
    weak var  delegate: vehicleMakeDelegate?
    
    @IBOutlet weak var makeInputField: ApolloTextInputField!{
        didSet {
            makeInputField.validationType = .dropdown
        }
    }
    @IBOutlet weak var modelInputField: ApolloTextInputField!{
        didSet {
            modelInputField.validationType = .dropdown
        }
    }
    @IBOutlet weak var yearTypeInputField: ApolloTextInputField!{
        didSet {
            yearTypeInputField.validationType = .dropdown
        }
    }
    @IBOutlet weak var vehicleTypeInputField: ApolloTextInputField!{
        didSet {
            vehicleTypeInputField.validationType = .dropdown
        }
    }

    @IBOutlet weak var saveBtnLbl: CMButton!
    
    @IBOutlet weak var makeLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
     @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var vehicleTypeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        makeInputField.delegate = self
        yearTypeInputField.delegate = self
        modelInputField.delegate = self
        vehicleTypeInputField.delegate = self
        
        makeInputField.clearButton.isHidden = true
        yearTypeInputField.clearButton.isHidden = true
        modelInputField.clearButton.isHidden = true
        vehicleTypeInputField.clearButton.isHidden = true
        
        makeLbl.isHidden = true
        yearLbl.isHidden = true
        vehicleTypeLbl.isHidden = true
        modelLbl.isHidden = true
        
        saveBtnLbl.isEnabled = false
        rentalvehicleSwitch.setOn(false, animated: false)
        rentalvehicleSwitch.addTarget(self, action: #selector(rentalvehicleSwitchChanged), for: UIControl.Event.valueChanged)
        toggleButtonColor()
    }
    
    func toggleButtonColor() {
        if saveBtnLbl.isEnabled {
            saveBtnLbl.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            saveBtnLbl.backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.1254901961, blue: 0.4941176471, alpha: 0.5)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        
    @IBAction func saveBtnTapped(_ sender: Any) {
      delegate?.saveButtonTapped(sender)
    }
    
    @objc func rentalvehicleSwitchChanged(mySwitch: UISwitch) {
        if rentalvehicleSwitch.isOn {
            saveBtnLbl.isEnabled = true
            toggleButtonColor()
        } else {
            saveBtnLbl.isEnabled = false
            toggleButtonColor()
        }
    }

}

extension VehicleMakeCell : ApolloTextInputFieldDelegate {
    
    func lawTextFieldTapped(_ textField: ApolloTextInputField) {
        
        switch  textField {
        case makeInputField:
            delegate?.makeInputTapped(textField, placeHolder: "Make",lable: makeLbl)
            delegate?.makeInputTapped(textField, placeHolder: "Make",lable: makeLbl)
        case yearTypeInputField:
            delegate?.yearInputTapped(textField, placeHolder: "Year",lable: yearLbl)
            delegate?.yearInputTapped(textField, placeHolder: "Year",lable: yearLbl)
        case modelInputField:
            delegate?.modelInputTapped(textField, placeHolder: "Model",lable: modelLbl)
            delegate?.modelInputTapped(textField, placeHolder: "Model",lable: modelLbl)
        case vehicleTypeInputField:
            delegate?.vehicleTypeInputTapped(textField, placeHolder: "Vehicle Type",lable: vehicleTypeLbl)
            delegate?.vehicleTypeInputTapped(textField, placeHolder: "Vehicle Type",lable: vehicleTypeLbl)
        default:
            break
        }
    }
}
