//
//  LicensePlateViewController.swift
//  NJEZPass
//
//  Created by Alam, Sk on 27/09/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class LicensePlateViewController: UIViewController {
    
 
    @IBOutlet weak var tbleView: UITableView!
    
    lazy fileprivate var countrySelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["USA"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var plateType: CMPickerView! = {
        let pickerView1 = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView1.pickerArray = ["Standard"]
        pickerView1.viewDelegate = self
        return pickerView1
    }()
    
    lazy fileprivate var stateSelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["NJ"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    fileprivate var selectedFieldText = ""
    fileprivate var selectedField:ApolloTextInputField?
    fileprivate var selectedLbl:UILabel?
    fileprivate var selectedString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "License Plate"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
}

extension LicensePlateViewController: UITableViewDelegate, UITableViewDataSource {
    
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
            return 137
        case 2:
            return 180
        default:
            return 367
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
            let cell: LicensePlateCell = tableView.dequeueReusableCell(withIdentifier: "\(LicensePlateCell.self)", for: indexPath) as! LicensePlateCell
            cell.LicensePlateDelegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "AddVehicle", sender: nil)
    }
    
}


extension LicensePlateViewController : LicensePlateDelegate {
    func countryInputTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        hidePicker()
        selectedFieldText = self.countrySelection.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.countrySelection){
            self.countrySelection.isHidden = false
        } else {
            self.view.addSubview(countrySelection)
        }
    }
    
    func stateInputTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        hidePicker()
        selectedFieldText = self.stateSelection.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.stateSelection){
            self.stateSelection.isHidden = false
        } else {
            self.view.addSubview(stateSelection)
        }
    }
    
    func plateTypeInputTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        hidePicker()
        selectedFieldText = self.plateType.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.plateType){
            self.plateType.isHidden = false
        } else {
            self.view.addSubview(plateType)
        }
    }
    
    
    func continueButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowVehicleMake", sender: nil)
    }
    
    func hidePicker() {
        self.stateSelection.isHidden = true
        self.plateType.isHidden = true
        self.countrySelection.isHidden = true
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
    

extension LicensePlateViewController: CMPickerViewDelegate {
    
    func doneClicked(selectedString:String) {
        selectedField?.becomeFirstResponder()
        selectedField?.text = selectedString
        if selectedString.count == 0 {
            selectedLbl?.isHidden = false
            selectedField?.text = selectedFieldText
        }
        selectedField?.resignFirstResponder()
        self.stateSelection.isHidden = true
        self.plateType.isHidden = true
        self.countrySelection.isHidden = true
    }
    
    func cancelClicked() {
        if selectedField?.text?.count == 0 {
            selectedLbl?.isHidden = true
            selectedField?.placeholder = selectedString
        }
        self.stateSelection.isHidden = true
        self.plateType.isHidden = true
        self.countrySelection.isHidden = true
    }
}


    
    






