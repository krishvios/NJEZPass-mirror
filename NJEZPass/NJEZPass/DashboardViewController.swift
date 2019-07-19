//
//  DashboardViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 17/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    let rowItems = ["Newsroom","Toll Facilities","Travel Tools"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func myAccountButtonAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "AccountFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AccountView")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func transactionsButtonAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "TransactionsFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TransactionsView")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func vehiclesButtonAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "VehiclesFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VehiclesView")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func tagsButtonAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "TagsFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TagsView")
        self.present(vc, animated: true, completion: nil)
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

extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = self.rowItems[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
}
