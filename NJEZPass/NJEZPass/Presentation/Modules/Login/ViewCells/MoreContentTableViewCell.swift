//
//  MoreContentTableViewCell.swift
//  NJEZPass
//
//  Created by Muddika, Ramesh yadav on 16/09/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

protocol MoreContentCellDelegate:class {
    func payViolationorTollBillClicked(_ sender: Any)
    func registerAccountClicked(_ sender: Any)
}

class MoreContentTableViewCell: UITableViewCell {

    @IBOutlet weak var payVoilationorTollBillView: CMView!
    @IBOutlet weak var payViolationorTollBillLbl: UILabel!
    @IBOutlet weak var registerYourAccountView: CMView!
    @IBOutlet weak var registerYourAccountLbl: UILabel!
    
    weak var moreContentsDelegate : MoreContentCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func payViolationorTollBillClicked(_ sender: Any) {
        moreContentsDelegate?.payViolationorTollBillClicked(sender)
    }
    
    @IBAction func registerAccountClicked(_ sender: Any) {
        moreContentsDelegate?.registerAccountClicked(sender)
    }
}
