//
//  AccountViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 17/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    private var myAccountCell:MyAccountCell? = nil
    
    let rowItems = ["Edit Profile","Payment Methods","Vehicles","Tags","Account Activity"]

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
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        myAccountCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MyAccountCell
        myAccountCell?.cellLabel.text = rowItems[indexPath.row]
        switch indexPath.row {
        case 0:
           myAccountCell?.cellTypeImage.image = #imageLiteral(resourceName: "editProfile")
            break;
        case 1:
            myAccountCell?.cellTypeImage.image = #imageLiteral(resourceName: "paymentMethods")
            break;
        case 2:
            myAccountCell?.cellTypeImage.image = #imageLiteral(resourceName: "vehicles-1")
            break;
        case 3:
            myAccountCell?.cellTypeImage.image = #imageLiteral(resourceName: "tags2")
            break;
        case 4:
            myAccountCell?.cellTypeImage.image = #imageLiteral(resourceName: "accountActivity")
            break;
        default:
            break;
        }
        return myAccountCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "EditProfile", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "PaymentMethods", sender: nil)
        case 2:
            self.performSegue(withIdentifier: "VehiclesFlow", sender: nil)
        case 3:
            self.performSegue(withIdentifier: "showTags", sender: nil)
        case 4:
            self.performSegue(withIdentifier: "showAccountActivity", sender: nil)
        default:
            break;
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}
