//
//  AccountViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 17/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    let rowItems = ["Edit Profile","Account Balance","Payment Methods","Violations","Account Activity","Settings"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView.init()
    }
    
    @IBAction func homeButtonAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "UserFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DashboardView")
        self.present(vc, animated: false, completion: nil)
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

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = self.rowItems[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "EditProfile", sender: nil)
            break;
        case 1:
            self.performSegue(withIdentifier: "AccountBal", sender: nil)
            break;
        case 2:
            self.performSegue(withIdentifier: "PaymentMethods", sender: nil)
            break;
        case 3:
            self.performSegue(withIdentifier: "Violations", sender: nil)
            break;
        case 4:
            self.performSegue(withIdentifier: "AccountActivity", sender: nil)
            break;
        case 5:
            self.performSegue(withIdentifier: "Settings", sender: nil)
            break;
        default:
            break;
        }
        
    }
}
