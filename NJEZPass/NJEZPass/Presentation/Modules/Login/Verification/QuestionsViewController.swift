//
//  QuestionsViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tbleView: UITableView!
    var securityQuestions = ["Security Question 1","Security Question 2","Security Question 3"]
    var securityQAnswers = ["Security Answer 1","Security Answer 2","Security Answer 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Security Questions"
        self.tbleView.estimatedRowHeight = 44.0;
        self.tbleView.rowHeight = UITableView.automaticDimension;
        
        // Reload the table
        self.tbleView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
       return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        
        var cell: UITableViewCell?
        print("indexPath.row = \(indexPath.row)")

        switch indexPath.row {
        case 0,2,4:
            if let questionCell = tableView.dequeueReusableCell(withIdentifier: "\(QuestionCell.self)") as? QuestionCell {
                cell = questionCell
                questionCell.textField.placeholder = securityQuestions[indexPath.row/2]
            }
        case 1,3,5:
            if let answerCell = tableView.dequeueReusableCell(withIdentifier: "\(InputFieldTableViewCell.self)") as? InputFieldTableViewCell {
                cell = answerCell
                answerCell.textField.placeholder = securityQAnswers[(indexPath.row-1)/2]
            }
        default:
            if let saveSkipCell = tableView.dequeueReusableCell(withIdentifier: "\(SaveSkipCell.self)") as? SaveSkipCell {
                saveSkipCell.delegate = self
                cell = saveSkipCell
            }
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
//        return UITableView.automaticDimension
        return 85

    }

    @IBAction func backClicked(){
        
    }
}

extension QuestionsViewController: SaveSkipCellDelegate {
    
    func saveClicked() {
        
        print("\(#function)")
        
        if let storyboard = self.storyboard {
            let homeVC = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
    
    func skipClicked() {
        
        print("\(#function)")
    }
    
}
