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
            height = 30
        case 12:
            height = 250
        default:
            height = 72
        }
        
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        
        switch indexPath.row {
            
        case 0:
            cellIdentifier = "personalInfoCell"
        case 5:
            cellIdentifier = "cityStateCell"
        case 6:
            cellIdentifier = "countryZipCodeCell"
        case 7:
            cellIdentifier = "contactInfoCell"
        case 12:
            cellIdentifier = "alertSettingsCell"
        default:
            cellIdentifier = "defaultCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        return cell!
    }
    
}
