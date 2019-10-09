//
//  EditProfileViewController.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 01/08/19.
//  Copyright © 2019 Anshu Sharma. All rights reserved.
//

import UIKit
import Apollo_iOS
import Entities

//enum RetrivalEnum:String{
//    case abbreviation
//    case name
//    case states
//}

protocol IEditProfileViewable {
    func updateProfileSuccess(viewModel: ProfileModel.PresentionModel)
    func updateProfileFailed(viewModel: ProfileModel.PresentionModel)
}

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var personalInfoPlaceholderArr = ["Full Name", "Username", "Address Line 1", "Address Line 2"]
    var contactInfoPlaceholderArr = ["Zip Code", "Primary Email Address", "Secondary Email Address(optional)", "Primary Phone Number","Secondary Phone Number(Optional)"]
    fileprivate var selectedState = ""
    fileprivate var selectedField:ApolloTextInputField?
//    var retrivalEnum:RetrivalEnum = .abbreviation
    lazy fileprivate var countrySelectionPicker: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["USA","Canada"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var stateSelectionPicker: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["Oklahoma","Georgia"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    // MARK: - View Controller Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension EditProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 72
        switch indexPath.row
        {
        case 11:
            height = 84
        default:
            height = 85
        }
        
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        switch indexPath.row {
        case 5:
            cellIdentifier = "cityStateCell"
            let cityStateCell:CityStateTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CityStateTableViewCell)!
            cityStateCell.delegate = self
            return cityStateCell
        case 4:
            cellIdentifier = "countries"
            let countryCell:CountryTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CountryTableViewCell)!
            countryCell.countryDelegate = self
            return countryCell
        case 11:
            cellIdentifier = "SaveButtonCell"
            let saveCell:SaveTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? SaveTableViewCell)!
            saveCell.delegate = self
            return saveCell
        default:
            cellIdentifier = "InputFieldTableViewCell"
            let ifCell:InputFieldTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? InputFieldTableViewCell)!
            if indexPath.row>=0 && indexPath.row<=3 {
                ifCell.setPlaceHolder(with: personalInfoPlaceholderArr[indexPath.row])
            }
            else{
                ifCell.setPlaceHolder(with: contactInfoPlaceholderArr[indexPath.row-6])
            }
            return ifCell
        }
    }
}

extension EditProfileViewController: CMPickerViewDelegate {
    
    // MARK: - CMPickerView Delegate methods
    
    func doneClicked(selectedString:String) {
        selectedField?.becomeFirstResponder()
        selectedField?.text = selectedString
        selectedField?.resignFirstResponder()
        self.stateSelectionPicker.isHidden = true
        self.countrySelectionPicker.isHidden = true
    }
    
    func cancelClicked() {
        self.stateSelectionPicker.isHidden = true
        self.countrySelectionPicker.isHidden = true
    }
}

extension EditProfileViewController:CountryTableViewCellDelegate{
    func countrySelected(countryField: ApolloTextInputField?) {
        self.countrySelectionPicker.pickerArray = ["NJ", "NY"]
        selectedField = countryField
        if view.subviews.contains(self.countrySelectionPicker){
            self.countrySelectionPicker.isHidden = false
        } else {
            self.view.addSubview(countrySelectionPicker)
        }
    }
}

extension EditProfileViewController: CityStateDelegate {
    
    func stateSelected(stateField: ApolloTextInputField?) {
        self.stateSelectionPicker.pickerArray = ["Omaha", "California"]
        selectedField = stateField
        if view.subviews.contains(self.stateSelectionPicker){
            self.stateSelectionPicker.isHidden = false
        } else {
            self.view.addSubview(stateSelectionPicker)
        }
    }
}
extension EditProfileViewController:saveButtonDelegate {
    func saveTapped(_sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// Parsing JSONLocal
/*
 fileprivate var usaStates:NSArray?
 fileprivate var caStates:NSArray?
 fileprivate var selectedCountry = ""

if let path = Bundle.main.path(forResource: "country_states", ofType: "json") {
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        if let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? NSArray {
            let usaDetails = jsonResult[0] as? NSDictionary
            let caDetails = jsonResult[1] as? NSDictionary
            
            usaStates = usaDetails!["states"] as? NSArray
            caStates = caDetails!["states"] as? NSArray
            
            var usaStateDict:[String]?
            var caStateDict:[String]?
            
            var usaStatesKeys:[String]?
            var usaStatesValues:[String]?
            var caStatesKeys:[String]?
            var caStatesValues:[String]?
            for dict in (usaStates! as! [NSDictionary]) {
                //                        usaStateDict![dict["abbreviation"]] = dict["name"]
                print("dict = \(dict)")
            }
            for dict in (caStates! as! [NSDictionary]) {
                //                        caStateDict![dict["abbreviation"]] = dict["name"]
                print("dict = \(dict)")
                caStatesKeys?.append(dict.value(forKey: "abbreviation")! as! String)
                caStatesValues?.append(dict.value(forKey: "name")! as! String)
                //                        caStateDict![(dict.value(forKey: "abbreviation")! as! String)] = (dict.value(forKey: "name")! as! String)
                print("baby abbreviation = \(dict.value(forKey: "abbreviation")!)")
            }
            
            print("usaStates = \(String(describing: usaStates))")
            print("caStates = \(String(describing: caStates))")
            //                    print("usaStateDict = \(usaStateDict)")
            //                    print("caStateDict = \(caStateDict)")
        }
    } catch {
        // handle error
    }
}
*/

extension EditProfileViewController: IEditProfileViewable {
    func updateProfileSuccess(viewModel: ProfileModel.PresentionModel) {
        let token:String = UserDefaults.standard.value(forKey: AppStringKeys.accessToken) as! String
        //        interactor?.updateProfileOverview(accessToken: token, requestType: .remote)
    }
    
    func updateProfileFailed(viewModel: ProfileModel.PresentionModel) {
        var viewModel = viewModel
        //        viewModel.route = Route(id: AppStringKeys.updateProfileFailure, path: AppUIElementKeys.editProfile, nextURL: "", navigation: NavigationInfo.present)
    }
}
