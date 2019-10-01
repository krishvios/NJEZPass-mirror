//
//  SelectPaymentVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class SelectPaymentVC: UIViewController {
    
    @IBOutlet weak var expandableTableView: ExpyTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        expandableTableView.dataSource = self
        expandableTableView.delegate = self
        
       // expandableTableView.rowHeight = UITableView.automaticDimension
        //expandableTableView.estimatedRowHeight = 105
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        if let payViolationVC = navigationController!.viewControllers.filter({ $0 is PayViolationVC }).first {
            navigationController?.popToViewController(payViolationVC, animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}

//MARK: ExpyTableViewDataSourceMethods
extension SelectPaymentVC: ExpyTableViewDataSource {
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhoneNameTableViewCell.self)) as! PhoneNameTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
}

//MARK: ExpyTableView delegate methods
extension SelectPaymentVC: ExpyTableViewDelegate {
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        
        switch state {
        case .willExpand:
            print("WILL EXPAND")
            
        case .willCollapse:
            print("WILL COLLAPSE")
            
        case .didExpand:
            print("DID EXPAND")
            
        case .didCollapse:
            print("DID COLLAPSE")
        }
    }
}

extension SelectPaymentVC {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}

//MARK: UITableView Data Source Methods
extension SelectPaymentVC {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SpecificationTableViewCell.self)) as! SpecificationTableViewCell
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
}

class PhoneNameTableViewCell: UITableViewCell, ExpyTableViewHeaderCell {
    
    @IBOutlet weak var labelPhoneName: UILabel!
    @IBOutlet weak var imageViewArrow: UIImageView!
    
    func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool) {
        
        switch state {
        case .willExpand:
            print("WILL EXPAND")
            
        case .willCollapse:
            print("WILL COLLAPSE")
            
        case .didExpand:
            print("DID EXPAND")
            
        case .didCollapse:
            print("DID COLLAPSE")
        }
    }
}

class SpecificationTableViewCell: UITableViewCell {
    @IBOutlet weak var labelSpecification: UILabel!
}

