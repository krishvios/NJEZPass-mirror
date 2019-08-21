//
//  AccountBalanceVC.swift
//  NJEZPass
//
//  Created by Gudavarthi, Pardhu on 16/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class AccountBalanceVC: UIViewController {
    
    @IBOutlet weak var accountBalance: UILabel!
    @IBOutlet weak var replenishAccountButton: UIButton!
    @IBOutlet weak var viewTransactionButton: UIButton!
    @IBOutlet weak var accountView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Account Balance"
        
        replenishAccountButton.layer.borderColor = UIColor.white.cgColor
        replenishAccountButton.layer.borderWidth = 1.0
        
        viewTransactionButton.layer.borderColor = UIColor.purple.cgColor
        viewTransactionButton.layer.borderWidth = 1.0
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor(red: 105/255, green: 32/255, blue: 126/255, alpha: 1.0).cgColor,
            UIColor(red: 19/255, green: 140/255, blue: 145/255, alpha: 1.0).cgColor
            ])
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
}

extension AccountBalanceVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 7
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clear
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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

