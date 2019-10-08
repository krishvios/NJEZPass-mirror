//
//  TagSummaryVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 05/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class TagSummaryVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tagSummaryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tagSummaryTableView.estimatedRowHeight = 100
        tagSummaryTableView.rowHeight = UITableView.automaticDimension
        tagSummaryTableView.keyboardDismissMode = .onDrag
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 300
        }
        return CGFloat(355)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = "TagSummaryCell"
        switch indexPath.row {
        case 1:
            cellIdentifier = "Empty"
        default:
            let cell: TagSummaryCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TagSummaryCell
            cell.delegate = self
            return cell
        }
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension TagSummaryVC: TagSummaryDelegate {
    func submitButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showSummary", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! SignupAndSaveVC
        nextVC.flowString = "requestTag"
    }
}
