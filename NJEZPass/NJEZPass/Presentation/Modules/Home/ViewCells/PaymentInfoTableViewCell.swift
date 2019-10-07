//
//  PaymentInfoTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 24/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class PaymentInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var lastReplenismentDateLbl: UILabel!
    @IBOutlet weak var replenishmentAmtLbl: UILabel!
    @IBOutlet weak var replenishmentThersholdLbl: UILabel!
    
    @IBOutlet weak var lastReplenismentDateTxt: UILabel!
    @IBOutlet weak var replenishmentAmtTxt: UILabel!
    @IBOutlet weak var replenishmentThersholdTxt: UILabel!
 
    @IBOutlet weak var paymentInfoTxt: UILabel!
    
    @IBOutlet weak var autoPayonoff: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
