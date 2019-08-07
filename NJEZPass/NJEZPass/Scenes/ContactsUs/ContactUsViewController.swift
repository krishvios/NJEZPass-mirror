//
//  ContactUsViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 02/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class ContactUsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "Contact Us"
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 94
        
        switch indexPath.row {
            case 0:
                height = 284
            case 1:
                height = 72
            case 2:
                height = 72
            case 3:
                height = 72
            case 4:
                height = 72
            default:
                height = 72
        }
        
        return CGFloat(height)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = "DescriptionCell"
        
        switch indexPath.row
        {
            case 0:
                cellIdentifier = "DescriptionCell"
            case 1:
                cellIdentifier = "SelectButtonCell"
            case 2:
                cellIdentifier = "InputTextFieldCell"
            case 3:
                cellIdentifier = "InputTextFieldCell"
            case 4:
                cellIdentifier = "SaveButtonCell"
            default:
                cellIdentifier = "SaveButtonCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        return cell!
    }
    

}
