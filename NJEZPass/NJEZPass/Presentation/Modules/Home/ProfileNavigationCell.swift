//
//  ProfileNavigationCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 13/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class ProfileNavigationCell: UITableViewCell {

    @IBOutlet weak var availableBalance: UILabel!
    @IBOutlet weak var violationsBalance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setAvailableBalance() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.availableBalance.text = "$ \(String(describing: appDelegate!.detailInfo?.financialInformation?.currentBalance))"
    }
    
    public func setViolationsBalance() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.violationsBalance.text = "$ \(String(describing: appDelegate!.detailInfo?.financialInformation?.violationBalance))"
    }
}
