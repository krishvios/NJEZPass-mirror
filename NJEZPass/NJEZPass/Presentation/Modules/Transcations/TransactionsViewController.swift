//
//  TransactionsViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 18/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView(){
        //        let nib = UINib(nibName: String(describing: ButtonTableViewCell.self), bundle: nil)
        //        tbleView.register(nib, forCellReuseIdentifier: String(describing: ButtonTableViewCell.self))
        tbleView.estimatedRowHeight = 100
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 304
        }
        return 88
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cellIdentifier = "SectionHeader"
        let headerView = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)

        switch section {
        case 0:
            return UIView(frame: .zero)
        default:
            if headerView == nil {
                //            [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
                //            NSException.raise(NSExceptionName(rawValue: "headerView == nil.."), format: "No cells with matching CellIdentifier", arguments: ...)
            }
            return headerView
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = "TransactionCell"
        
        if indexPath.section == 0 && indexPath.row == 0 {
            cellIdentifier = "TransactionsHeaderCell"
        }
        
        
        switch indexPath.row {

            case 0:
                cellIdentifier = "TransactionsHeaderCell"
    //        case 1:
    //            cellIdentifier = "ReplenishmentMethod"
            default:
                cellIdentifier = "TransactionCell"
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if let transCell = cell as? TransactionsHeaderCell {
            transCell.transactionsHeaderDelegate = self
        }
        return cell!
    }
}

extension TransactionsViewController:TransactionsHeaderDelegate {
    
    func increaseBalanceClicked() {
        if let storyboard = self.storyboard {
            let paymentVC = storyboard.instantiateViewController(withIdentifier: "TransactionsPaymentViewController")
            self.navigationController?.pushViewController(paymentVC, animated: true)
        }
    }
    
    func filtersClicked() {
        
    }
}
