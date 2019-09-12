//
//  PaymentStatusViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 06/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class PaymentStatusViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backClicked(){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func okButtonClicked(){
        self.navigationController?.popToRootViewController(animated: true)
    }
}
