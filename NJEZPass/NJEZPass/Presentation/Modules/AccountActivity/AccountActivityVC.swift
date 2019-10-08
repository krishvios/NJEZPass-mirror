//
//  AccountActivityVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 29/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class AccountActivityVC: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tbleView.estimatedRowHeight = 100
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
    }
    
    @IBAction func backbuttonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension AccountActivityVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cellIdentifier = "SectionHeader"
        let headerView = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        switch section {
        case 0:
            return UIView(frame: .zero)
        default:
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = "ActivityCell"
        if indexPath.section == 0 {
            cellIdentifier = "FilterCell"
            let filtercell: FilterTableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? FilterTableViewCell)!
             filtercell.filterDelegate = self
            return filtercell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.section == 0 {
          return 40
        }

        return tableView.rowHeight
    }
}

extension AccountActivityVC :filterTappedDelegate {
    func filterTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showFilter", sender: nil)
    }
}
