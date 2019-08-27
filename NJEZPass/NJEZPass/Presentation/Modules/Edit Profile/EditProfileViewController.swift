//
//  EditProfileViewController.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 01/08/19.
//  Copyright © 2019 Anshu Sharma. All rights reserved.
//

import UIKit
import Apollo_iOS

//enum RetrivalEnum:String{
//    case abbreviation
//    case name
//    case states
//}

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var personalInfoPlaceholderArr = ["First Name", "Last Name", "Address Line 1", "Address Line 2"]
    var contactInfoPlaceholderArr = ["Email", "Daytime Phone", "Evening Phone", "Cell Phone"]
    fileprivate var selectedState = ""
    fileprivate var selectedField:ApolloTextInputField?
//    var retrivalEnum:RetrivalEnum = .abbreviation
    lazy fileprivate var countrySelectionPicker: CMPickerView! = {
        
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.tableView.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["USA","Canada"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var stateSelectionPicker: CMPickerView! = {
        
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.tableView.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["Oklahoma","Georgia"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    // MARK: - View Controller Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EditProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 72
        switch indexPath.row
        {
        case 0,7:
            height = 42
        case 12:
            height = 84
        default:
            height = 72
        }
        
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        var cell:UITableViewCell?

        switch indexPath.row {
        case 0:
            cellIdentifier = "personalInfoCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        case 5:
            cellIdentifier = "cityStateCell"
            let cityStateCell:CityStateTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CityStateTableViewCell)!
            cityStateCell.delegate = self
            return cityStateCell
        case 6:
            cellIdentifier = "countryZipCodeCell"
            let countryZipcodeCell:CountryZipcodeTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CountryZipcodeTableViewCell)!
            countryZipcodeCell.delegate = self
            return countryZipcodeCell
        case 7:
            cellIdentifier = "contactInfoCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        case 12:
            cellIdentifier = "SaveButtonCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        default:
            cellIdentifier = "InputFieldTableViewCell"
            print("indexPath.row = \(indexPath.row)")
            let ifCell:InputFieldTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? InputFieldTableViewCell)!
            if indexPath.row>=1 && indexPath.row<=4
            {
                ifCell.setPlaceHolder(with: personalInfoPlaceholderArr[indexPath.row-1])
            }
            else if indexPath.row>=8 && indexPath.row<=11
            {
                ifCell.setPlaceHolder(with: contactInfoPlaceholderArr[indexPath.row-8])
            }
            return ifCell
        }
        return cell!
    }
    
}

extension EditProfileViewController: CMPickerViewDelegate {
    
    // MARK: - CMPickerView Delegate methods
    
    func doneClicked(selectedString:String) {
        print("selectedString = \(selectedString)")
        print("selectedField?.placeholder = \(String(describing: selectedField?.placeholder))")
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

extension EditProfileViewController: CountryZipcodeDelegate {
    
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
