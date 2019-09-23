//
//  TabWidgetTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 16/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol TabWidgetCelldelegate:class {
    func tollFacilitesClicked(_ sender: Any)
    func travelToolsClicked(_ sender: Any)
    func websiteClicked(_ sender: Any)
}

class TabWidgetTableViewCell: UITableViewCell {
    
     @IBOutlet weak var tollFacilitesLbl: UILabel!
     @IBOutlet weak var travelToolsLbl: UILabel!
     @IBOutlet weak var websiteLbl: UILabel!

    weak var tabWidgetDelegate : TabWidgetCelldelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func tollFacilitesClicked(_ sender: Any) {
        tabWidgetDelegate?.tollFacilitesClicked(sender)
    }
    
    @IBAction func travelToolsClicked(_ sender: Any) {
        tabWidgetDelegate?.travelToolsClicked(sender)
    }
    
    @IBAction func websiteClicked(_ sender: Any) {
        tabWidgetDelegate?.websiteClicked(sender)
    }
}
