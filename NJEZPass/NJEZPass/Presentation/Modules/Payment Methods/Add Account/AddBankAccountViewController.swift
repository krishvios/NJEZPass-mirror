//
//  AddBankAccountViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 31/07/19.
//  Copyright © 2019 Anshu Sharma. All rights reserved.
//

import UIKit

class AddBankAccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 44
        
        switch indexPath.row {
            
            case 0:
                height = 44
            case 1,2,3,4:
                height = 72
            case 5:
                height = 174
            default:
                height = 44
        }
        
        return CGFloat(height)
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
        return 5
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 2 {
//            return 190
//        }
//        return 361
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = ""
        
        switch indexPath.row {
            
        case 0:
            cellIdentifier = "DescriptionCell"
        case 1:
            cellIdentifier = "InputTextFieldCell"
        case 2:
            cellIdentifier = "InputTextFieldCell"
        case 3:
            cellIdentifier = "SelectButtonCell"
        case 4:
            cellIdentifier = "SaveButtonCell"
        case 5:
            cellIdentifier = "SampleCardCell"
        default:
            cellIdentifier = "ReplenishmentOption"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        return cell!
    }
    
}

