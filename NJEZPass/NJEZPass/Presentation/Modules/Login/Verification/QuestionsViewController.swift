//
//  QuestionsViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

class QuestionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tbleView: UITableView!
    
    var securityQuestions = ["Security Question 1","Security Question 2","Security Question 3"]
    var securityQAnswers = ["Security Answer 1","Security Answer 2","Security Answer 3"]
    var selectedQuestionCell:QuestionCell?
    
    fileprivate var selectedField:ApolloTextInputField?
    lazy fileprivate var questionPicker: CMPickerView! = {
        
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.tbleView.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
        pickerView.pickerArray = ["USA","Canada"]
        pickerView.viewDelegate = self
        return pickerView
    }()
    
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
                questionCell.delegate = self
            }
            /*
        case 2:
            if let questionCell = tableView.dequeueReusableCell(withIdentifier: "\(QuestionCell.self)") as? QuestionCell {
                cell = questionCell
                questionCell.textField.placeholder = securityQuestions[indexPath.row/2]
                questionCell.delegate = self
            }
            
        case 4:
            if let questionCell = tableView.dequeueReusableCell(withIdentifier: "\(QuestionCell.self)") as? QuestionCell {
                cell = questionCell
                questionCell.textField.placeholder = securityQuestions[indexPath.row/2]
                questionCell.delegate = self
            }
            */
        case 1,3,5:
            if let answerCell = tableView.dequeueReusableCell(withIdentifier: "\(InputFieldTableViewCell.self)") as? InputFieldTableViewCell {
                cell = answerCell
//                answerCell.delegate = self
                answerCell.textField.placeholder = securityQAnswers[(indexPath.row-1)/2]
                let indexPath = NSIndexPath(row: (indexPath.row-1), section: 0)
                if let questionCell = tbleView.cellForRow(at: indexPath as IndexPath) as? QuestionCell {
                    
                    print("questionCell.textField.text?.count = \(String(describing: questionCell.textField.text?.count))")
                    print("questionCell.textField.text = \(questionCell.textField.text!)")

                    if questionCell.textField.text?.count == 0 {
                        answerCell.isUserInteractionEnabled = false
                    } else {
                        answerCell.isUserInteractionEnabled = true
                    }
                }
            }
            /*
        case 3:
            if let answerCell = tableView.dequeueReusableCell(withIdentifier: "\(InputFieldTableViewCell.self)") as? InputFieldTableViewCell {
                cell = answerCell
                answerCell.textField.placeholder = securityQAnswers[(indexPath.row-1)/2]
//                answerCell.delegate = self
            }
            
        case 5:
            if let answerCell = tableView.dequeueReusableCell(withIdentifier: "\(InputFieldTableViewCell.self)") as? InputFieldTableViewCell {
                cell = answerCell
                answerCell.textField.placeholder = securityQAnswers[(indexPath.row-1)/2]
//                answerCell.delegate = self
            }
            */
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

extension QuestionsViewController: CMPickerViewDelegate {
    
    // MARK: - CMPickerView Delegate methods
    
    func doneClicked(selectedString:String) {
        print("selectedString = \(selectedString)")
        print("selectedField?.placeholder = \(String(describing: selectedField?.placeholder))")
        selectedField?.becomeFirstResponder()
        selectedField?.text = selectedString
        selectedField?.resignFirstResponder()
        self.questionPicker.isHidden = true
    }
    
    func cancelClicked() {
        self.questionPicker.isHidden = true
    }
}

extension QuestionsViewController:QuestionCellDelegate {
    func questionClicked(textField: ApolloTextInputField, cell: QuestionCell) {
        
        self.questionPicker.pickerArray = ["Omaha", "California"]
        selectedQuestionCell = cell
        
        if view.subviews.contains(self.questionPicker) {
            self.questionPicker.isHidden = false
        } else {
            self.view.addSubview(questionPicker)
        }
        selectedField = selectedQuestionCell?.textField
        self.tbleView.reloadData()
    }
}
