//
//  ActivityFilterVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 29/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class ActivityFilterVC: UIViewController {
    
    
    @IBOutlet weak var startDate: ApolloTextInputField! {
        didSet {
            startDate.validationType = .date
        }
    }
    
    @IBOutlet weak var endDate: ApolloTextInputField! {
        didSet {
            endDate.validationType = .date
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        startDate.setText(text: "")
        endDate.setText(text: "")
    }
}
extension ActivityFilterVC : ApolloTextInputFieldDelegate {
    
}
