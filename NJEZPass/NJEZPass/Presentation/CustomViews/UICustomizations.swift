//
//  UICustomizations.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 15/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit

class UICustomizations {
    static func addBorder(position: BorderPosition, borderWidth: CGFloat, borderColor: UIColor, view: UIView) {
        removeLayerForPosition(position: position, view: view)
        switch position {
        case .top:
            let bottomLine = CALayer()
            bottomLine.frame = CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: borderWidth)
            bottomLine.backgroundColor = borderColor.cgColor
            bottomLine.accessibilityLabel = position.rawValue
            view.layer.addSublayer(bottomLine)
        case .bottom:
            let bottomLine = CALayer()
            bottomLine.frame = CGRect.init(x: 0, y: view.frame.size.height-borderWidth, width: view.frame.size.width, height: borderWidth)
            bottomLine.backgroundColor = borderColor.cgColor
            bottomLine.accessibilityLabel = position.rawValue
            view.layer.addSublayer(bottomLine)
        case .left:
            let bottomLine = CALayer()
            bottomLine.frame = CGRect.init(x: 0, y: 0, width: borderWidth, height: view.frame.size.height)
            bottomLine.backgroundColor = borderColor.cgColor
            bottomLine.accessibilityLabel = position.rawValue
            view.layer.addSublayer(bottomLine)
        case .right:
            let bottomLine = CALayer()
            bottomLine.frame = CGRect.init(x: view.frame.size.width - borderWidth, y: 0, width: borderWidth, height: view.frame.size.height)
            bottomLine.backgroundColor = borderColor.cgColor
            bottomLine.accessibilityLabel = position.rawValue
            view.layer.addSublayer(bottomLine)
        }
    }
    static func removeLayerForPosition(position: BorderPosition, view: UIView) {
        if let layers = view.layer.sublayers {
            for layer in layers where layer.accessibilityLabel == position.rawValue {
                layer.removeFromSuperlayer()
            }
        }
    }
    static func alignImagePosition(position: ButtonImgPosition, btn: UIButton)//,btnWidth:CGFloat)
    {
        let imageSize = btn.imageView!.frame.size
        let titleSize = btn.titleLabel!.frame.size
        let totalHeight = imageSize.height + titleSize.height + 2
//        let totalWidth = imageSize.width + titleSize.width + 2
        switch position {
        case .top:
            btn.imageEdgeInsets = UIEdgeInsets(
                top: -(totalHeight - imageSize.height),
                left: 0,
                bottom: 0,
                right: -titleSize.width
            )

            btn.titleEdgeInsets = UIEdgeInsets(
                top: 0,
                left: -imageSize.width,
                bottom: -(totalHeight - titleSize.height),
                right: 0
            )
        case .bottom:
            btn.imageEdgeInsets = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: -(totalHeight-imageSize.height),
                right: -titleSize.width
            )

            btn.titleEdgeInsets = UIEdgeInsets(
                top: -(totalHeight - titleSize.height),
                left: -imageSize.width,
                bottom: 0,
                right: 0
            )
        case .left:
            print("Keep default")
        case .right:
            btn.imageEdgeInsets = UIEdgeInsets(
                top: 0,
                left: btn.bounds.width-imageSize.width,
                bottom: 0,
                right: 2
            )

            btn.titleEdgeInsets = UIEdgeInsets(
                top: 0,
                left: -imageSize.width,
                bottom: 0,
                right: imageSize.width
            )
        }
    }
}
