//
//  TagsViewController.swift
//  ezPass
//
//  Created by Gudavarthi, Pardhu on 18/07/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities
import Domain
import Platform
import MBProgressHUD

protocol ITagsViewable {
    func getTagsSuccess(viewModel: TagsModel.PresentionModel)
    func getTagsFailed(viewModel: TagsModel.PresentionModel)
    func searchTagwithNumberSuccess(viewModel: SearchTagsModel.PresentionModel)
    func searchTagwithNumberFailed(viewModel: SearchTagsModel.PresentionModel)
}

class TagsViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchBar: SearchBarCustom!
    @IBOutlet weak var reportStolenBtnLbl: CMButton!
    @IBOutlet weak var reportLostBtnLbl: CMButton!
    
    var interactor: ITagsInteractable?
    var router: IRouter?
    
    var buttontapped = 1
    var searchActive : Bool = false
    
    var data = ["02210005166","0221000514"]
    var filtered:[String] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
           super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
           setup()
       }
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setup()
       }
       
       private func setup() {
           let configurator = TagsConfigurator()
           configurator.build(viewController: self)
           interactor = configurator.interactor
           router = configurator.router
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        searchBar.preferredFont = UIFont.systemFont(ofSize: 14)
        searchBar.preferredTextColor = UIColor.gray
        searchBar.searchTextPositionAdjustment = UIOffset(horizontal: 10, vertical: 0)
        searchBar.delegate = self
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        interactor?.getTagsList(action: APIConstants.ServiceNames.tagsService, requestType: .remote)
               
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        tblView.keyboardDismissMode = .onDrag
        tblView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupTableView() {
        tblView.estimatedRowHeight = 100
        tblView.rowHeight = UITableView.automaticDimension
        tblView.keyboardDismissMode = .onDrag
    }
        
    @IBAction func reportLostTapped(_ sender: Any) {
        buttontapped = 1
        self.performSegue(withIdentifier: "showReport", sender: self)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func reportStolenTapped(_ sender: Any) {
        buttontapped = 2
        self.performSegue(withIdentifier: "showReport", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReport" {
            switch buttontapped {
                case 1:
                let nextVC = segue.destination as! ReportLostorStolenVC
                nextVC.reportFlow = 1
                case 2:
                let nextVC = segue.destination as! ReportLostorStolenVC
                nextVC.reportFlow = 2
                default:
                break
            }
        } else {
            if segue.identifier == "showRequestTags" {
                let nextVC = segue.destination as! RequestTagVC
                nextVC.requestFlowStr = "requestTagFlow"
            } else if segue.identifier == "showRequestSuppliesTags" {
                let nextVC = segue.destination as! RequestTagVC
                nextVC.requestFlowStr = "requestTagSuppliesFlow"
            }
        }
    }
}

extension TagsViewController :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = "ActivityCell"
        switch indexPath.row {
        case data.count :
            cellIdentifier = "RequestTagCell"
            let cell: RequestTagsorTagSuppliesCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RequestTagsorTagSuppliesCell
            cell.delegate = self
            return cell
        case data.count + 1 :
            cellIdentifier = "RequestTagSupplies"
            let cell: RequestTagsorTagSuppliesCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RequestTagsorTagSuppliesCell
            cell.delegate = self
            return cell
        default:
            
            if(searchActive){
            let cell : AccountActivityCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AccountActivityCell
            cell.moreButtonAction.isHidden = false
            cell.statusColor.isHidden = true
            cell.activityTime.isHidden = true
            cell.accountDetailsorTagDetails.text = "Tag Type: Interior"
            cell.accountDetailsorTagDetails.textColor = #colorLiteral(red: 0.3333333333, green: 0.3568627451, blue: 0.3529411765, alpha: 1)
            cell.activityType.text = filtered[indexPath.row]
            cell.Activity.text = "Active"
            cell.delegate = self
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
            } else {
                let cell : AccountActivityCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AccountActivityCell
                cell.moreButtonAction.isHidden = false
                cell.statusColor.isHidden = true
                cell.activityTime.isHidden = true
                
                cell.accountDetailsorTagDetails.text = "Tag Type: Interior"
                cell.accountDetailsorTagDetails.textColor = #colorLiteral(red: 0.3333333333, green: 0.3568627451, blue: 0.3529411765, alpha: 1)
                cell.activityType.text = data[indexPath.row]
                cell.Activity.text = "Active"
                cell.delegate = self
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
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return data.count + 2
    }
}

extension TagsViewController : RequesTagorSuppliesdelegate {
    func requestTagsTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showRequestTags", sender: self)
    }
    
    func requestSuppliesTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showRequestSuppliesTags", sender: self)
    }
    
    
}

extension TagsViewController: ActivityDelegate {
    func moreButtonActionTapped(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let reportLost = UIAlertAction(title: "Report Lost", style: .default) {_ in
            self.buttontapped = 1
             self.performSegue(withIdentifier: "showReport", sender: self)
        }
        let reportStolen = UIAlertAction(title: "Report Stolen", style: .default) {_ in
            self.buttontapped = 2
            self.performSegue(withIdentifier: "showReport", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(reportLost)
        optionMenu.addAction(reportStolen)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
}

extension TagsViewController : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: String = text
            return tmp.contains(searchText)
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tblView.reloadData()
    }
}

extension TagsViewController: ITagsViewable {
    
    func getTagsSuccess(viewModel: TagsModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func getTagsFailed(viewModel: TagsModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func searchTagwithNumberSuccess(viewModel: SearchTagsModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func searchTagwithNumberFailed(viewModel: SearchTagsModel.PresentionModel) {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension TagsViewController: IRoutable {
    func showMessage(message: String) {
        DialogUtils.shared.displayDialog(title: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.appName), message: Localizer.sharedInstance.localizedStringForKey(key: message), btnTitle: Localizer.sharedInstance.localizedStringForKey(key: AppStringKeys.ok), vc: self, accessibilityIdentifier: message)
    }
    
    func popCurrent() {
        // dismiss current viewcontroller like back action
    }
}
