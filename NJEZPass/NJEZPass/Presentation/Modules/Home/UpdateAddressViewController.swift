//
//  UpdateAddressViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 20/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class UpdateAddressViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {
        
        @IBOutlet weak var tbleView: UITableView!
        var securityQuestions = ["Security Question 1","Security Question 2","Security Question 3"]
        var securityQAnswers = ["Security Answer 1","Security Answer 2","Security Answer 3"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            self.navigationItem.title = "Security Questions"
            self.tbleView.estimatedRowHeight = 44.0;
            self.tbleView.rowHeight = UITableView.automaticDimension;
            
            // Reload the table
            self.tbleView.reloadData()
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
                    cell = countryCell
                    countryCell.countryTextField.placeholder = "Country"
                }
            case 3:
                if let cityStateCell = tableView.dequeueReusableCell(withIdentifier: "\(CityStateTableViewCell.self)") as? CityStateTableViewCell {
                    cell = cityStateCell
                    cityStateCell.cityTextField.placeholder = "City"
                    cityStateCell.stateTextField.placeholder = "State"
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

