//
//  UINavigationBar+Extensions.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 07/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func addBackButton() {
       let backImage = UIImage(named: "purpleArrow")
       self.backIndicatorImage = backImage
       self.backIndicatorTransitionMaskImage = backImage
    }
}
