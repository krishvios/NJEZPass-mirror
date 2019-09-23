//
//  DisputedSelectedVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 19/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class DisputedSelectedVC: UIViewController {
    
    @IBOutlet weak var disputeTableView: UITableView!
    @IBOutlet weak var pickerOverlay: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    var isPickerVisible = false
    var nonResSelected = true
    var index = 0
    
    let disputeTypes = ["Select Dispute Type", "Section A1: Non-Responsibility", "Section A2: Rental Car or Leasing", "Section B: Inadvertent Toll Violation", "Section C: E-ZPass Customer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerOverlay.isHidden = true
        pickerView.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        pickerOverlay.addGestureRecognizer(tap)
        
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(self.handleViewTap(_:)))
        view.addGestureRecognizer(viewTap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        pickerOverlay.isHidden = true
        pickerView.isHidden = true
        isPickerVisible = false
        disputeTableView.reloadData()
    }
    
    @objc func handleViewTap(_ sender: UITapGestureRecognizer? = nil) {
        self.view.endEditing(true)
    }
    
    @IBAction func disputeTapped(_ sender: Any) {
        pickerOverlay.isHidden = false
        pickerView.isHidden = false
        isPickerVisible = true
        disputeTableView.reloadData()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}


extension DisputedSelectedVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 176
        switch indexPath.row
        {
        case 0:
            height = 189
        case 1:
            height = (isPickerVisible || nonResSelected) ? 0 : 79
        case 2:
            height = isPickerVisible ? 0 : 634
        default:()
        }
        
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        switch indexPath.row {
        case 0:
            if let disputeCell = tableView.dequeueReusableCell(withIdentifier: "DisputeSelectedCell") as? DisputeSelectedCell {
                disputeCell.disputeField.text = index == 0 ? "" : disputeTypes[index]
                cell = disputeCell
            }
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell2")
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell3")
        default:()
        }
        return cell ?? UITableViewCell()
    }
}

extension DisputedSelectedVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return disputeTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return disputeTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        index = row
        if row == 1 {
            nonResSelected = false
        } else {
            nonResSelected = true
        }
        if index != 0 {
            pickerOverlay.isHidden = true
            pickerView.isHidden = true
            isPickerVisible = false
        }
        disputeTableView.reloadData()
    }
}
