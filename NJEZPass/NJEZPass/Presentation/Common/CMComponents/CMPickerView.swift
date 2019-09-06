//
//  CMPickerView.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 07/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol CMPickerViewDelegate:class {
    func doneClicked(selectedString:String)
    func cancelClicked()
}

class CMPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource/*, CMToolbarDelegate*/ {
    var pickerArray = ["English", "Spanish"]
    weak var viewDelegate:CMPickerViewDelegate?
    var tempText:String = ""
    
    private lazy var cmToolBar:CMToolbar! = {
        
        let toolBar = CMToolbar()
        
        toolBar.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 36)

        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClicked))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }()
    
    lazy var pickerView: UIPickerView! = {
        
        let pickerView = UIPickerView(frame:CGRect(x: 0, y: 36, width: self.frame.size.width, height: 216))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.white
        return pickerView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        
        if self.subviews.contains(pickerView){
            
        }else{
            addSubview(pickerView)
            addSubview(cmToolBar)
        }
    }
    
    // MARK: - UIPickerViewDelegate methods

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return (pickerArray.count)
    }

    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerArray[row]
    }


    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        tempText = pickerArray[row]
    }
    
    // MARK: - CMToolbarDelegate methods
    
    @objc func doneClicked() {
        self.isHidden = true
        viewDelegate?.doneClicked(selectedString: tempText)
    }
    
    @objc func cancelClicked() {
        self.isHidden = true
        viewDelegate?.cancelClicked()
    }
}
