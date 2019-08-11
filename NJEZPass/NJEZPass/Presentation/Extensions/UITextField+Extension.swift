//
//  UITextField+Extension.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 08/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

extension UITextField {
    func addBottomBorder() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
