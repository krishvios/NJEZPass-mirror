//
//  EditProfileViewController.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 01/08/19.
//  Copyright © 2019 Anshu Sharma. All rights reserved.
//

import UIKit
import Apollo_iOS

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var personalInfoPlaceholderArr = ["First Name", "Last Name", "Address Line 1", "Address Line 2"]
    var contactInfoPlaceholderArr = ["Email", "Daytime Phone", "Evening Phone", "Cell Phone"]
    
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
            height = 250
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
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        case 6:
            cellIdentifier = "countryZipCodeCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        case 7:
            cellIdentifier = "contactInfoCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        case 12:
            cellIdentifier = "alertSettingsCell"
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
