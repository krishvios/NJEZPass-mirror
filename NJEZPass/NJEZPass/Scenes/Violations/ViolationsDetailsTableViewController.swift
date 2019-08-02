//
//  ViolationsDetailsTableViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 01/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class ViolationsDetailsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "T22267061-1"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 94
        
        
         switch indexPath.row {
         
         case 0:
         height = 158
         case 1,10:
            height = 56
         case 2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21:
         height = 42
//         case 22,23:
//            height = 44
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
        return 24
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        if indexPath.row == 2 {
    //            return 190
    //        }
    //        return 361
    //    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = "ViolationData"
        
         switch indexPath.row
         {
            case 0:
                cellIdentifier = "AmountDisplayCell"
            case 1,10:
                cellIdentifier = "HeaderCell"
            case 2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21:
                cellIdentifier = "DisplayLabelCell"
            case 22:
                cellIdentifier = "SaveButtonCell"
            case 23:
                cellIdentifier = "DisputeButtonCell"
            default:
                cellIdentifier = "SaveButtonCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        /*
        switch indexPath.row
        {
        case 0:
            cellIdentifier = "AmountDisplayCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        case 1:
            cellIdentifier = "HeaderCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? HeaderCell
        case 10:
            cellIdentifier = "HeaderCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? HeaderCell
        case 2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21:
            cellIdentifier = "DisplayLabelCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? HeaderCell
        case 22:
            cellIdentifier = "SaveButtonCell"
        case 23:
            cellIdentifier = "DisputeButtonCell"
        default:
            cellIdentifier = "SaveButtonCell"
        }
     */
        
        if (indexPath.row >= 2 && indexPath.row <= 9) || (indexPath.row >= 11 && indexPath.row <= 21)
        {
            let displayLabelCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? DisplayLabelCell
            /*
            displayLabelCell?.nameLabel.text = ""
            displayLabelCell?.valueLabel.text = ""
            */
            return displayLabelCell!
        }
        
        return cell!
    }
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
