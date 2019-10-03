//
//  SettingTableViewController.swift
//  NJEZPass
//
//  Created by Alam, Sk on 01/10/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {

    enum SettingListOption:Int {
        case changePassword
        case digitPin
        case securityQuestions
        case notification
        case commPrefernce
        case twoFactorAuth
        case bioMetrics
        case closeAccount
        
        var textString : String {
            get {
                switch self {
                case .changePassword: return "Change Password"
                case .digitPin: return "4-Digit PIN"
                case .securityQuestions: return "Security Questions"
                case .notification:return "Notifications & Alerts"
                case .commPrefernce:return "Communication Preferences"
                case .twoFactorAuth:return "Two-Factor Authentication"
                case .bioMetrics:return "Biometrics"
                case .closeAccount:return "Close My Account"

                    
                }
            }
        }
    }
    
    var arrSettingList =  [SettingListOption.changePassword,SettingListOption.digitPin,SettingListOption.securityQuestions,SettingListOption.notification,SettingListOption.commPrefernce,SettingListOption.twoFactorAuth,SettingListOption.bioMetrics,SettingListOption.closeAccount]

    
    
    override func viewWillAppear(_ animated: Bool) {
        self.showNavBarWith(title: "Setting")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        let nib = UINib(nibName: String(describing: LabelTableViewCell.self), bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: String(describing: LabelTableViewCell.self))

    }
    
   
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrSettingList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell
        
        // let optionName = "\(arrMoreList[indexPath.row])"   // or `let cityName = String(city)`
        
        cell.cellLabel.text = arrSettingList[indexPath.row].textString
        // Configure the cell...
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let didSelectedIndex = SettingListOption(rawValue: indexPath.row) else{
            return
        }
        
        switch didSelectedIndex {
            
        case .changePassword: break
        case .digitPin:break
        case .securityQuestions: break
        case .notification:break
        case .commPrefernce:break
        case .twoFactorAuth:break
        case .bioMetrics:break
        case .closeAccount:break
            
            
            
        }
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

class CustomNavigationController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = UIColor(red: 81 / 255, green: 155 / 255, blue: 22 / 255, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
        
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    private func imageView(imageName: String) -> UIImageView {
        let logo = UIImage(named: imageName)
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = logo
        logoImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return logoImageView
    }
    
    func barImageView(imageName: String) -> UIBarButtonItem {
        return UIBarButtonItem(customView: imageView(imageName: imageName))
    }
    
    func barButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 58, height: 58)
        button.widthAnchor.constraint(equalToConstant: 58).isActive = true
        button.heightAnchor.constraint(equalToConstant: 58).isActive = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
}

