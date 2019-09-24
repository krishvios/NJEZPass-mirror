//
//  DashboardViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 17/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit



class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!
    private var tabWidgetCell:TabWidgetTableViewCell?
    private var headerCell:headerTableViewCell?
    private var paymentInfoCell:PaymentInfoTableViewCell?
    
    var nixieFlag = true
    var firstTimeUser = true
    
    private lazy var updateAddressAlert:UIAlertController! = {
        let alert = UIAlertController(title: "Update Address", message: "Please update the mailing address linked to your account.", preferredStyle:.alert)
        return alert
    }()
    
    private lazy var updateAddressActionButton:UIAlertAction! = {
        
        let actionButtonn = UIAlertAction(title: "Update", style: .default) { action in
            
            if let storyboard = self.storyboard {
                let vc = storyboard.instantiateViewController(withIdentifier: "UpdateAddressViewController") as! UpdateAddressViewController
                self.present(vc, animated: true, completion: nil)
            }
        }
        return actionButtonn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if firstTimeUser == true {
            if let storyboard = self.storyboard {
                let vc = storyboard.instantiateViewController(withIdentifier: "QuestionsViewController") as! QuestionsViewController
                self.present(vc, animated: true, completion: nil)
            }
            
            firstTimeUser = false
        }        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if firstTimeUser == false {
            if nixieFlag == true {
                updateAddressAlert.addAction(updateAddressActionButton)
                self.present(updateAddressAlert, animated: true, completion: nil)
                nixieFlag = false
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if firstTimeUser == false {
            if nixieFlag == true {
                updateAddressAlert.addAction(updateAddressActionButton)
                self.present(updateAddressAlert, animated: true, completion: nil)
                nixieFlag = false
            }
        }
        setupTableView()
    }
        
    func setupTableView(){
        //        let nib = UINib(nibName: String(describing: ButtonTableViewCell.self), bundle: nil)
        //        tbleView.register(nib, forCellReuseIdentifier: String(describing: ButtonTableViewCell.self))
        tbleView.estimatedRowHeight = 100
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
        
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 88
        }
        if indexPath.row == 1 {
            return 295
        }
        if indexPath.row == 3 {
            return 230
        }
        if indexPath.row == 4{
            return 85
        }
        return 295
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        
        switch indexPath.row {
            
        case 0:
            cellIdentifier = "HomeHeaderCell"
            headerCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? headerTableViewCell
            return headerCell!
            
        case 1:
            cellIdentifier = "paymentSummaryCell"
            paymentInfoCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? PaymentInfoTableViewCell
            return paymentInfoCell!
            
        case 4:
            cellIdentifier = "Widget"
            tabWidgetCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TabWidgetTableViewCell
            tabWidgetCell?.tabWidgetDelegate = self
            return tabWidgetCell!
        case 3:
            cellIdentifier = "NewsRoom"
        default:
            cellIdentifier = "TransactionCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        return cell!
    }
    
}

extension DashboardViewController: TabWidgetCelldelegate {
    
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
