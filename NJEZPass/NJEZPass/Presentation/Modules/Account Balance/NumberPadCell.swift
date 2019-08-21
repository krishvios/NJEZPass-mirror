//
//  NumberPadCell.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 21/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class NumberPadCell: UICollectionViewCell {
    
    @IBOutlet weak var numberButton: UIButton!
    
    var didSelectButton : (() -> Void)? = nil
    
    @IBAction func numberButtonTapped(_ sender: Any) {
        didSelectButton?()
    }
}
