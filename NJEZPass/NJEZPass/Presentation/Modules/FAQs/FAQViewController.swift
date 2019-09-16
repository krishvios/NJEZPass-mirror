//
//  FAQViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 02/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

struct ViewTags {
    static let quesT = 11
    static let plusBtnT = 12
    static let ansT = 13
    static let ansCoantinerT = 14
}

protocol IFAQViewable {
//    func getFAQ(viewModel: ProfileModel.PresentionModel)
}

class FAQViewController: UITableViewController, UISearchResultsUpdating {

    var filteredTableData = [[AppKey.quesKey : "" , AppKey.ansKey : ""]]
    var resultSearchController = UISearchController()
    var selectedIndex : IndexPath? = nil
    var quesArr=[String]()

    let data =
        [
            // [AppKey.quesKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?" , AppKey.ansKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare."],
            
            [AppKey.quesKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?" , AppKey.ansKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare."],

            [AppKey.quesKey : "FGHIJ" , AppKey.ansKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare."],

            [AppKey.quesKey : "KLMNO" , AppKey.ansKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare.Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare."],

            [AppKey.quesKey : "PQRST" , AppKey.ansKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare.Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare."]
        
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        self.navigationItem.title = "FAQs"
        tableView.estimatedRowHeight = 44.0;
        tableView.rowHeight = UITableView.automaticDimension;
        
        // Reload the table
        tableView.reloadData()
        
        for item in data {
            let ques = item[AppKey.quesKey]
            print("ques = \(String(describing: ques))")
            quesArr.append(ques!)
        }
        print("quesArr = \(quesArr)")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        if  (resultSearchController.isActive) {
            return filteredTableData.count
        }
        return data.count
        
//        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQTableViewCell")
        let quesLabel = cell!.viewWithTag(ViewTags.quesT) as! UILabel
        let ansLabel = cell!.viewWithTag(ViewTags.ansT) as! UILabel
        let iconLabel = cell!.viewWithTag(ViewTags.plusBtnT) as! UILabel
        let ansBackView = cell!.viewWithTag(ViewTags.ansCoantinerT)!

        
        if (resultSearchController.isActive) {
            quesLabel.text = filteredTableData[indexPath.row][AppKey.quesKey]
            if let index = selectedIndex{
                if indexPath == index{
                    ansBackView.isHidden = false
                    ansLabel.text = filteredTableData[indexPath.row][AppKey.ansKey]
                    iconLabel.text = "-"
                    return cell!
                }
            }
            
            ansLabel.text = ""
            iconLabel.text = "+"
            ansBackView.isHidden = true
            return cell!
        }
        
        
        quesLabel.text = data[indexPath.row][AppKey.quesKey]
        if let index = selectedIndex{
            if indexPath == index{
                ansBackView.isHidden = false
                ansLabel.text = data[indexPath.row][AppKey.ansKey]
                iconLabel.text = "-"
                return cell!
            }
        }

        ansLabel.text = ""
        iconLabel.text = "+"
        ansBackView.isHidden = true
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        guard let currentCell = tableView.cellForRow(at: indexPath)  else {
            return
        }
        let ansLabel = currentCell.viewWithTag(ViewTags.ansT) as! UILabel
        let iconLabel = currentCell.viewWithTag(ViewTags.plusBtnT) as! UILabel
        let ansBackView = currentCell.viewWithTag(ViewTags.ansCoantinerT)!

        tableView.beginUpdates()
        ansBackView.isHidden = !(ansBackView.isHidden)
        
        if (ansBackView.isHidden){  // Collapse
            selectedIndex = nil
            iconLabel.text = "+"
            ansLabel.text = ""
        }else{                  // Expand
            selectedIndex = indexPath
            iconLabel.text = "-"
            ansLabel.text = data[indexPath.row][AppKey.ansKey]
        }
        
        tableView.endUpdates()
        tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }
    
    // MARK: - Search Results Updating Delegate method

    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (quesArr as NSArray).filtered(using: searchPredicate)
        
        for item in data {
            let ques = item[AppKey.quesKey]
//            print("ques = \(String(describing: ques))")
            if array.contains(obj: ques){
                filteredTableData.append(item)
            }
        }
        print("filteredTableData = \(filteredTableData)")

        self.tableView.reloadData()
    }
}

extension Array {
    func contains<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}
