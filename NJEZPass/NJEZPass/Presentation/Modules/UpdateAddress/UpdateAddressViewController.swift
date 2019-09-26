//
//  UpdateAddressViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 20/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import MBProgressHUD
import Apollo_iOS

protocol IUpdateAddressViewable {
    func updateSuccess(viewModel: UpdateAddressModel.PresentionModel)
    func updateFailed(viewModel: UpdateAddressModel.PresentionModel)
}

class UpdateAddressViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {
        
    @IBOutlet weak var tbleView: UITableView!

    var interactor: IUpdateAddressInteractable?
    var router: IRouter?

    var securityQuestions = ["Security Question 1","Security Question 2","Security Question 3"]
    var securityQAnswers = ["Security Answer 1","Security Answer 2","Security Answer 3"]
    
    fileprivate var selectedCountry = CMUtility.dynamicPageLoad!.defaultCountry
    fileprivate var selectedState = CMUtility.dynamicPageLoad!.defaultState
    fileprivate var selectedField:ApolloTextInputField?
    
    var stateArr=[String]()
    var countryArr=[String]()
    
    lazy fileprivate var countrySelectionPicker: CMPickerView! = {
        
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.tbleView.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = formatDataArray(givenArray: CMUtility.dynamicPageLoad!.countryList!)
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var stateSelectionPicker: CMPickerView! = {
        
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.tbleView.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = formatDataArray(givenArray: CMUtility.dynamicPageLoad!.stateList!)
        pickerView.viewDelegate = self
        return pickerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Security Questions"
        self.tbleView.estimatedRowHeight = 44.0;
        self.tbleView.rowHeight = UITableView.automaticDimension;
        
        print("CMUtility.dynamicPageLoad!.countryList! = \(CMUtility.dynamicPageLoad!.countryList!)")
        print("CMUtility.dynamicPageLoad!.stateList! = \(CMUtility.dynamicPageLoad!.stateList!)")
        
        // Reload the table
        self.tbleView.reloadData()
        
//        formatDataArray()
    }
    
    func formatDataArray(givenArray:[String]) -> [String]{
        let z = givenArray.map { $0.copy() } as? [String]
        var arr = [String]()
        for question in z! {
            var array  = question.components(separatedBy: "~")
            arr.append(array[0])
        }        
        return arr
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let configurator = UpdateAddressConfigurator()
        configurator.build(viewController: self)
        interactor = configurator.interactor
        router = configurator.router
    }
        
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        
        var cell: UITableViewCell?
        print("indexPath.row = \(indexPath.row)")
        
        switch indexPath.row {
        case 0:
            if let addressCell = tableView.dequeueReusableCell(withIdentifier: "\(InputFieldTableViewCell.self)") as? InputFieldTableViewCell {
                cell = addressCell
                addressCell.textField.placeholder = "Address Line 1"
            }
        case 1:
            if let addressCell = tableView.dequeueReusableCell(withIdentifier: "\(InputFieldTableViewCell.self)") as? InputFieldTableViewCell {
                cell = addressCell
                addressCell.textField.placeholder = "Address Line 2"
            }
        case 2:
            if let countryCell = tableView.dequeueReusableCell(withIdentifier: "\(CountryCell.self)") as? CountryCell {
                countryCell.delegate = self
                cell = countryCell
                countryCell.countryTextField.placeholder = "Country"
                countryCell.countryTextField.text = selectedCountry
            }
        case 3:
            if let cityStateCell = tableView.dequeueReusableCell(withIdentifier: "\(CityStateTableViewCell.self)") as? CityStateTableViewCell {
                cityStateCell.delegate = self
                cell = cityStateCell
                cityStateCell.cityTextField.placeholder = "City"
                cityStateCell.stateTextField.placeholder = "State"
                cityStateCell.stateTextField.text = selectedState
            }
        case 4:
            if let zipCell = tableView.dequeueReusableCell(withIdentifier: "\(InputFieldTableViewCell.self)") as? InputFieldTableViewCell {
                cell = zipCell
                zipCell.textField.placeholder = "Zip Code"
            }
        default:
            if let saveSkipCell = tableView.dequeueReusableCell(withIdentifier: "\(SaveSkipCell.self)") as? SaveSkipCell {
                saveSkipCell.delegate = self
                cell = saveSkipCell
            }
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //        return UITableView.automaticDimension
        return 85
        
//            return 72
    }
    
    @IBAction func backClicked(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension UpdateAddressViewController: SaveSkipCellDelegate {
    
    func saveClicked() {
        
        print("\(#function)")
        
        if let storyboard = self.storyboard {
            let homeVC = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
    
    func skipClicked() {
        
        print("\(#function)")
    }
        
}

extension UpdateAddressViewController: IUpdateAddressViewable {
    
    func updateSuccess(viewModel: UpdateAddressModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func updateFailed(viewModel: UpdateAddressModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension UpdateAddressViewController: IRoutable {
    func showMessage(message: String) {
        DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: message), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: message)
    }
    
    func popCurrent() {
        // dismiss current viewcontroller like back action
    }
}

extension UpdateAddressViewController: CMPickerViewDelegate {
    
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

extension UpdateAddressViewController: CountryCellDelegate {
    
    func countrySelected(countryField: ApolloTextInputField?) {
        if self.countrySelectionPicker.pickerArray.count == 0 {
            self.countrySelectionPicker.pickerArray = formatDataArray(givenArray: CMUtility.dynamicPageLoad!.countryList!)
        }
        selectedField = countryField
        if view.subviews.contains(self.countrySelectionPicker){
            self.countrySelectionPicker.isHidden = false
        } else {
            self.view.addSubview(countrySelectionPicker)
        }
    }
}

extension UpdateAddressViewController: CityStateDelegate {
    
    func stateSelected(stateField: ApolloTextInputField?) {
        if self.stateSelectionPicker.pickerArray.count == 0 {
            self.stateSelectionPicker.pickerArray = formatDataArray(givenArray: CMUtility.dynamicPageLoad!.stateList!)
        }
        selectedField = stateField
        if view.subviews.contains(self.stateSelectionPicker){
            self.stateSelectionPicker.isHidden = false
        } else {
            self.view.addSubview(stateSelectionPicker)
        }
    }
}

