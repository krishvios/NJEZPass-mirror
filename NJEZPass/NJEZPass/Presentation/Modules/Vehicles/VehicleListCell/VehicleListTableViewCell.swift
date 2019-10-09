//
//  VehicleListTableViewCell.swift
//  NJEZPass
//
//  Created by Alam, Sk on 09/10/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class VehicleListTableViewCell: UITableViewCell {
    @IBOutlet weak var plateIconImageView: UIImageView!
    
    @IBOutlet weak var lblVehicleName: UILabel!
    
    @IBOutlet weak var lblVehicleNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureVehicleDetails(name:String ,number:String)  {
        
        self.lblVehicleName.text = name
        self.lblVehicleNumber.text = number
    }
}
