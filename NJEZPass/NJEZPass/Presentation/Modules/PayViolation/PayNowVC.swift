//
//  PayNowVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 24/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class PayNowVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
        let confirmVC = storyBoard.instantiateViewController(withIdentifier: "SignupAndSaveVC") as! SignupAndSaveVC
        confirmVC.flowString = "payNowFlow"
        self.navigationController?.pushViewController(confirmVC, animated: true)
    }
}

extension PayNowVC: CancelButtonTableViewCellDelegate {
    func cancelButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
}
