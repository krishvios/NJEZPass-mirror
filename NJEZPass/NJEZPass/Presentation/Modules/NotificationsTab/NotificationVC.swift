//
//  NotificationVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 28/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupTableView()
    }
    
    func setupTableView(){
        tbleView.estimatedRowHeight = 2
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
        tbleView.bounces = true
        tbleView.isScrollEnabled = true
    }
}
extension NotificationVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return uitableviewau
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "notificationCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }
}
