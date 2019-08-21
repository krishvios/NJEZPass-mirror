//
//  LandingViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 05/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UserNavigationCellDelegate, CMPickerViewDelegate /*, UIPickerViewDataSource, UIPickerViewDelegate*/ {
    
    @IBOutlet weak var tbleView: UITableView!
    
    private var navigationCell:UserNavigationCell?
    private var tempText = ""
    
    lazy var cmPickerView: CMPickerView! = {
        
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.view.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["English","Spanish"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
 
    func doneClicked(selectedString:String) {
        self.cmPickerView.isHidden = true
        navigationCell?.selectLanguageButton.setTitle(selectedString, for: .normal)
    }
    
    func cancelClicked() {
        tempText = ""
        self.cmPickerView.isHidden = true
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 84
        
        switch indexPath.row {
        case 0:
            height = 427
        case 1:
            height = 84
        case 2:
            height = 173
        case 3:
            height = 115
        case 4:
            height = 173
        default:
            height = 84
        }
        
        return CGFloat(height)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = "NavigationCell"
        
        switch indexPath.row
        {
        case 0:
            cellIdentifier = "NavigationCell"
            navigationCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? UserNavigationCell
            navigationCell?.delegate = self
            return navigationCell!
        case 1:
            cellIdentifier = "PayTollsCell"
        case 2:
            cellIdentifier = "NewsRoomCell"
        case 3:
            cellIdentifier = "ViewTollFacilitiesCell"
        case 4:
            cellIdentifier = "TravelToolsCell"
        default:
            cellIdentifier = "TravelToolsCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }
    
    // MARK: - UserNavigationCellDelegate methods

    func navigateToSignUp() {
        
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func navigateToLogin() {
        
        let storyboard = UIStoryboard(name: "UserFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "viewLogin")
        self.present(vc, animated: false, completion: nil)
    }
    
    func selectLanguageClicked(_ sender: Any) {
        
        if view.subviews.contains(self.cmPickerView){
            self.cmPickerView.isHidden = false
        } else {
            self.view.addSubview(cmPickerView)
        }
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
