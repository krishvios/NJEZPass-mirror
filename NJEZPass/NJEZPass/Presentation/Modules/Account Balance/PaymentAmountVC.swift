//
//  PaymentAmountVC.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 21/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit


class PaymentAmountVC: UIViewController {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var continueButton: CMButton!
    @IBOutlet weak var numberPadCollectionView: UICollectionView!
    
    var enteredText = String()
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "0", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor(red: 105/255, green: 32/255, blue: 126/255, alpha: 1.0).cgColor,
            UIColor(red: 19/255, green: 140/255, blue: 145/255, alpha: 1.0).cgColor
            ])
        self.navigationController?.navigationBar.tintColor = .white
        
        continueButton.borderWidth = 1.0
        continueButton.borderColor = UIColor.white
        continueButton.cornerRadius = 4.0
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showPaymentScreen", sender: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! PayNowVC
        nextVC.flowString = "balanceIncrease"
    }
}


extension PaymentAmountVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(NumberPadCell.self)", for: indexPath as IndexPath) as! NumberPadCell
        if indexPath.row == self.items.count - 1 {
            cell.numberButton.setImage( imageLiteral(resourceName: "whiteArrow"), for: .normal)
        } else {
            cell.numberButton.setTitle(self.items[indexPath.item], for: .normal)
        }
        
        cell.didSelectButton = {
            if self.items[indexPath.item] != "." {
                self.amountLabel.adjustsFontSizeToFitWidth = true
                self.amountLabel.minimumScaleFactor = 0.5
                self.enteredText = self.enteredText + self.items[indexPath.item]
                if indexPath.row == self.items.count - 1 && self.enteredText.count > 0 {
                    self.enteredText = String(self.enteredText.dropLast())
                }
                if self.enteredText.count == 0 {
                    self.amountLabel.text = "$0.00"
                } else {
                    self.amountLabel.text = "\((Int(self.enteredText) ?? 0).withCommas())"
                }
            }
        }
        return cell
    }
}


extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
