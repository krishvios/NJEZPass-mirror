//
//  TableViewTest.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 08/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import Foundation
import UIKit

class DropDownViewWithTableView: UIView {

    var txtSample: BorderedTextField!
    let salutations = ["", "Mr.", "Ms.", "Mrs."]
    func loadDropDownViewData() {
        let tableView = DropDownTblView(dropDownData: salutations, dropdownField: txtSample)
        tableView.backgroundColor = .red

        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: txtSample.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: txtSample.widthAnchor),
            tableView.leftAnchor.constraint(equalTo: txtSample.leftAnchor, constant: 5),
            tableView.heightAnchor.constraint(equalToConstant: 65.0)
            ])
        tableView.translatesAutoresizingMaskIntoConstraints = false

    }
}
