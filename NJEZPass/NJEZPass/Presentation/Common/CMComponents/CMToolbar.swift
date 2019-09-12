//
//  CMToolbar.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 07/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol CMToolbarDelegate:class {
    func doneClicked(str:String)
    func cancelClicked()
}

class CMToolbar: UIToolbar {

    weak var toolBarDelegate: CMToolbarDelegate?
    var tempText:String = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.barStyle = .default
        self.isTranslucent = true
        self.tintColor = UIColor(red: 110/255, green: 57/255, blue: 134/255, alpha: 1.0)
        self.sizeToFit()
        
//        // Adding Button ToolBar
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClicked))
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClicked))
//        self.setItems([cancelButton, spaceButton, doneButton], animated: false)
//        self.isUserInteractionEnabled = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func doneClicked() {
        toolBarDelegate?.doneClicked(str: tempText)
    }
    
    @objc func cancelClicked() {
        toolBarDelegate?.cancelClicked()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
