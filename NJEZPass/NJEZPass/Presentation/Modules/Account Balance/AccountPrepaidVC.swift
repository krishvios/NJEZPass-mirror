//
//  AccountPrepaidVC.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 16/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class AccountPrepaidVC: UIViewController {
    
    @IBOutlet weak var accountBalance: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Account Balance"
  
//        self.navigationController?.navigationBar.setGradientBackground(colors: [
//            UIColor(red: 105/255, green: 32/255, blue: 126/255, alpha: 1.0).cgColor,
//            UIColor(red: 19/255, green: 140/255, blue: 145/255, alpha: 1.0).cgColor
//            ])
        
        //self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
}

extension AccountPrepaidVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    private func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "Today"
        } else {
            return "Aug 12"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return 1
        } else if(section == 1) {
            return 2
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clear
        return header
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(AccountBalanceCell.self)", for: indexPath) as! AccountBalanceCell
        //set the cell display properties
        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        cell.layer.shadowRadius = 3.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        return cell
    }
}

