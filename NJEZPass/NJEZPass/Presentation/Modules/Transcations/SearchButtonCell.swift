//
//  SearchButtonCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 10/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol SearchButtonCellDelegate:class {
    func searchWithFilters()
}

class SearchButtonCell: UITableViewCell {

    weak var delegate:SearchButtonCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func searchWithFilters(){
        delegate.searchWithFilters()
    }
}
