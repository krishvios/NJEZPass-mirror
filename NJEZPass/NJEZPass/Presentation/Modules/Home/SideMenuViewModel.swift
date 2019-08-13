//
//  SideMenuViewModel.swift
//  NJEZPass
//
//  Created by N, Narasimhulu on 13/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class SideMenuViewModel {
    let items = ["Home", "Account", "Transactions", "Vehicles", "Tags", "Violation", "FAQs", "Contact Us", "Log Out"]
    
    func menuItem(with index: Int) -> String {
        return items[index]
    }
}
