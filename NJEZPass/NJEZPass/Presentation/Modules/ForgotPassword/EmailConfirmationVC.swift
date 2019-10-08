//
//  EmailConfirmationVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 18/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class EmailConfirmationVC: UIViewController {
    
    @IBOutlet weak var emailConfirmationLbl: UILabel!
    @IBOutlet weak var emailConfirmationTxt: UILabel!
    @IBOutlet weak var continueBtnTxt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func backButtonClick(sender : UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
        dismiss(animated: true, completion: nil)
    }
}
