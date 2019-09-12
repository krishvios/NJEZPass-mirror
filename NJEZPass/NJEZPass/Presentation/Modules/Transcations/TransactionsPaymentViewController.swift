//
//  TransactionsPaymentViewController.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 06/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class TransactionsPaymentViewController: UIViewController {
    
    @IBOutlet weak var amountLabel: UILabel!
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
        
        
        // iPhone SE Alignments
        if self.view.frame.size.width==320 {
            let flow = UICollectionViewFlowLayout()
            flow.itemSize = CGSize(width: 84, height: 66)
            flow.scrollDirection = .vertical
            flow.minimumInteritemSpacing = 8;
            flow.minimumLineSpacing = 8;
            
            self.numberPadCollectionView.setCollectionViewLayout(flow, animated: true)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func backClicked(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
//    TransactionsPaymentViewController
    @IBAction func continueClicked(){
        
    }
}

extension TransactionsPaymentViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(NumberPadCell.self)", for: indexPath as IndexPath) as! NumberPadCell
        if indexPath.row == self.items.count - 1 {
            cell.numberButton.setImage(#imageLiteral(resourceName: "whiteArrow"), for: .normal)
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

//extension Int {
//    func withCommas() -> String {
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = NumberFormatter.Style.currency
//        return numberFormatter.string(from: NSNumber(value:self))!
//    }
//}

