//
//  VehicleMakeVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 08/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class VehicleMakeVC: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!
    
    lazy fileprivate var makeSelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["Acura"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var yearType: CMPickerView! = {
        let pickerView1 = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView1.pickerArray = ["2016"]
        pickerView1.viewDelegate = self
        return pickerView1
    }()
    
    lazy fileprivate var modelSelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["ADX"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var vehicleTypeSelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["SUV"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    fileprivate var selectedFieldText = ""
    fileprivate var selectedField:ApolloTextInputField?
    fileprivate var selectedLbl:UILabel?
    fileprivate var selectedString:String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension VehicleMakeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 100
        case 2:
            return 180
        default:
            return 478
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch  indexPath.row {
        case 0:
            let cell  = tableView.dequeueReusableCell(withIdentifier: "ProgressCell", for: indexPath)
            return cell
        case 2:
            let cell  = tableView.dequeueReusableCell(withIdentifier: "Empty", for: indexPath)
            return cell
        default:
            let cell: VehicleMakeCell = tableView.dequeueReusableCell(withIdentifier: "\(VehicleMakeCell.self)", for: indexPath) as! VehicleMakeCell
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "AddVehicle", sender: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


extension VehicleMakeVC : vehicleMakeDelegate {
    func makeInputTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        selectedFieldText = self.makeSelection.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.makeSelection){
            self.makeSelection.isHidden = false
        } else {
            self.view.addSubview(makeSelection)
        }
    }
    
    func yearInputTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        
        selectedFieldText = self.yearType.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.yearType){
            self.yearType.isHidden = false
        } else {
            self.view.addSubview(yearType)
        }
    }
    
    func modelInputTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        
        selectedFieldText = self.modelSelection.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.modelSelection){
            self.modelSelection.isHidden = false
        } else {
            self.view.addSubview(modelSelection)
        }
    }
    
    func vehicleTypeInputTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        
        selectedFieldText = self.vehicleTypeSelection.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.vehicleTypeSelection){
            self.vehicleTypeSelection.isHidden = false
        } else {
            self.view.addSubview(vehicleTypeSelection)
        }
    }
    
    func saveButtonTapped(_ sender: Any) {
        if let vehicleVC = navigationController!.viewControllers.filter({ $0 is VehiclesViewController }).first {
            navigationController?.popToViewController(vehicleVC, animated: false)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    func hidePicker() {
        self.modelSelection.isHidden = true
        self.yearType.isHidden = true
        self.vehicleTypeSelection.isHidden = true
        self.makeSelection.isHidden = true
    }
    
}


extension VehicleMakeVC: CMPickerViewDelegate {
    
    func doneClicked(selectedString:String) {
        selectedField?.becomeFirstResponder()
        selectedField?.text = selectedString
        if selectedString.count == 0 {
            selectedLbl?.isHidden = false
            selectedField?.text = selectedFieldText
        }
        selectedField?.resignFirstResponder()
        self.modelSelection.isHidden = true
        self.yearType.isHidden = true
        self.vehicleTypeSelection.isHidden = true
        self.makeSelection.isHidden = true
    }
    
    func cancelClicked() {
        if selectedField?.text?.count == 0 {
            selectedLbl?.isHidden = true
            selectedField?.placeholder = selectedString
        }
        self.modelSelection.isHidden = true
        self.yearType.isHidden = true
        self.vehicleTypeSelection.isHidden = true
        self.makeSelection.isHidden = true
    }
}
