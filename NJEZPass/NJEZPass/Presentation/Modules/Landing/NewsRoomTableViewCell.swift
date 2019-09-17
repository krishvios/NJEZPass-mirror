//
//  NewsRoomTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 11/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit


protocol NewsRoomTableCellDelegate:class {
    func newsRoomView()
  
}

class NewsRoomTableViewCell: UITableViewCell {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    weak var newsRoomDelegate: NewsRoomTableCellDelegate?
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   
     
    }

    @IBAction func didChangeValue(_ sender: Any) {
    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
       
       
    }
    func didChangePageControlValue() {
  
    }

    
}

