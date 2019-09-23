//
//  DisputedSelectedVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 19/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class DisputedSelectedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            height = 79
        case 2:
            height = 634
        default:()
        }
        
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell1")
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell2")
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell3")
        default:()
        }
        return cell!
    }
}
