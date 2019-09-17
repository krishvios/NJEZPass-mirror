//
//  PaymentSummaryViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 06/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class PaymentSummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Payment Summary"
        setupTableView()
    }
    
    @IBAction func saveAccount(_ sender: Any) {
        
    }
    
    func setupTableView(){
        //        let nib = UINib(nibName: String(describing: ButtonTableViewCell.self), bundle: nil)
        //        tbleView.register(nib, forCellReuseIdentifier: String(describing: ButtonTableViewCell.self))
        tbleView.estimatedRowHeight = 194
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 0
        switch indexPath.row
        {
        case 0:
            height = 80
        default:
            height = 56
        }
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        
        switch indexPath.row
        {
        case 0:
            cellIdentifier = "CardDetailsCell"
        case 1:
            cellIdentifier = "PayNowButtonCell"
        default:
            cellIdentifier = "CancelButtonCell"
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if let payNowButtonCell = cell as? PayNowTableViewCell{
            payNowButtonCell.delegate = self
        }
        if let payNowButtonCell = cell as? CancelButtonTableViewCell{
            payNowButtonCell.delegate = self
        }
        return cell!
    }
    
    @IBAction func backClicked(){
        self.navigationController?.popViewController(animated: true)
    }
}


extension PaymentSummaryViewController:PayNowTableViewCellDelegate {
    
    func payNowButtonClicked() {
        if let storyboard = self.storyboard {
            let paymentVC = storyboard.instantiateViewController(withIdentifier: "PaymentStatusViewController")
            self.navigationController?.pushViewController(paymentVC, animated: true)
        }
    }
}

extension PaymentSummaryViewController:CancelButtonTableViewCellDelegate {
    
    func cancelButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
}

