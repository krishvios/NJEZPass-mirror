//
//  TransactionsViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 18/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupTableView()
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    func setupTableView(){
        //        let nib = UINib(nibName: String(describing: ButtonTableViewCell.self), bundle: nil)
        //        tbleView.register(nib, forCellReuseIdentifier: String(describing: ButtonTableViewCell.self))
        tbleView.estimatedRowHeight = 2
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
    }
}
extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cellIdentifier = "SectionHeader"
        let headerView = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        switch section {
        case 0:
            return UIView(frame: .zero)
        default:
            headerView?.backgroundColor = UIColor.white
            return headerView
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 40
        }
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = "TransactionCell"
        if indexPath.section == 0 {
            cellIdentifier = "TransactionsHeaderCell"
            let cell: TransactionsHeaderCell =  tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TransactionsHeaderCell
            cell.transactionsHeaderDelegate = self
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
             return 1
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 291
        default:
            return 82
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section > 0 {
            let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
            let transactionDetails = storyBoard.instantiateViewController(withIdentifier: "TransactionsDetailsVC") as! TransactionsDetailsVC
            self.navigationController?.pushViewController(transactionDetails, animated: true)
        }
    }
}

extension TransactionsViewController: TransactionsHeaderDelegate {
    func filtersClicked() {
         performSegue(withIdentifier: "showFilter", sender: nil)
    }
    
    func increaseBalanceClicked() {
        performSegue(withIdentifier: "showIncreaseBalance", sender: nil)
    }
    
    
}
