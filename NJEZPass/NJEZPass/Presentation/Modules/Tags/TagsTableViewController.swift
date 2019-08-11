//
//  TagsTableViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 01/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class TagsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "Tags"
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 94
        switch indexPath.row
        {
        case 0:
            height = 190
        case 1:
            height = 94
        case 2:
            height = 66
        case 3:
            height = 66
        default:
            height = 94
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
        return 4
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        if indexPath.row == 2 {
    //            return 190
    //        }
    //        return 361
    //    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        
        switch indexPath.row
        {
        case 0:
            cellIdentifier = "TagsDescriptionCell"
        case 1:
            cellIdentifier = "TagsData"
        case 2:
            cellIdentifier = "ActivateTagCell"
        case 3:
            cellIdentifier = "RequestTagCell"
        default:
            cellIdentifier = "RequestTagCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        return cell!
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
