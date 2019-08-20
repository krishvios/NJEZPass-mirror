//
//  UIView+Extensions.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 20/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit


extension UIView {
    func configure(with radius: CGFloat, andDefaultShadowWithColor shadowColor: UIColor) {
        self.layer.cornerRadius = radius
        self.layer.shadowColor = shadowColor.cgColor
        configureShadowProperties(withDefaultShadowOffset: CGSize(width: 0.0, height: 1.0), andDefaultShadowRadius: 5.0, andDefaultShadowOpacity: 1.0)
        self.layer.masksToBounds = false
    }
    func configureShadowProperties(withDefaultShadowOffset shadowOffset: CGSize, andDefaultShadowRadius shadowRadius: CGFloat, andDefaultShadowOpacity shadowOpacity: Float) {
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
    }
    
    func setBorder(color:UIColor, width:CGFloat)  {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }

}


