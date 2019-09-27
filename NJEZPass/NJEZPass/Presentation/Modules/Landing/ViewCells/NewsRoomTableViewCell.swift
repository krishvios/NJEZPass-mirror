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
    @IBOutlet weak var carouselView: iCarousel!
    
    
    weak var newsRoomDelegate: NewsRoomTableCellDelegate?
    var items: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for _ in 0 ... 4 {
            items.append("Login to your account to verify that we have the most up to date contact information [phone number(s) and e-mail address]. If you think your account has been compromised please call us immediately at 1-888-288-6865")
        }
        carouselView.type = .linear
        carouselView.isPagingEnabled = true
        carouselView.clipsToBounds = true
        carouselView.bounces = false
        pageControl.numberOfPages = 4
    }
    
    @IBAction func didChangeValue(_ sender: Any) {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension NewsRoomTableViewCell: iCarouselDelegate,iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 4
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        var itemView: UIImageView
        if let view = view as? UIImageView {
            itemView = view
            
            label = itemView.viewWithTag(1) as! UILabel
        } else {
            
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 280, height: 124))
            label = UILabel(frame: itemView.bounds)
            label.backgroundColor = .clear
            label.textAlignment = .center
            label.lineBreakMode = .byWordWrapping
            label.font = UIFont(name:"Open Sans",size:14)
            label.numberOfLines = 8
            label.tag = 1
            itemView.addSubview(label)
        }
        label.text = "\(items[index])"
        pageControl.currentPage =  carouselView.currentItemIndex
        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .wrap) {
            return 1
        }
        if(option == .spacing) {
            return 2
        }
        return value
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        
    }
}

