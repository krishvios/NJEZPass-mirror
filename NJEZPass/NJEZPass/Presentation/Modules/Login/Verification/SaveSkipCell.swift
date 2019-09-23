//
//  SaveSkipCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol SaveSkipCellDelegate:class {
    func saveClicked()
    func skipClicked()
}

class SaveSkipCell: UITableViewCell {

    weak var delegate:SaveSkipCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func saveClicked(){
        delegate!.saveClicked()
    }
    
    @IBAction func skipClicked(){
        delegate!.skipClicked()
    }

}
