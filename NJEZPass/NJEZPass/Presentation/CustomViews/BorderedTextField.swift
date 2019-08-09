//
//  BottomBorderedTextField.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 15/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit

@IBDesignable class BorderedTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    // MARK: Initialization
    var showPwdbtn = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addShowPasswordOption()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)!
        addShowPasswordOption()
    }

    @IBInspectable var bottomBorderColor: UIColor = .black {
        didSet {
            self.borderStyle = .none
            UICustomizations.addBorder(position: BorderPosition.bottom, borderWidth: 1, borderColor: bottomBorderColor, view: self)
        }
    }
    @IBInspectable var leftBorderColor: UIColor = .black {
        didSet {
            self.borderStyle = .none
             UICustomizations.addBorder(position: BorderPosition.left, borderWidth: 1, borderColor: leftBorderColor, view: self)
        }
    }
    @IBInspectable var rightBorderColor: UIColor = .black {
        didSet {
            self.borderStyle = .none
             UICustomizations.addBorder(position: BorderPosition.right, borderWidth: 1, borderColor: rightBorderColor, view: self)
        }
    }
    @IBInspectable var topBorderColor: UIColor = .black {
        didSet {
            self.borderStyle = .none
             UICustomizations.addBorder(position: BorderPosition.top, borderWidth: 1, borderColor: topBorderColor, view: self)
        }
    }
    @IBInspectable var isPaswordField: Bool = false {
        didSet {
                showPwdbtn.isHidden = !isPaswordField
                self.isSecureTextEntry = isPaswordField
        }
    }
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    func addShowPasswordOption() {
        showPwdbtn.frame = CGRect(x: 0, y: 0, width: self.frame.width * 0.12, height: self.frame.height)
        showPwdbtn.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        showPwdbtn.setImage(UIImage.init(named: "eyeClose"), for: .normal)
//        showPwdbtn.backgroundColor = .gray
        self.rightView = showPwdbtn
        self.rightViewMode = .always
        self.isSecureTextEntry = true
    }
    @objc func showPassword(sender: UIButton) {
         self.isSecureTextEntry = !self.isSecureTextEntry
        if showPwdbtn.imageView?.image == UIImage.init(named: "eyeClose") {
            showPwdbtn.setImage(UIImage.init(named: "eyeOpen"), for: .normal)
        } else {
            showPwdbtn.setImage(UIImage.init(named: "eyeClose"), for: .normal)
        }
    }
}
