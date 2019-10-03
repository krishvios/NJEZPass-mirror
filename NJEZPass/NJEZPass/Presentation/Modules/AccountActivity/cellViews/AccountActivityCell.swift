//
//  AccountActivityCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 29/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol ActivityDelegate:class {
   func moreButtonActionTapped(_ sender: Any)
}

class AccountActivityCell: UITableViewCell {
   
    @IBOutlet weak var statusColor: UIView!
    @IBOutlet weak var activityType: UILabel!
    @IBOutlet weak var Activity: UILabel!
    @IBOutlet weak var StatusView: CMView!
    @IBOutlet weak var moreButtonAction: UIButton!
    
    @IBOutlet weak var activityTime: UILabel!
    @IBOutlet weak var accountDetailsorTagDetails: UILabel!
    
    weak var delegate: ActivityDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        moreButtonAction.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func moreButtonActionTapped(_ sender: Any) {
        delegate?.moreButtonActionTapped(sender)
    }
}
