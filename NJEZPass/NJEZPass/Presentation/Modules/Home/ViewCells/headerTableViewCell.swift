//
//  headerTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 24/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol headerCellDelegate:class {
    func increaseBalanceTapped(_ sender: Any)
}

class headerTableViewCell: UITableViewCell {

    @IBOutlet weak var welocmeMsg: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var prepaidBlanceTxt: UILabel!
    @IBOutlet weak var increaseBalanceBtnTxt: CMButton!
    
    weak var headerCellDelegate: headerCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func increaseBalanceTapped(_ sender: Any) {
        headerCellDelegate?.increaseBalanceTapped(sender)
    }
}
