//
//  ReportLostorStolenVC.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 04/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class ReportLostorStolenVC: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var continuneBtnLbl: CMButton!
    
    @IBOutlet weak var acknowledgeSwitch: UISwitch!
    @IBOutlet weak var lostorStolenDescriptionLbl: UILabel!
    @IBOutlet weak var tagNumberTxt: UILabel!
    @IBOutlet weak var tagNumberLbl: UILabel!
    
    @IBOutlet weak var statusTxt: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    @IBOutlet weak var newStatusTxt: UILabel!
    @IBOutlet weak var newStatusLbl: UILabel!
    
    @IBOutlet weak var replacementTxt: UILabel!
    
    var reportFlow  = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        switch reportFlow {
        case 1:
            navBar.topItem?.title = "Report Lost"
            lostorStolenDescriptionLbl.text = "Your tag status will be changed to lost and you will be liable for the tag fee."
        case 2:
            navBar.topItem?.title = "Report Stolen"
            lostorStolenDescriptionLbl.text = "Your tag status will be changed to stolen and you will be liable for the tag fee."
        default:
            navBar.topItem?.title = "Report Lost"
            lostorStolenDescriptionLbl.text = "Your tag status will be changed to lost and you will be liable for the tag fee."
        }
    }
    
    @IBAction func backButtontapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "showVerifyScreen", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let nextVC = segue.destination as! VerifyLostorStolenVC
             nextVC.reportFlow = self.reportFlow
        }

}
