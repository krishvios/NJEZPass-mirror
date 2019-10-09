//
//  SaveTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 27/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
protocol saveButtonDelegate:class {
    func saveTapped(_sender:Any)
}
class SaveTableViewCell: UITableViewCell {

    weak var delegate:saveButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func saveTapped(_ sender: Any) {
        delegate!.saveTapped(_sender: sender)
    }
}
