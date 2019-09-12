//
//  TransactionTypeCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 10/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol TransactionTypeCellDelegate:class {
    func searchWithFilters()
}

class TransactionTypeCell: UITableViewCell {
    
    weak var delegate:TransactionTypeCellDelegate!
    
    @IBOutlet weak var selectionButton:UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func selectionButtonClicked() {
        
    }
}
