//
//  CorrespondenceCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 06/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class CorrespondenceCell: UITableViewCell {

    @IBOutlet weak var statusColor: UIView!
    @IBOutlet weak var usernameRequest: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var StatusView: CMView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
