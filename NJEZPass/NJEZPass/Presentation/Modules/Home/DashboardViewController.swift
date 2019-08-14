//
//  DashboardViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 17/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import SideMenu

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
        updateMenus()
        setupTableView()
    }
    
    @IBAction func saveAccount(_ sender: Any) {
        
    }
    
    func setupTableView(){
        //        let nib = UINib(nibName: String(describing: ButtonTableViewCell.self), bundle: nil)
        //        tbleView.register(nib, forCellReuseIdentifier: String(describing: ButtonTableViewCell.self))
        tbleView.estimatedRowHeight = 194
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
        
    }
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 94
        
        /*
         switch indexPath.row {
         
         case 0:
         height = 44
         case 1,2,3,4:
         height = 72
         case 5:
         height = 174
         default:
         height = 44
         }
         */
        switch indexPath.row {
            
        case 0:
            height = 427
//        case 1:
//            height = 84
        case 1:
            height = 173
        case 2:
            height = 115
        case 3:
            height = 173
        default:
            height = 173
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        if indexPath.row == 2 {
    //            return 190
    //        }
    //        return 361
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = "ViolationData"
        switch indexPath.row {
         
            case 0:
            cellIdentifier = "ProfileNavigationCell"
            
            if let profileNavigationCell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileNavigationCell.self)") as? ProfileNavigationCell {
                
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                if let balance = appDelegate!.detailInfo?.financialInformation?.violationBalance {
                    profileNavigationCell.violationsBalance.text =  "$ \(balance)"
                }
                if let balance = appDelegate!.detailInfo?.financialInformation?.currentBalance {
                    profileNavigationCell.availableBalance.text =  "$ \(balance)"
                }
                return profileNavigationCell
            }
            
            case 1:
            cellIdentifier = "NewsRoomCell"
            case 2:
            cellIdentifier = "ViewTollFacilitiesCell"
            case 3:
            cellIdentifier = "TravelToolsCell"
            default:
            cellIdentifier = "TravelToolsCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        return cell!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sideMenuNavigationController = segue.destination as? UISideMenuNavigationController else { return }
        sideMenuNavigationController.settings = makeSettings()
    }
    
    private func setupSideMenu() {
        // Define the menus
        SideMenuManager.default.leftMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
        SideMenuManager.default.addPanGestureToPresent(toView: navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
    }

    
    private func updateMenus() {
        let settings = makeSettings()
        SideMenuManager.default.leftMenuNavigationController?.settings = settings
    }
 
    private func makeSettings() -> SideMenuSettings {
        var settings = SideMenuSettings()
        settings.presentationStyle = .menuSlideIn
        settings.menuWidth = self.view.frame.width * 0.75
        settings.statusBarEndAlpha = 0
        
        return settings
    }
}
