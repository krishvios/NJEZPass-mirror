//
//  headerTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 24/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class headerTableViewCell: UITableViewCell {

    @IBOutlet weak var welocmeMsg: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
