//
//  PayNowVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 24/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

enum balanceIncreaseFlow: String {
    case balanceIncrease
}

class PayNowVC: UIViewController {
    
    
    @IBOutlet weak var progressImage: UIImageView!
    var flowString = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch flowString {
        case balanceIncreaseFlow.balanceIncrease.rawValue:
            progressImage.isHidden = true
            self.title = "Payment Summary"
        default:
            progressImage.isHidden = false
        }
    }
    @IBAction func backButtonTapped(_ sender: Any) {
             self.navigationController?.popViewController(animated: true)
    }
}

extension PayNowVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 0
        switch indexPath.row
        {
        case 0:
            height = 98
        default:
            height = 57
        }
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        
        switch indexPath.row
        {
        case 0:
            cellIdentifier = "CardDetailsCell"
        case 1:
            cellIdentifier = "PayNowButtonCell"
        default:
            cellIdentifier = "CancelButtonCell"
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if let payNowButtonCell = cell as? PayNowTableViewCell{
            payNowButtonCell.delegate = self
        }
        if let payNowButtonCell = cell as? CancelButtonTableViewCell{
            payNowButtonCell.delegate = self
        }
        return cell!
    }
    
}

extension PayNowVC: PayNowTableViewCellDelegate {
    func payNowButtonClicked() {
        switch flowString {
        case balanceIncreaseFlow.balanceIncrease.rawValue:
            let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
            let confirmVC = storyBoard.instantiateViewController(withIdentifier: "SignupAndSaveVC") as! SignupAndSaveVC
            confirmVC.flowString = "balanceIncreaseFlow"
            self.navigationController?.pushViewController(confirmVC, animated: true)
        default:
            let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
            let confirmVC = storyBoard.instantiateViewController(withIdentifier: "SignupAndSaveVC") as! SignupAndSaveVC
            confirmVC.flowString = "payNowFlow"
            self.navigationController?.pushViewController(confirmVC, animated: true)
        }
    }
}

extension PayNowVC: CancelButtonTableViewCellDelegate {
    func cancelButtonClicked() {
        
        switch flowString {
        case balanceIncreaseFlow.balanceIncrease.rawValue:
            navigationController?.viewControllers.removeAll(where :{
                (vc) -> Bool in if  vc.isKind(of: PayNowVC.self) || vc.isKind(of: PaymentAmountVC.self){
                    return true
                }
                return false
            })
        default:
            if let payViolationVC = navigationController!.viewControllers.filter({ $0 is PayViolationVC }).first {
                navigationController?.popToViewController(payViolationVC, animated: true)
            } else {
                navigationController?.popToRootViewController(animated: true)
            }
        }
        
        
    }
}
