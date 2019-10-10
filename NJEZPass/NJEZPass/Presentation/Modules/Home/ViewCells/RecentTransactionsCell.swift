//
//  RecentTransactionsCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 25/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol RecentTransactionsCellDelegate:class {
    func viewAllTapped(_ sender: Any)
}

class RecentTransactionsCell: UITableViewCell {
    
    @IBOutlet weak var recentTrasanctionTxt: UILabel!
    @IBOutlet weak var viewAllBtnTxt: UIButton!
    
    @IBOutlet weak var transactionExitPlaza: UILabel!
    @IBOutlet weak var transactionAmount: UILabel!
    @IBOutlet weak var transactionTime: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var statusColorView: UIView!
    @IBOutlet weak var transactionImg: UIImageView!
    
    weak var recentTransactionDelegate:RecentTransactionsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func viewAllTapped(_ sender: Any) {
        recentTransactionDelegate?.viewAllTapped(sender)
    }
}
