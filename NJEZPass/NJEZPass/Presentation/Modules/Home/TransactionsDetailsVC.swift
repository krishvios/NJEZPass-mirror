//
//  TransactionsDetailsvc.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 26/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import Entities

class TransactionsDetailsVC: UIViewController {
    
    var transactionDetails: ProfileModel.TollTxList? = nil

    @IBOutlet weak var transactionAmount: UILabel!
    @IBOutlet weak var transactionLblTxt: UILabel!
    
    @IBOutlet weak var transactionDateLbl: UILabel!
    @IBOutlet weak var plateNumberLbl: UILabel!
    @IBOutlet weak var agencyLbl: UILabel!
    @IBOutlet weak var transactionDescriptionLbl: UILabel!
    @IBOutlet weak var entryTimeLbl: UILabel!
    @IBOutlet weak var exitTimeLbl: UILabel!
    @IBOutlet weak var exitPlazaLbl: UILabel!
    @IBOutlet weak var exitLaneLbl: UILabel!
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navBar.title = transactionDetails?.exitPlazaName ?? "-"
//        transactionAmount.text = transactionDetails?.amount ?? "-"
//        transactionDateLbl.text = transactionDetails?.transactionDate ?? "-"
//        plateNumberLbl.text = transactionDetails?.tagorplate ?? "-"
//        agencyLbl.text = transactionDetails?.agencyShortName ?? "-"
//        transactionDescriptionLbl.text = transactionDetails?.tollTxListDescription ?? "-"
//        entryTimeLbl.text = "-" 
//        exitTimeLbl.text = "-"
//        exitPlazaLbl.text = transactionDetails?.exitPlazaName ?? "-"
//        exitLaneLbl.text = transactionDetails?.exitLane ?? "-"
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
