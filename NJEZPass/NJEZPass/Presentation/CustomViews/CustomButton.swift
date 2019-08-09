//
//  CustomButton.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 15/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }

    @IBInspectable var isBWThemeButton: Bool = false {
        didSet {
            if isBWThemeButton == true {
                self.backgroundColor = UIColor.BWColorCodes.appThemeBlue
                self.setTitleColor(.white, for: .normal)
            } else {
                self.backgroundColor = UIColor.clear
                self.layer.borderWidth = 0
                self.setTitleColor(.black, for: .normal)
            }
        }
    }
    @IBInspectable var isBWSecondaryBtn: Bool = false {
        didSet {
            if isBWSecondaryBtn == true {
                self.backgroundColor = UIColor.clear
                self.layer.borderWidth = 1
                self.layer.cornerRadius = self.frame.width * 0.01
                self.layer.borderColor = UIColor.BWColorCodes.appThemeBlue.cgColor
                self.setTitleColor(UIColor.BWColorCodes.appThemeBlue, for: .normal)
            } else {
                self.backgroundColor = UIColor.clear
                self.layer.borderWidth = 0
                self.setTitleColor(.black, for: .normal)
            }
        }
    }
    @IBInspectable var imagePosition: String = ButtonImgPosition.right.rawValue {
        didSet {
            UICustomizations.alignImagePosition(position: ButtonImgPosition(rawValue: imagePosition) ?? ButtonImgPosition.left, btn: self)
        }
    }
}
