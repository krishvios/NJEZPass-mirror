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
        setNavBar()
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.isHidden = false
        //        let navImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 256, height: 16))
        //        navImageView.contentMode = .scaleAspectFit
        //        let navImage = UIImage(named: "navHeaderImage")
        //        navImageView.image = navImage
        navigationItem.titleView = UIImageView(image: UIImage(named: "navHeaderImage"))
        
         self.navigationController?.navigationBar.tintColor = .purple
//        let btn = UIButton(type: .custom)
//        btn.setImage(UIImage(named: "purpleArrow"), for: .normal)
//        btn.addTarget(self, action: #selector (backButtonClick(sender:)), for: .touchUpInside)
//        let item1 = UIBarButtonItem(customView: btn)
//        self.navigationItem.setLeftBarButton(item1, animated: true)
    }
    
    @objc func backButtonClick(sender : UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "UserFlow", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "LandingVC") as! LandingVC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
        dismiss(animated: true, completion: nil)
    }
}
