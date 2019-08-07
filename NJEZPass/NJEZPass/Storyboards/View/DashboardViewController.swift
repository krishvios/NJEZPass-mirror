//
//  DashboardViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 17/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import SideMenu

class DashboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
        updateMenus()
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
