//
//  TagsTableViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 01/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class RequestTagSuppliesVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var requestTagTableView: UITableView!
    fileprivate var selectedFieldText = ""
    fileprivate var selectedField:ApolloTextInputField?
    fileprivate var selectedLbl:UILabel?
    fileprivate var selectedString:String?
    
    lazy fileprivate var quantitySelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["1","2"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var tagMountedSelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["Interior"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var vehicleTypeSelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["Auto","Suv"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var planNameSelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["commuter Bridge Plan","NYSB"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.showNavBarWith(title: "Request Tag", backAction: nil)
    }
    
    func setupTableView() {
        requestTagTableView.estimatedRowHeight = 100
        requestTagTableView.rowHeight = UITableView.automaticDimension
        requestTagTableView.keyboardDismissMode = .onDrag
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 300
        }
        return CGFloat(355)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = "TagMountTypeandQuantityCell"
        switch indexPath.row {
        case 1:
            cellIdentifier = "Empty"
        default:
            let cell : RequestTagsCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RequestTagsCell
            cell.requestDelegate = self
            return cell
        }
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension RequestTagSuppliesVC : RequestTagsAdelegate {
    func continueButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "requestTagSummary", sender: nil)
    }
    
    func tagMountTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        //  self.tagMountedSelection.pickerArray = ["1", "2"]
        selectedFieldText = self.tagMountedSelection.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.tagMountedSelection){
            self.tagMountedSelection.isHidden = false
        } else {
            self.view.addSubview(tagMountedSelection)
        }
    }
    
    func quantityTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        selectedFieldText = self.quantitySelection.pickerArray[0]
        if view.subviews.contains(self.quantitySelection){
            self.quantitySelection.isHidden = false
        } else {
            self.view.addSubview(quantitySelection)
        }
    }
    
    func vehicleTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
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
    
    func planeNumberTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        selectedFieldText = self.planNameSelection.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.planNameSelection){
            self.planNameSelection.isHidden = false
        } else {
            self.view.addSubview(planNameSelection)
        }
    }
}

extension RequestTagSuppliesVC: CMPickerViewDelegate {
    func doneClicked(selectedString:String) {
        selectedField?.becomeFirstResponder()
        selectedField?.text = selectedString
        if selectedString.count == 0 {
            selectedField?.text = selectedFieldText
        }
        selectedField?.resignFirstResponder()
        self.quantitySelection.isHidden = true
        self.tagMountedSelection.isHidden = true
        self.vehicleTypeSelection.isHidden = true
        self.planNameSelection.isHidden = true
    }
    
    func cancelClicked() {
        if selectedField?.text?.count == 0 {
            selectedLbl?.isHidden = true
            selectedField?.placeholder = selectedString
        }
        self.quantitySelection.isHidden = true
        self.tagMountedSelection.isHidden = true
        self.vehicleTypeSelection.isHidden = true
        self.planNameSelection.isHidden = true
    }
}
