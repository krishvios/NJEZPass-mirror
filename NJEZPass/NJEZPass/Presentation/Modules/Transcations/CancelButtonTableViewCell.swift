//
//  CancelButtonTableViewCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 09/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol CancelButtonTableViewCellDelegate:class {
    func cancelButtonClicked()
}

class CancelButtonTableViewCell: UITableViewCell {

    weak var delegate:CancelButtonTableViewCellDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func cancelButtonClicked() {
        delegate.cancelButtonClicked()
    }

}
