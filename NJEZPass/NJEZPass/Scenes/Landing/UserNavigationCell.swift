//
//  UserNavigationCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 07/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol UserNavigationCellDelegate:class {
    func navigateToSignUp()
    func navigateToLogin()
    func selectLanguageClicked(_ sender: Any)
}

class UserNavigationCell: UITableViewCell {

    @IBOutlet weak var signUpView: CMView!
    @IBOutlet weak var loginView: CMView!
//    @IBOutlet weak var loginView: CMView!

    
    @IBOutlet weak var selectLanguageButton: UIButton!
    
    weak var delegate: UserNavigationCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleUserNavigation(_:)))
        
        signUpView.addGestureRecognizer(gestureRecognizer)
        loginView.addGestureRecognizer(gestureRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func handleUserNavigation(_ gesture: UIPanGestureRecognizer) {
        
        switch gesture.view {
            
        case loginView:
            delegate?.navigateToLogin()
            break
            
        case signUpView:
            delegate?.navigateToSignUp()
            break
        case .none:
            break
        case .some(_):
            break
        }
    }
    
    @IBAction func selectLanguageClicked(_ sender: Any) {
        delegate?.selectLanguageClicked(sender)
    }
}
