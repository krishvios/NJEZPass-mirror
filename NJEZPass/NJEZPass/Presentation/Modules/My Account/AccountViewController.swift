//
//  AccountViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 17/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    let rowItems = ["Edit Profile","Payment Methods","FAQs","Contact Us","Vehicles","Tags"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView.init()
        self.navigationController?.navigationBar.tintColor = .purple
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = .white
    }
}

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = self.rowItems[indexPath.row]
        cell.textLabel?.text = item
        cell.textLabel?.font = UIFont(name: "OpenSans", size: 14)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "EditProfile", sender: nil)
            break;
        case 1:
            self.performSegue(withIdentifier: "PaymentMethods", sender: nil)
            break;
        case 2:
            self.performSegue(withIdentifier: "FAQ", sender: nil)
            break;
        case 3:
            self.performSegue(withIdentifier: "ContactUs", sender: nil)
            break;
        default:
            break;
        }
    }
}
