//
//  TagsTableViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 01/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

enum RequestFlow: String {
    case requestTagFlow
    case requestTagSuppliesFlow
}

class RequestTagVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var requestTagTableView: UITableView!
    fileprivate var selectedFieldText = ""
    fileprivate var selectedField:ApolloTextInputField?
    fileprivate var selectedLbl:UILabel?
    fileprivate var selectedString:String?
    
    var requestFlowStr = ""
    
    lazy fileprivate var quantitySelection: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["1","2"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var tagMountedSelection: CMPickerView! = {
        let pickerView1 = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView1.pickerArray = ["Interior"]
        pickerView1.viewDelegate = self
        return pickerView1
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
    
    lazy fileprivate var readPreventionBag: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["1","2"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    lazy fileprivate var stripSets: CMPickerView! = {
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["1 Pair","2 Pairs"]
        pickerView.viewDelegate = self
        return pickerView
    }()
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        switch requestFlowStr {
        case RequestFlow.requestTagFlow.rawValue:
             //self.showNavBarWith(title: "Request Tags")
            navBar.topItem?.title = "Request Tags"
        case RequestFlow.requestTagSuppliesFlow.rawValue:
           // self.showNavBarWith(title: "Request Supplies")
            navBar.topItem?.title = "Request Supplies"

            requestTagTableView.isScrollEnabled = false
        default:
            navBar.topItem?.title = " "
        }
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
        var cellIdentifier = "Empty"
        switch indexPath.row {
        case 1:
             cellIdentifier = "Empty"
        default:
            switch requestFlowStr {
            case RequestFlow.requestTagFlow.rawValue:
               cellIdentifier = "RequestTagCell"
               let cell : RequestTagsCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RequestTagsCell
               cell.requestDelegate = self
               return cell
            case RequestFlow.requestTagSuppliesFlow.rawValue:
                cellIdentifier = "RequestTagSuppliesCell"
                let cell : RequestSuppliesCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RequestSuppliesCell
                cell.requestDelegate  = self
                return cell
            default:
                let cell  = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
                return cell!
            }
        }
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSummary" {
            let nextVc = segue.destination as! SignupAndSaveVC
            nextVc.flowString = "requestTag"
        }
    }
}

extension RequestTagVC : RequestTagsAdelegate {
    func continueButtonTapped(_ sender: Any) {
        switch requestFlowStr {
        case RequestFlow.requestTagFlow.rawValue:
              self.performSegue(withIdentifier: "showRequestTagSummary", sender: nil)
        case RequestFlow.requestTagSuppliesFlow.rawValue:
              self.performSegue(withIdentifier: "showSummary", sender: self)
        default:
            navBar.topItem?.title = " "
        }
      
    }
    
    func tagMountTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        //  self.tagMountedSelection.pickerArray = ["1", "2"]
        hidePicker()
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
        hidePicker()
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
        hidePicker()
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
    
    func hidePicker() {
        if !self.tagMountedSelection.isHidden {
            if selectedField?.text?.count == 0 {
                selectedLbl?.isHidden = true
                selectedField?.placeholder = selectedString
            }
        }
        self.stripSets.isHidden = true
        self.readPreventionBag.isHidden = true
        self.vehicleTypeSelection.isHidden = true
        self.quantitySelection.isHidden = true
        self.tagMountedSelection.isHidden = true
        self.planNameSelection.isHidden = true
    }
    
    func planeNumberTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        hidePicker()
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


extension RequestTagVC : RequestSuppliesdelegate {
    func readPreventionBagTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        hidePicker()
        selectedFieldText = self.readPreventionBag.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.readPreventionBag){
            self.readPreventionBag.isHidden = false
        } else {
            self.view.addSubview(readPreventionBag)
        }
    }
    
    func AdhesiveStripSetsTapped(_ textField: ApolloTextInputField, placeHolder: String, lable: UILabel) {
        hidePicker()
        selectedFieldText = self.stripSets.pickerArray[0]
        selectedField = textField
        selectedLbl = lable
        selectedString = placeHolder
        if view.subviews.contains(self.stripSets){
            self.stripSets.isHidden = false
        } else {
            self.view.addSubview(stripSets)
        }
    }
}

extension RequestTagVC: CMPickerViewDelegate {
    
    func doneClicked(selectedString:String) {
        selectedField?.becomeFirstResponder()
        selectedField?.text = selectedString
        if selectedString.count == 0 {
            selectedLbl?.isHidden = false
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
