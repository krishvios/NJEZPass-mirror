//
//  SideMenuTableViewController.swift
//  SideMenu
//  Created by N, Narasimhulu on 02/08/19.
//  Copyright © 2019 Conduent. All rights reserved.


import Foundation
import SideMenu

class SideMenuTableViewController: UITableViewController {
    
    let viewModel = SideMenuViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        tableView.backgroundColor = .white
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        if let sideMenuCell = tableView.dequeueReusableCell(withIdentifier: "\(SideMenuCell.self)") as? SideMenuCell {
            sideMenuCell.menuTitle.text = viewModel.menuItem(with: indexPath.row)

            cell = sideMenuCell
        }
        return cell ?? UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell: SideMenuCell = tableView.cellForRow(at: indexPath) as! SideMenuCell
        selectedCell.contentView.backgroundColor = UIColor(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        selectedCell.selectedView.backgroundColor = UIColor(red: 105/255.0, green: 32/255.0, blue: 126/255.0, alpha: 1.0)
       
        
        if indexPath.row == 8 {
            let actionSheetController = UIAlertController(title: "", message: "Are you sure you want to log out of the app?", preferredStyle: .actionSheet)
            
            guard let delegate = UIApplication.shared.delegate as? AppDelegate  else {
                return
            }
            
            let signOutActionButton = UIAlertAction(title: "Log Out", style: .default) { action in
                let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController
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
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedCell: SideMenuCell = tableView.cellForRow(at: indexPath) as! SideMenuCell
        selectedCell.contentView.backgroundColor = .white
        selectedCell.selectedView.backgroundColor = .white
    }
    
}
