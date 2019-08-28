//
//  PaymentInformationViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 29/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class PaymentInformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbleView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView(){
//        let nib = UINib(nibName: String(describing: ButtonTableViewCell.self), bundle: nil)
//        tbleView.register(nib, forCellReuseIdentifier: String(describing: ButtonTableViewCell.self))
        tbleView.estimatedRowHeight = 100
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 190
        }
        return 361
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        
        switch indexPath.row {
            
            case 0:
                cellIdentifier = "PaymentInformation"
            case 1:
                cellIdentifier = "ReplenishmentMethod"
            default:
                cellIdentifier = "ReplenishmentOption"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)

        return cell!
    }

}
