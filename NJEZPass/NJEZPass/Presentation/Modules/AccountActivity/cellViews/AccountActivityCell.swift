//
//  AccountActivityCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 29/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class AccountActivityCell: UITableViewCell {
   
    @IBOutlet weak var statusColor: UIView!
    @IBOutlet weak var activityType: UILabel!
    @IBOutlet weak var Activity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
