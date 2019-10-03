//
//  RequestTagsorTagSupplies.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 03/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
protocol RequesTagorSuppliesdelegate:class {
   func requestTagsTapped(_ sender: Any)
   func requestSuppliesTapped(_ sender: Any)
}

class RequestTagsorTagSupplies: UITableViewCell {

    weak var delegate : RequesTagorSuppliesdelegate?
    
    @IBOutlet weak var requestTagBtnLbl: CMButton!
    @IBOutlet weak var requestSuppliesTagNtnLbl: CMButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func requestTagsTapped(_ sender: Any) {
        delegate?.requestTagsTapped(sender)
    }
    
    @IBAction func requestSuppliesTapped(_ sender: Any) {
        delegate?.requestSuppliesTapped(sender)
    }
}
