//
//  LoginMethodsTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 10/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Apollo_iOS

protocol LoginMethodsCellDelegate:class {
    func loginClicked(_ sender: Any)
    func signinClicked(_ sender: Any)
    func forgotPasswordClicked(_ sender: Any)
    func forgotUserNameCllicked(_ sender: Any)
}

class LoginMethodsTableViewCell: UITableViewCell {


    @IBOutlet weak var txtUserID: ApolloTextInputField!
    @IBOutlet weak var txtPassword: ApolloTextInputField! {
        didSet {
            txtPassword.validationType = .password
        }
    }
    @IBOutlet weak var signUPButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var rememberMe: UISwitch!

     weak var loginDelegate: LoginMethodsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        signUPButton.backgroundColor = .clear
        signUPButton.layer.borderWidth = 1
        signUPButton.layer.borderColor = #colorLiteral(red: 0.4117647059, green: 0.1254901961, blue: 0.4941176471, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func loginClicked(_ sender: Any) {
        loginDelegate?.loginClicked(sender)
    }
    
    @IBAction func signinClicked(_ sender: Any) {
        loginDelegate?.signinClicked(sender)
    }
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        loginDelegate?.forgotPasswordClicked(sender)
    }
    @IBAction func forgotUserNameCllicked(_ sender: Any) {
        loginDelegate?.forgotUserNameCllicked(sender)
    }
}
