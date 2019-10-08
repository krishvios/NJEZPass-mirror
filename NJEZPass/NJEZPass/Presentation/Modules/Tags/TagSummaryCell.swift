//
//  TagSummaryCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 05/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol TagSummaryDelegate: class {
    func submitButtonTapped(_ sender: Any)
}

class TagSummaryCell: UITableViewCell {

    @IBOutlet weak var typeTxt: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var quantityTxt: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var planNameTxt: UILabel!
    @IBOutlet weak var planNameLbl: UILabel!
    @IBOutlet weak var depositTxt: UILabel!
    @IBOutlet weak var depositLbl: UILabel!
    
    @IBOutlet weak var submitBtnLbl: CMButton!
    
    weak var delegate: TagSummaryDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        delegate?.submitButtonTapped(sender)
    }
    
}
