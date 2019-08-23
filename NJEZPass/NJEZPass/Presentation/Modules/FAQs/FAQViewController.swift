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

class FAQViewController: UITableViewController {
    let data =
        [
        
        [K.AppKey.quesKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?" , K.AppKey.ansKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare."],
                
    [K.AppKey.quesKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?" , K.AppKey.ansKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare."],
    
    [K.AppKey.quesKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?" , K.AppKey.ansKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare.Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare."],
        
         [K.AppKey.quesKey : "Lorem ipsum dolor sit amet, consectetur ?" , K.AppKey.ansKey : "Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare.Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare?Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit mauris lobortis ornare."]
        
                ]
    
    var selectedIndex : IndexPath? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "FAQs"
        tableView.estimatedRowHeight = 44.0;
        tableView.rowHeight = UITableView.automaticDimension;
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQTableViewCell")
        let quesLabel = cell!.viewWithTag(ViewTags.quesT) as! UILabel
        let ansLabel = cell!.viewWithTag(ViewTags.ansT) as! UILabel
        let iconLabel = cell!.viewWithTag(ViewTags.plusBtnT) as! UILabel
        let ansBackView = cell!.viewWithTag(ViewTags.ansCoantinerT)!

        
        quesLabel.text = data[indexPath.row][K.AppKey.quesKey]
        if let index = selectedIndex{
            if indexPath == index{
                ansBackView.isHidden = false
                ansLabel.text = data[indexPath.row][K.AppKey.ansKey]
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
            ansLabel.text = data[indexPath.row][K.AppKey.ansKey]
        }
        
        tableView.endUpdates()
        tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }
}
