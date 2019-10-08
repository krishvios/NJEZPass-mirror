//
//  FilterTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 29/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol  filterTappedDelegate:class {
    func filterTapped(_ sender: Any)
}

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var filterLabel: UILabel!
    weak var filterDelegate :filterTappedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func filterTapped(_ sender: Any) {
        filterDelegate!.filterTapped(sender)
    }
}
