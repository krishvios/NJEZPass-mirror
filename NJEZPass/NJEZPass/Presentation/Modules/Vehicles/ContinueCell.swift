//
//  ContinueCell.swift
//  NJEZPass
//
//  Created by Alam, Sk on 27/09/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol ContinueCellDelegate:class {
    func continueClicked()
}

class ContinueCell: UITableViewCell {

    weak var delegate:ContinueCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func continueClicked(){
        delegate!.continueClicked()
    }

}
