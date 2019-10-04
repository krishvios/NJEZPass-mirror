//
//  SearchBarCustom.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 03/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class SearchBarCustom: UISearchBar {
    var preferredFont : UIFont!
    var preferredTextColor: UIColor!
    
    override func draw(_ rect: CGRect) {
       
        if let index = indexOfSearchFieldInSubviews() {
            let searchField: UITextField = (subviews[0] ).subviews[index] as! UITextField
            searchField.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
            searchField.font = preferredFont
            searchField.borderStyle = .none
            searchField.textColor = preferredTextColor
            
            let startPoint = CGPoint(x: 0, y: frame.size.height)
            let endPoint = CGPoint(x: frame.size.width, y: frame.size.height)
            let path = UIBezierPath()
            path.move(to: startPoint)
            path.addLine(to: endPoint)
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = preferredTextColor.cgColor
            shapeLayer.lineWidth = 1
            searchField.layer.addSublayer(shapeLayer)
           // layer.addSublayer(shapeLayer)
            
            
            
//
//            let imageView = UIImageView()
//            let image = UIImage(named: "checkbox")
//
//            imageView.image = image;
//            imageView.frame = CGRect(x: -20, y: -20, width: 40, height: 40)
//            searchField.leftView = imageView
//            searchField.leftViewMode = UITextField.ViewMode.always
        }
        
       
        super.draw(rect)
    }
    
    
    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        searchBarStyle = UISearchBar.Style.default
        barTintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        isTranslucent = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func indexOfSearchFieldInSubviews() -> Int! {
        // Uncomment the next line to see the search bar subviews.
        // println(subviews[0].subviews)
        
        var index: Int!
        let searchBarView = subviews[0]
        
        for i in 0..<searchBarView.subviews.count {
            if searchBarView.subviews[i].isKind(of: UITextField.self) {
                index = i
                break
            }
        }
        
        return index
    }
}
