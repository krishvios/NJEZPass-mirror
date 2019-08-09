//
//  DialogUtils.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 03/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit

class DialogUtils {
    static let shared = DialogUtils()
    func displayDialog(title: String, message: String, btnTitle: String, vc: UIViewController, accessibilityIdentifier: String) {
       DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.view.accessibilityIdentifier = accessibilityIdentifier
            alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
}
