//
//  CameraImageViewCell.swift
//  NJEZPass
//
//  Created by Alam, Sk on 27/09/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol CameraImageViewCellDelegate: class {
    func cameraClicked()
}

class CameraImageViewCell: UITableViewCell {

    @IBOutlet weak var vehicleImageView: UIImageView!
    @IBOutlet weak var takeImageView: UIView!
    
    weak var delegate:CameraImageViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func cameraClicked() {
        delegate?.cameraClicked()
    }
}


