//
//  LabelTableViewCell.swift
//  NJEZPass
//
//  Created by Alam, Sk on 01/10/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let image = UIImage(named: "arrow.png")
        let  aView  = UIImageView(image: image)
        aView.frame = CGRect(x: 0, y: 0, width: 13, height: 24)
        self.accessoryView = aView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
