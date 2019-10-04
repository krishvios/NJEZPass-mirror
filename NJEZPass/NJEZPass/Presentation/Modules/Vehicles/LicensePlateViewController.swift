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
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        switch indexPath.row {
//        case 0:
//            if let addressCell = tableView.dequeueReusableCell(withIdentifier: "\(InputFieldTableViewCell.self)") as? InputFieldTableViewCell {
//                cell = addressCell
//                addressCell.textField.placeholder = "Plate Number"
//            }
//        case 1:
//            if let countryCell = tableView.dequeueReusableCell(withIdentifier: "\(CountryCell.self)") as? CountryCell {
//                countryCell.delegate = self
//                cell = countryCell
//                countryCell.countryTextField.placeholder = "Country"
//                countryCell.countryTextField.text = selectedCountry
//            }
//        case 2:
//            if let cityStateCell = tableView.dequeueReusableCell(withIdentifier: "\(CityStateTableViewCell.self)") as? CityStateTableViewCell {
//                cityStateCell.delegate = self
//                cell = cityStateCell
//                cityStateCell.cityTextField.placeholder = "City"
//                cityStateCell.stateTextField.placeholder = "State"
//                cityStateCell.stateTextField.text = selectedState
//            }
//        default:
//            if let saveSkipCell = tableView.dequeueReusableCell(withIdentifier: "\(SaveSkipCell.self)") as? SaveSkipCell {
//                saveSkipCell.delegate = self
//                cell = saveSkipCell
//            }
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(VehicleCell.self)", for: indexPath) as! VehicleCell
//        //set the cell display properties
//        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
//        cell.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        cell.layer.shadowRadius = 3.0
//        cell.layer.shadowOpacity = 1.0
//        cell.layer.masksToBounds = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "AddVehicle", sender: nil)
    }
    
}


extension LicensePlateViewController: CMPickerViewDelegate {
    
    // MARK: - CMPickerView Delegate methods
    
    func doneClicked(selectedString:String) {
//        print("selectedString = \(selectedString)")
//        print("selectedField?.placeholder = \(String(describing: selectedField?.placeholder))")
//        selectedField?.becomeFirstResponder()
//        selectedField?.text = selectedString
//        selectedField?.resignFirstResponder()
//        self.stateSelectionPicker.isHidden = true
//        self.countrySelectionPicker.isHidden = true
    }
    
    func cancelClicked() {
//        self.stateSelectionPicker.isHidden = true
//        self.countrySelectionPicker.isHidden = true
    }
}

extension LicensePlateViewController: CountryCellDelegate {
    
    func countrySelected(countryField: ApolloTextInputField?) {
        
    }
    
    
//    func countrySelected(countryField: ApolloTextInputField?) {
//        if self.countrySelectionPicker.pickerArray.count == 0 {
//            self.countrySelectionPicker.pickerArray = formatDataArray(givenArray: CMUtility.dynamicPageLoad!.countryList!)
//        }
//        selectedField = countryField
//        if view.subviews.contains(self.countrySelectionPicker){
//            self.countrySelectionPicker.isHidden = false
//        } else {
//            self.view.addSubview(countrySelectionPicker)
//        }
//    }
}

extension LicensePlateViewController: CityStateDelegate {
    
    func stateSelected(stateField: ApolloTextInputField?) {
        
    }
    
    
//    func stateSelected(stateField: ApolloTextInputField?) {
//        if self.stateSelectionPicker.pickerArray.count == 0 {
//            self.stateSelectionPicker.pickerArray = formatDataArray(givenArray: CMUtility.dynamicPageLoad!.stateList!)
//        }
//        selectedField = stateField
//        if view.subviews.contains(self.stateSelectionPicker){
//            self.stateSelectionPicker.isHidden = false
//        } else {
//            self.view.addSubview(stateSelectionPicker)
//        }
//    }
}



