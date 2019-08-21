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

extension UINavigationBar {
    func setGradientBackground(colors: [Any]) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        var updatedFrame = self.bounds
        updatedFrame.size.height += self.frame.origin.y
        gradient.frame = updatedFrame
        gradient.colors = colors;
        self.setBackgroundImage(self.image(fromLayer: gradient), for: .default)
    }
    
    func image(fromLayer layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }
}
