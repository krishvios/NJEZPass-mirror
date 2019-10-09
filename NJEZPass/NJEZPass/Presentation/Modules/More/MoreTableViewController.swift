//
//  MoreTableViewController.swift
//  NJEZPass
//
//  Created by Alam, Sk on 30/09/2019.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

enum MoreListOption:Int {
    case Statements
    case Correspondence
    case FAQ
    case ContactUs
    case Settings
    case TermsConditions
    case Logout
    
    var textString : String {
        get {
            switch self {
            case .Statements: return "Statements"
            case .Correspondence: return "Correspondence"
            case .FAQ: return "FAQ"
            case .ContactUs:return "ContactUs"
            case .Settings:return "Settings"
            case .TermsConditions:return "Terms & Conditions"
            case .Logout:return "Logout"
            }
        }
    }
}



class MoreTableViewController: UITableViewController {

    @IBOutlet weak var documentCell: UITableViewCell!
    var arrMoreList =  [MoreListOption.Statements,MoreListOption.Correspondence,MoreListOption.FAQ,MoreListOption.ContactUs,MoreListOption.Settings,MoreListOption.TermsConditions,MoreListOption.Logout]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
       let nib = UINib(nibName: String(describing: LabelTableViewCell.self), bundle: nil)
       
        tableView.register(nib, forCellReuseIdentifier: String(describing: LabelTableViewCell.self))
    }

  
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrMoreList.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell
        
       // let optionName = "\(arrMoreList[indexPath.row])"   // or `let cityName = String(city)`

        cell.cellLabel.text = arrMoreList[indexPath.row].textString
        // Configure the cell...

        return cell
    }
   

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let didSelectedIndex = MoreListOption(rawValue: indexPath.row) else{
            return
        }
        
        switch didSelectedIndex {
        case .Statements:
            self.navigateToStatement()
        case .Correspondence:
        performSegue(withIdentifier: "showCorrespondence", sender: nil)
        case .FAQ:
        performSegue(withIdentifier: "faq", sender: nil)

        case .ContactUs:
            performSegue(withIdentifier: "contactUs", sender: nil)

        case .Settings:
        performSegue(withIdentifier: "settings", sender: nil)

        case .TermsConditions:
        self.navigateToTermsAndCondition()
        case .Logout:break
            
        }
    }
   
    func navigateToStatement() {
        let webViewVC = WebViewVC ()
        webViewVC.navTitle = "Statements"
        webViewVC.urlString = "https://www.google.com"
        self.navigationController?.pushViewController(webViewVC, animated: true)
    }
    
    func navigateToTermsAndCondition() {
        let webViewVC = WebViewVC ()
        webViewVC.navTitle = "Terms & Conditions"
        webViewVC.urlString = "https://www.google.com"
        self.navigationController?.pushViewController(webViewVC, animated: true)

    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  

}
