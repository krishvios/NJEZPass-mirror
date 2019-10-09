//
//  DashboardViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 17/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities



class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!
    private var tabWidgetCell:TabWidgetTableViewCell?
    private var headerCell:headerTableViewCell?
    private var paymentInfoCell:PaymentInfoTableViewCell?
    private var transactionCell:RecentTransactionsCell?
    var detailInfo: ProfileModel.AccountDetail?
    var transactionDetails:[Any] = []
    var selectedRow = 0
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
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(#function)")
        print("firstTimeUser = \(firstTimeUser)")

        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
            let detailInfoData = delegate.detailInfo  else {
                return
        }
       
        detailInfo = detailInfoData
        transactionDetails = detailInfo!.tollTxList!
        tbleView.reloadData()
        
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
        print("\(#function)")
        print("firstTimeUser = \(firstTimeUser)")

//        if firstTimeUser == false {
//            if nixieFlag == true {
//                updateAddressAlert.addAction(updateAddressActionButton)
//                self.present(updateAddressAlert, animated: true, completion: nil)
//                nixieFlag = false
//            }
//        }
//        if firstTimeUser == true {
//            firstTimeUser = false
//        }
        setupTableView()
    }
        
    func setupTableView() {
        tbleView.estimatedRowHeight = 100
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
        
        tbleView.dataSource = self
        tbleView.delegate = self
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 1:
            return 208
        case 2:
            return 58
        case 3,4,5:
            return 82
        case 6:
            return 193
        case 7:
            return 85
        default:
             return 270
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        
        
        switch indexPath.row {
            
        case 0:
            cellIdentifier = "HomeHeaderCell"
            headerCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? headerTableViewCell
            headerCell?.headerCellDelegate = self
            headerCell?.welocmeMsg.text = "Welcome \(detailInfo?.username ?? "")"
            headerCell?.amountLbl.text = "$\(detailInfo?.currentBalance ?? "")"
            return headerCell!
        case 1:
            cellIdentifier = "paymentSummaryCell"
            paymentInfoCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? PaymentInfoTableViewCell
            paymentInfoCell?.lastReplenismentDateLbl.text = detailInfo?.lastReplenishedDate
            paymentInfoCell?.replenishmentAmtLbl.text = detailInfo?.replenishedAmount
            paymentInfoCell?.replenishmentThersholdLbl.text = detailInfo?.replenishedThreshold
            return paymentInfoCell!
        case 2:
            cellIdentifier = "TransactionCell"
            transactionCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? RecentTransactionsCell
            transactionCell?.recentTransactionDelegate = self
            return transactionCell!
        case 3,4,5:
           cellIdentifier = "RecentTransactionCell"
           transactionCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? RecentTransactionsCell
           if transactionDetails.count > 0
           {
            let transactionDic = transactionDetails[indexPath.row - 3] as? ProfileModel.TollTxList
            transactionCell?.transactionExitPlaza.text = transactionDic?.exitPlaza
            transactionCell?.transactionAmount.text = transactionDic?.amount
            transactionCell?.transactionTime.text = transactionDic?.transactionTime
            transactionCell?.amount.text = "-"
            return transactionCell!
            }
            
        case 6:
            cellIdentifier = "NewsRoom"
        case 7:
            cellIdentifier = "Widget"
            tabWidgetCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TabWidgetTableViewCell
            tabWidgetCell?.tabWidgetDelegate = self
            return tabWidgetCell!
        default:
            cellIdentifier = "TransactionCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 {
            selectedRow = indexPath.row
            self.performSegue(withIdentifier: "showRecentDetails", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "showRecentDetails" {
            if(selectedRow-3 <= transactionDetails.count && transactionDetails.count>0) {
                let nextScene =  segue.destination as! TransactionsDetailsVC
                nextScene.transactionDetails = (transactionDetails[selectedRow-3] as? ProfileModel.TollTxList)
            }
        }
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

extension DashboardViewController: RecentTransactionsCellDelegate {
    func viewAllTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
    }
}
extension DashboardViewController:headerCellDelegate {
    func increaseBalanceTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showIncreaseBalance", sender: nil)
    }
}
