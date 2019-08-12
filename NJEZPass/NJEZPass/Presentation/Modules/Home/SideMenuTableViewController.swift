//
//  SideMenuTableViewController.swift
//  SideMenu
//  Created by N, Narasimhulu on 02/08/19.
//  Copyright © 2019 Conduent. All rights reserved.


import Foundation
import SideMenu

class SideMenuTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // refresh cell blur effect in case it changed
        tableView.reloadData()
        
        guard let menu = navigationController as? UISideMenuNavigationController, menu.blurEffectStyle == nil else {
            return
        }
        tableView.backgroundColor = .white
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath) as! UITableViewVibrantCell

        if let menu = navigationController as? UISideMenuNavigationController {
            cell.blurEffectStyle = menu.blurEffectStyle
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.05)
        
        if indexPath.row == 8 {
            let actionSheetController = UIAlertController(title: "", message: "Are you sure you want to log out of the app?", preferredStyle: .actionSheet)
            
            guard let delegate = UIApplication.shared.delegate as? AppDelegate  else {
                return
            }
            
            let signOutActionButton = UIAlertAction(title: "Log Out", style: .default) { action in
                let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "LandingViewControllercvbcxzsdrtyutrdsa") as! LandingViewController
                delegate.window?.rootViewController = UINavigationController(rootViewController: vc)
                
            }
            actionSheetController.addAction(signOutActionButton)
            let cancelActionButton = UIAlertAction(title: "Cancel", style: .destructive) { action -> Void in
                actionSheetController.view.tintColor = UIColor.red
            }
            actionSheetController.addAction(cancelActionButton)
            
            self.present(actionSheetController, animated: true, completion: nil)
        }
    }
    
}
