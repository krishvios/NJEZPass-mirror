//
//  TransactionsHeaderCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 05/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol TransactionsHeaderDelegate: class {
    func filtersClicked()->Void
    func increaseBalanceClicked()->Void
}

class TransactionsHeaderCell: UITableViewCell {

    weak var transactionsHeaderDelegate:TransactionsHeaderDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func filtersClicked(_ sender: Any) {
        transactionsHeaderDelegate.filtersClicked()
    }
    
    @IBAction func increaseBalanceClicked(_ sender: Any) {
        transactionsHeaderDelegate.increaseBalanceClicked()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
