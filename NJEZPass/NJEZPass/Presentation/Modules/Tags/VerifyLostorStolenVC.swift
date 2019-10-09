//
//  VerifyLostorStolenVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 04/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class VerifyLostorStolenVC: UIViewController {
    
    var reportFlow  = 0

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var continueButtonLbl: CMButton!
    @IBOutlet weak var acknowledgeSwitch: UISwitch!
    @IBOutlet weak var acknowlwdgwSwitchLbl: UILabel!
    @IBOutlet weak var lostorStolenDescriptionLbl: UILabel!
    @IBOutlet weak var tagNumberTxt: UILabel!
    @IBOutlet weak var tagNumberLbl: UILabel!
    @IBOutlet weak var statusTxt: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var newStatusTxt: UILabel!
    @IBOutlet weak var newStatusLbl: UILabel!
    @IBOutlet weak var feeTxt: UILabel!
    @IBOutlet weak var feeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch reportFlow {
        case 1:
            navBar.topItem?.title = "Verify Lost Tag"
            acknowlwdgwSwitchLbl.text = "I acknowledge that I am responsible for all transactions until the tag is marked lost as described in the terms and conditions."
        case 2:
            navBar.topItem?.title = "verify Stolen Tag"
            acknowlwdgwSwitchLbl.text = "I acknowledge that I am responsible for all transactions until the tag is marked stolen as described in the terms and conditions."
        default:
            navBar.topItem?.title = "Verify Lost Tag"
            acknowlwdgwSwitchLbl.text = "I acknowledge that I am responsible for all transactions until the tag is marked lost as described in the terms and conditions."
        }
        
        continueButtonLbl.isEnabled = false
        acknowledgeSwitch.setOn(false, animated: false)
        acknowledgeSwitch.addTarget(self, action: #selector(acknowledgeswitchChanged), for: UIControl.Event.valueChanged)
        toggleLoginButtonColor()
    }
    
    func toggleLoginButtonColor() {
        if continueButtonLbl.isEnabled {
            continueButtonLbl.backgroundColor = #colorLiteral(red: 0.4641762972, green: 0.2112366259, blue: 0.5424402356, alpha: 1)
        } else {
            continueButtonLbl.backgroundColor = #colorLiteral(red: 0.4489307404, green: 0.09403731674, blue: 0.5118483901, alpha: 0.5)
        }
    }
    
    @objc func acknowledgeswitchChanged(mySwitch: UISwitch) {
        if acknowledgeSwitch.isOn {
            continueButtonLbl.isEnabled = true
            toggleLoginButtonColor()
        }
        else
        {
            continueButtonLbl.isEnabled = false
            toggleLoginButtonColor()
        }
    }
    
    @IBAction func continueTapped(_ sender: Any) {
        performSegue(withIdentifier: "showSignup", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch reportFlow {
        case 1:
            let nextScene =  segue.destination as! SignupAndSaveVC
            nextScene.flowString = "requestLostFlow"
        case 2:
            let nextScene =  segue.destination as! SignupAndSaveVC
            nextScene.flowString = "requestStolenFlow"
        default:
            let nextScene =  segue.destination as! SignupAndSaveVC
            nextScene.flowString = "requestLostFlow"
        }
       
    }
   
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
