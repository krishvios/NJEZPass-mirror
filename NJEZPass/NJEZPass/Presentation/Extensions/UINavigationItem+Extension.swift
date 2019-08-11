//
//  UINavigationItem+Extension.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 05/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

extension UINavigationItem {
    
    func addNavBarImage()  {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "navHeaderImage")
        imageView.image = image
        self.titleView = imageView
    }
}
