//
//  QuestionsViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS
import Entities
import MBProgressHUD

protocol IQuestionsViewable {
    func updateSuccess(viewModel: SecurityQuestionsModel.PresentionModel)
    func updateFailed(viewModel: SecurityQuestionsModel.PresentionModel)
}

class QuestionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tbleView: UITableView!
    
    var interactor: IQuestionsInteractable?
    var router: IRouter?
    
    var securityQuestions = ["Security Question 1","Security Question 2","Security Question 3"]
    var securityQAnswers = ["Security Answer 1","Security Answer 2","Security Answer 3"]
    var selectedQuestionCell:QuestionCell?
    
    fileprivate var selectedField:ApolloTextInputField?
    
    var arr = ["",""]
    
    lazy fileprivate var questionPicker: CMPickerView! = {
        
        let pickerView = CMPickerView(frame:CGRect(x: 0, y: self.tbleView.frame.size.height-216-36, width: self.view.frame.size.width, height: 216+36))
//        pickerView.pickerArray = ["USA","Canada"]
        pickerView.pickerArray = arr
        pickerView.viewDelegate = self
        return pickerView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let configurator = QuestionsConfigurator()
        configurator.build(viewController: self)
        interactor = configurator.interactor
        router = configurator.router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Security Questions"
        self.tbleView.estimatedRowHeight = 44.0;
        self.tbleView.rowHeight = UITableView.automaticDimension;
        
        
        
        print("CMUtility.dynamicPageLoad?.challangeQuestionList = \(String(describing: CMUtility.dynamicPageLoad?.challangeQuestionList))")
        
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
//                answerCell.isUserInteractionEnabled = false
                toggleAnswers(tbleView,indexPath: indexPath)
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

    @IBAction func backClicked(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func toggleAnswers(_ tableView:UITableView, indexPath: IndexPath) {
        print("\(#function)")
        let indexPathh = IndexPath(row: (indexPath.row-1), section: 0)
        if let answerCell = tableView.cellForRow(at: indexPathh) {
            
            if selectedQuestionCell == nil {
                selectedQuestionCell = tbleView.cellForRow(at: IndexPath(row: (indexPath.row-1), section: 0)) as? QuestionCell
            }
            print("selectedQuestionCell.textField.text?.count = \(String(describing: selectedQuestionCell!.textField.text?.count))")
            print("selectedQuestionCell.textField.text = \(selectedQuestionCell!.textField.text!)")
            
            if selectedQuestionCell!.textField.text?.count == 0 {
                answerCell.isUserInteractionEnabled = false
            } else {
                answerCell.isUserInteractionEnabled = true
            }
        }
    }
    
}

extension QuestionsViewController: SaveSkipCellDelegate {
    
    func saveClicked() {
        
        print("\(#function)")
        
        //online login flow
        MBProgressHUD.showAdded(to: self.view, animated: true)
        interactor?.updateSecurityQuestions(question: "", answer: "", requestType: .remote)
        
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
        self.tbleView.reloadData()
//        self.toggleAnswers(tbleView, indexPath: tbleView.indexPath(for: selectedQuestionCell!)!)
    }
    
    func cancelClicked() {
        self.questionPicker.isHidden = true
    }
}

extension QuestionsViewController:QuestionCellDelegate {
    func questionClicked(textField: ApolloTextInputField, cell: QuestionCell) {
        print("\(#function)")

//        self.questionPicker.pickerArray = ["Omaha", "California"]
//        self.questionPicker.pickerArray = (CMUtility.dynamicPageLoad?.challangeQuestionList!)!
        let z = (CMUtility.dynamicPageLoad?.challangeQuestionList!)!.map { $0.copy() } as? [String]
        arr.removeAll()
        for question in z! {
            var array  = question.components(separatedBy: "~")
            self.questionPicker.pickerArray.append(array[0])
            arr.append(array[0])
        }
        
        selectedQuestionCell = cell
        
        if view.subviews.contains(self.questionPicker) {
            self.questionPicker.isHidden = false
        } else {
            self.view.addSubview(questionPicker)
        }
        selectedField = selectedQuestionCell?.textField
//        self.tbleView.reloadData()
    }
}

extension QuestionsViewController: IQuestionsViewable {
    func updateSuccess(viewModel: SecurityQuestionsModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func updateFailed(viewModel: SecurityQuestionsModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension QuestionsViewController: IRoutable {
    func showMessage(message: String) {
        DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: message), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: message)
    }
    
    func popCurrent() {
        // dismiss current viewcontroller like back action
    }
}
