//
//  UIView+Extensions.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 20/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit


extension UIView {
    func configure(with radius: CGFloat, borderColor: UIColor) {
        self.layer.cornerRadius = radius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1
        configureShadowProperties(withDefaultShadowOffset: CGSize(width: 0, height: 0), andDefaultShadowRadius: 10, andDefaultShadowOpacity: 0.1)
        self.layer.masksToBounds = false
        self.layer.masksToBounds = true
    }
    
    func configureShadowProperties(withDefaultShadowOffset shadowOffset: CGSize, andDefaultShadowRadius shadowRadius: CGFloat, andDefaultShadowOpacity shadowOpacity: Float) {
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
    }
}

