//
//  ProfileNavigationCell.swift
//  NJEZPass
//
//  Created by Amirapu, Vivek (External) on 13/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

enum ViewChosen:Int {
    case accountView = 1
    case transactionsView = 2
    case vehiclesView = 3
    case tagsView = 4
}

protocol ProfileNavigationCellDelegate:class
{
    func flowChosen(viewChosen:ViewChosen) -> Void
}

class ProfileNavigationCell: UITableViewCell {

    @IBOutlet weak var availableBalance: UILabel!
    @IBOutlet weak var violationsBalance: UILabel!
    
    @IBOutlet var accountFlowView: UIView!
    @IBOutlet var transactionFlowView: UIView!
    @IBOutlet var vehiclesFlowView: UIView!
    @IBOutlet var tagsFlowView: UIView!
    
    weak var delegate:ProfileNavigationCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewSelected(_:)))
        
        accountFlowView.addGestureRecognizer(tapGesture)
        transactionFlowView.addGestureRecognizer(tapGesture)
        vehiclesFlowView.addGestureRecognizer(tapGesture)
        tagsFlowView.addGestureRecognizer(tapGesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setAvailableBalance() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.availableBalance.text = "$ \(String(describing: appDelegate!.detailInfo?.financialInformation?.currentBalance))"
    }
    
    public func setViolationsBalance() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.violationsBalance.text = "$ \(String(describing: appDelegate!.detailInfo?.financialInformation?.violationBalance))"
    }

    /*
    @discardableResult func addTapToDismissGesture(to view: UIView?) -> UITapGestureRecognizer? {
        guard enableTapToDismissGesture else { return nil }
        return UITapGestureRecognizer(addTo: view, target: self, action: #selector(handleDismissMenuTap(_:)))?.with {
            $0.cancelsTouchesInView = false
        }
    }
    */
    
    @objc func viewSelected(_ tap: UITapGestureRecognizer) {
        delegate?.flowChosen(viewChosen: ViewChosen(rawValue: (tap.view?.tag)!)!)
    }
}
