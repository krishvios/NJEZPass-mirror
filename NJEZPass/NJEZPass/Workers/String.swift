//
//  String.swift
//  NJEZPass
//
//  Created by Anshu Sharma on 30/07/19.
//  Copyright © 2019 Anshu Sharma. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var localized: String {
//        if (self == "Face ID"){
//            return "abc"
//        }
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let language = appDelegate.selectedLanguage
//
//        if(language == .spanish){
////            return Bundle.base.path(forResource: "Localizable", ofType: "strings", inDirectory: "/", forLocalization: "Spanish") ?? ""
//            let s = Bundle.base.localizedString(forKey: self, value: nil, table: "Spanish")
//            return s
//
//
//        }else{
        return NSLocalizedString(self, comment: "")
//        }
    }
}


extension Bundle {
    static let base: Bundle = {
        if let path = Bundle.main.path(forResource: "Base", ofType: "lproj") {
            if let baseBundle = Bundle(path: path) {
                return baseBundle
            }
        }
        return Bundle.main
    }()
}

