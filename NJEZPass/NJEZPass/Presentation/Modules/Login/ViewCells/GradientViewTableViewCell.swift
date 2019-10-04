//
//  GradientViewTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 21/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol GradientDelegateCell:class {
    func localizationSelect(_sender: Any)
}

class GradientViewTableViewCell: UITableViewCell {
    
    weak  var gradientDelegate : GradientDelegateCell?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func localizationSelect(_ sender: Any) {
        gradientDelegate?.localizationSelect(_sender: sender)
    }
    
}
