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
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
