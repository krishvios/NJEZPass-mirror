//
//  FilterViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 09/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Filter"
        setupTableView()
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
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 5 {
            return 56
        }
        return 85
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellIdentifier = "InputFieldTableViewCell"

        switch indexPath.row
        {
        case 0:
            cellIdentifier = "TransactionTypeCell"
        case 1:
            cellIdentifier = "DateSelectionCell"
        case 2:
            cellIdentifier = "TransactionTypeCell"
        case 3:
            cellIdentifier = "InputFieldTableViewCell"
        case 4:
            cellIdentifier = "InputFieldTableViewCell"
        case 5:
            cellIdentifier = "SearchButtonCell"
        default:
            cellIdentifier = "InputFieldTableViewCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
    
    @IBAction func backClicked(){
      self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetFiltersClicked(){
        // Reset all the values in the filters page
    }
}

extension FilterViewController:SearchButtonCellDelegate {
    func searchWithFilters() {
        self.dismiss(animated: true, completion: nil)
    }
}
