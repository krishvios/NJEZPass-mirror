//
//  TransactionsDetailsvc.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 26/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class TransactionsDetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Scudder Falls Bridge"
    }
    

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
