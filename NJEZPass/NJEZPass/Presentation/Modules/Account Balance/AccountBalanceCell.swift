//
//  AccountBalanceCell.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 19/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class AccountBalanceCell: UITableViewCell {

    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var replenishId: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var barView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dataView.configure(with: 1.0, andDefaultShadowWithColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
