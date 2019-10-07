//
//  CorrespondenceSummaryVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 06/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class CorrespondenceSummaryVC: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tbleView.estimatedRowHeight = 100
        tbleView.rowHeight = UITableView.automaticDimension
        tbleView.keyboardDismissMode = .onDrag
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.showNavBarWith(title: "Username Request", backAction: nil)
    }
    
    func backButtonClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backbuttonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension CorrespondenceSummaryVC : UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = "BodyCell"
        switch indexPath.row {
        case 0:
            cellIdentifier = "SubjectCell"
        case 1:
            cellIdentifier = "BodyCell"
        case 2:
            cellIdentifier = "MessageCell"
        case 3:
            cellIdentifier = "ContentCell"
        default:
             cellIdentifier = "ContentCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}
