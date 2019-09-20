//
//  LandingVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 20/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform
import Apollo_iOS
import MBProgressHUD
import KeychainAccess


class LandingVC:  UIViewController, UITableViewDelegate, UITableViewDataSource,LoginMethodsCellDelegate,MoreContentCellDelegate,TabWidgetCelldelegate {
    
    @IBOutlet weak var tbleView: UITableView!
    var interactor: ILoginInteractable?
    var router: IRouter?
    private var loginMethodcell:LoginMethodsTableViewCell?
    private var moreContentcell:MoreContentTableViewCell?
    private var tabWidgetCell:TabWidgetTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView(){
        tbleView.estimatedRowHeight = 2
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
        tbleView.bounces = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 172
        }
        if indexPath.row == 1{
            return 347
        }
        if indexPath.row == 2 {
            return 222
        }
        
        if indexPath.row == 3 {
            return 230
        }
        if indexPath.row == 4{
            return 85
        }
        return 355
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        
        switch indexPath.row {
            
        case 0:
            cellIdentifier = "LoginBackGround"
        case 1:
            cellIdentifier = "LoginMethods"
            
            loginMethodcell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? LoginMethodsTableViewCell
            loginMethodcell?.loginDelegate = self
            return loginMethodcell!
            
        case 2:
            cellIdentifier = "MoreContents"
            moreContentcell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MoreContentTableViewCell
            moreContentcell?.moreContentsDelegate = self
            return moreContentcell!
        case 4:
            cellIdentifier = "Widget"
            tabWidgetCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TabWidgetTableViewCell
            tabWidgetCell?.tabWidgetDelegate = self
            return tabWidgetCell!
        default:
            cellIdentifier = "NewsRoom"
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        return cell!
    }
    
    //Login delegate methods
    func loginClicked(_ sender: Any) {
        
    }
    
    func signinClicked(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func forgotPasswordClicked(_ sender: Any) {
        //        let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
        //        let forgotPasswordVC = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        //        self.navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
    func forgotUserNameCllicked(_ sender: Any) {
        
    }
    func fingerPrintCllicked(_ sender: Any) {
        
    }
    //MoreContents delegate methods
    func payViolationorTollBillClicked(_ sender: Any) {
        
    }
    func registerAccountClicked(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    //TabWidget Delegate methods
    func tollFacilitesClicked(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    func travelToolsClicked(_ sender: Any) {
        guard let url = URL(string: "http://www.google.com") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    func websiteClicked(_ sender: Any) {
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

