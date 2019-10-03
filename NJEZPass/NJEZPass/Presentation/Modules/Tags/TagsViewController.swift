//
//  TagsViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 18/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupTableView(){
        tblView.estimatedRowHeight = 100
        tblView.rowHeight = UITableView.automaticDimension
        tblView.keyboardDismissMode = .onDrag
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension TagsViewController :UITableViewDelegate,UITableViewDataSource {
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = "ActivityCell"
        switch indexPath.row {
        case 2:
            cellIdentifier = "RequestTagCell"
            let cell: RequestTagsorTagSupplies = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RequestTagsorTagSupplies
            cell.delegate = self
            return cell
        case 3:
            cellIdentifier = "RequestTagSupplies"
            let cell: RequestTagsorTagSupplies = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RequestTagsorTagSupplies
            cell.delegate = self
            return cell
        default:
            let cell : AccountActivityCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AccountActivityCell
            cell.moreButtonAction.isHidden = false
            cell.statusColor.isHidden = true
            cell.activityTime.isHidden = true
        
            cell.accountDetailsorTagDetails.text = "Tag Type: Interior"
            cell.accountDetailsorTagDetails.textColor = #colorLiteral(red: 0.3333333333, green: 0.3568627451, blue: 0.3529411765, alpha: 1)
            cell.activityType.text = "02210005166"
            cell.Activity.text = "Active"
        
            if indexPath.row == 1 {
                cell.Activity.text = "Inactive"
            }
        
            if cell.Activity.text == "Active" {
                cell.StatusView.clipsToBounds = true
                cell.StatusView.borderWidth = 1
                cell.StatusView.borderColor = #colorLiteral(red: 0, green: 0.7058823529, blue: 0.6274509804, alpha: 1)
                cell.Activity.textColor = #colorLiteral(red: 0, green: 0.7058823529, blue: 0.6274509804, alpha: 1)
            }
            else {
                cell.Activity.textColor = #colorLiteral(red: 0.6666666667, green: 0.6862745098, blue: 0.7254901961, alpha: 1)
            }
             return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}

extension TagsViewController : RequesTagorSuppliesdelegate {
    func requestTagsTapped(_ sender: Any) {
        
    }
    
    func requestSuppliesTapped(_ sender: Any) {
        
    }
    
    
}
