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
    @IBOutlet weak var statusColorLbl: CMView!
    @IBOutlet weak var paymentType: UILabel!
    
    weak var recentTransactionDelegate:RecentTransactionsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func viewAllTapped(_ sender: Any) {
        recentTransactionDelegate?.viewAllTapped(sender)
    }
}
